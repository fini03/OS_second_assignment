#include <fstream>
#include <iostream>
#include <filesystem>
#include <vector>
#include <string>
#include <sstream>
#include <cstring>
#include <map>
#include <algorithm>

	
struct Node{
	std::string pid;
	std::string name;
	std::vector<std::string> children;

	Node(std::string pid, std::string name, std::vector<std::string> children = {}) : pid{pid}, name{name}, children{children} {}
		
	void add_child(std::string n){
		this->children.push_back(n);
	}

	std::string print_node(std::map<std::string, Node*>* ptr){
		std::string out{};
		out += "{";
		out = out + "\"pid\":" + this->pid;
		out = out + ",\"name\":" + "\"" + this->name + "\"";
		out = out + ",\"children\":[";

		bool first {true};
		for(auto& child : children) {
			if (!first) out += ",";
			else first = false;
			if ((*ptr).count(child))
				out += (*ptr)[child]->print_node(ptr);
			else
				out += child + " ";
		}
		out +="]}";

		return out;
	}

};
bool has_only_digits(const std::string& str){
	for(char const &c : str) {
		if( !std::isdigit(c) ) return false;
	}
	return true;
}
std::pair<std::string, std::string> find_ppid_and_name (std::string pid){
	const std::filesystem::path pid_path { std::string{"/proc/"} + pid + std::string{"/status"} };

	std::string status_line{};
	std::vector<std::string> status_lines{};
	std::string ppid_s{};
										
	std::string name;
	std::ifstream input_file(pid_path);
	for(int i{0};i<7;++i){
		getline(input_file,status_line);
		status_lines.push_back(status_line);
	}										 
	//ppid
	int counter{0};
	for(const auto& c : status_lines.at(6)){
		if(counter>=6)
			ppid_s += c;
		++counter;
	}							
	//Name
	counter = 0;
	for(const auto& c : status_lines.at(0)){
		if(counter>=6)
			name += c;
		++counter;
	}
	return { ppid_s, name };
}
int main(){
	std::map<std::string, Node*> tree;
	std::vector<std::string> big_bois;
	const std::filesystem::path proc{"/proc"};
	for(const auto& dir_entry : std::filesystem::directory_iterator{proc}){
		if(dir_entry.is_directory()){
			//PID
			std::string pid_s { dir_entry.path().filename() };

			if(has_only_digits(pid_s)){

				std::pair<std::string, std::string> ppid_and_name { find_ppid_and_name(pid_s) };
				std::string ppid_s { ppid_and_name.first };
				std::string name { ppid_and_name.second };
				
				Node* n;
				if ( !tree.count(pid_s) ) {
					n = new Node(pid_s, name);
				}
				else {
					n = tree[pid_s];
					n->name = name;					
				}
				if(ppid_s == "0") big_bois.push_back(pid_s);
				tree[pid_s] = n;

				if ( !tree.count(ppid_s) ) {
					if (pid_s == "894") std::cout << "yes" << " " << ppid_s<< std::endl << std::endl;
					tree[ppid_s] = new Node(ppid_s, "");
				}
				tree[ppid_s]->add_child(pid_s); // in tree[ppid_s], nicht tree[pid_s] adden
			}						 
		}		 
	}
	bool first {true};
	std::cout << "[";
	for (const auto& boi : big_bois) {
		if (!first) std::cout << ",";
		else first = false;
		std::cout << tree[boi]->print_node(&tree);
	}
	std::cout << "]";


	for (auto& n : tree)
		delete n.second;

	return 0;
}
