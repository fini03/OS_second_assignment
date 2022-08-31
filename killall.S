.intel_syntax noprefix
.text
.globl	procs
.global _start

.equ SYS_write, 0x1
.equ STDOUT, 1
.equ SYS_openat, 0x101
.equ AT_FDCWD, 0xffffff9c /* == -100 */
.equ O_RDONLY, 0x0
.equ SYS_kill, 0x3e
.equ SIGKILL, 9
.equ SYS_read, 0x0
.equ SYS_close, 0x03
.equ SYS_exit, 0x3c
.equ EXIT_SUCCESS, 0

.section	.rodata
.LC0:
	.string	"/proc/1/status"
.LC1:
	.string	"/proc/2/status"
.LC2:
	.string	"/proc/3/status"
.LC3:
	.string	"/proc/4/status"
.LC4:
	.string	"/proc/5/status"
.LC5:
	.string	"/proc/6/status"
.LC6:
	.string	"/proc/7/status"
.LC7:
	.string	"/proc/8/status"
.LC8:
	.string	"/proc/9/status"
.LC9:
	.string	"/proc/10/status"
.LC10:
	.string	"/proc/11/status"
.LC11:
	.string	"/proc/12/status"
.LC12:
	.string	"/proc/13/status"
.LC13:
	.string	"/proc/14/status"
.LC14:
	.string	"/proc/15/status"
.LC15:
	.string	"/proc/16/status"
.LC16:
	.string	"/proc/17/status"
.LC17:
	.string	"/proc/18/status"
.LC18:
	.string	"/proc/19/status"
.LC19:
	.string	"/proc/20/status"
.LC20:
	.string	"/proc/21/status"
.LC21:
	.string	"/proc/22/status"
.LC22:
	.string	"/proc/23/status"
.LC23:
	.string	"/proc/24/status"
.LC24:
	.string	"/proc/25/status"
.LC25:
	.string	"/proc/26/status"
.LC26:
	.string	"/proc/27/status"
.LC27:
	.string	"/proc/28/status"
.LC28:
	.string	"/proc/29/status"
.LC29:
	.string	"/proc/30/status"
.LC30:
	.string	"/proc/31/status"
.LC31:
	.string	"/proc/32/status"
.LC32:
	.string	"/proc/33/status"
.LC33:
	.string	"/proc/34/status"
.LC34:
	.string	"/proc/35/status"
.LC35:
	.string	"/proc/36/status"
.LC36:
	.string	"/proc/37/status"
.LC37:
	.string	"/proc/38/status"
.LC38:
	.string	"/proc/39/status"
.LC39:
	.string	"/proc/40/status"
.LC40:
	.string	"/proc/41/status"
.LC41:
	.string	"/proc/42/status"
.LC42:
	.string	"/proc/43/status"
.LC43:
	.string	"/proc/44/status"
.LC44:
	.string	"/proc/45/status"
.LC45:
	.string	"/proc/46/status"
.LC46:
	.string	"/proc/47/status"
.LC47:
	.string	"/proc/48/status"
.LC48:
	.string	"/proc/49/status"
.LC49:
	.string	"/proc/50/status"
.LC50:
	.string	"/proc/51/status"
.LC51:
	.string	"/proc/52/status"
.LC52:
	.string	"/proc/53/status"
.LC53:
	.string	"/proc/54/status"
.LC54:
	.string	"/proc/55/status"
.LC55:
	.string	"/proc/56/status"
.LC56:
	.string	"/proc/57/status"
.LC57:
	.string	"/proc/58/status"
.LC58:
	.string	"/proc/59/status"
.LC59:
	.string	"/proc/60/status"
.LC60:
	.string	"/proc/61/status"
.LC61:
	.string	"/proc/62/status"
.LC62:
	.string	"/proc/63/status"
.LC63:
	.string	"/proc/64/status"
.LC64:
	.string	"/proc/65/status"
.LC65:
	.string	"/proc/66/status"
.LC66:
	.string	"/proc/67/status"
.LC67:
	.string	"/proc/68/status"
.LC68:
	.string	"/proc/69/status"
.LC69:
	.string	"/proc/70/status"
.LC70:
	.string	"/proc/71/status"
.LC71:
	.string	"/proc/72/status"
.LC72:
	.string	"/proc/73/status"
.LC73:
	.string	"/proc/74/status"
.LC74:
	.string	"/proc/75/status"
.LC75:
	.string	"/proc/76/status"
.LC76:
	.string	"/proc/77/status"
.LC77:
	.string	"/proc/78/status"
.LC78:
	.string	"/proc/79/status"
.LC79:
	.string	"/proc/80/status"
.LC80:
	.string	"/proc/81/status"
.LC81:
	.string	"/proc/82/status"
.LC82:
	.string	"/proc/83/status"
.LC83:
	.string	"/proc/84/status"
.LC84:
	.string	"/proc/85/status"
.LC85:
	.string	"/proc/86/status"
.LC86:
	.string	"/proc/87/status"
.LC87:
	.string	"/proc/88/status"
.LC88:
	.string	"/proc/89/status"
.LC89:
	.string	"/proc/90/status"
.LC90:
	.string	"/proc/91/status"
.LC91:
	.string	"/proc/92/status"
.LC92:
	.string	"/proc/93/status"
.LC93:
	.string	"/proc/94/status"
.LC94:
	.string	"/proc/95/status"
.LC95:
	.string	"/proc/96/status"
.LC96:
	.string	"/proc/97/status"
.LC97:
	.string	"/proc/98/status"
.LC98:
	.string	"/proc/99/status"
.LC99:
	.string	"/proc/100/status"
.LC100:
	.string	"/proc/101/status"
.LC101:
	.string	"/proc/102/status"
.LC102:
	.string	"/proc/103/status"
.LC103:
	.string	"/proc/104/status"
.LC104:
	.string	"/proc/105/status"
.LC105:
	.string	"/proc/106/status"
.LC106:
	.string	"/proc/107/status"
.LC107:
	.string	"/proc/108/status"
.LC108:
	.string	"/proc/109/status"
.LC109:
	.string	"/proc/110/status"
.LC110:
	.string	"/proc/111/status"
.LC111:
	.string	"/proc/112/status"
.LC112:
	.string	"/proc/113/status"
.LC113:
	.string	"/proc/114/status"
.LC114:
	.string	"/proc/115/status"
.LC115:
	.string	"/proc/116/status"
.LC116:
	.string	"/proc/117/status"
.LC117:
	.string	"/proc/118/status"
.LC118:
	.string	"/proc/119/status"
.LC119:
	.string	"/proc/120/status"
.LC120:
	.string	"/proc/121/status"
.LC121:
	.string	"/proc/122/status"
.LC122:
	.string	"/proc/123/status"
.LC123:
	.string	"/proc/124/status"
.LC124:
	.string	"/proc/125/status"
.LC125:
	.string	"/proc/126/status"
.LC126:
	.string	"/proc/127/status"
.LC127:
	.string	"/proc/128/status"
.LC128:
	.string	"/proc/129/status"
.LC129:
	.string	"/proc/130/status"
.LC130:
	.string	"/proc/131/status"
.LC131:
	.string	"/proc/132/status"
.LC132:
	.string	"/proc/133/status"
.LC133:
	.string	"/proc/134/status"
.LC134:
	.string	"/proc/135/status"
.LC135:
	.string	"/proc/136/status"
.LC136:
	.string	"/proc/137/status"
.LC137:
	.string	"/proc/138/status"
.LC138:
	.string	"/proc/139/status"
.LC139:
	.string	"/proc/140/status"
.LC140:
	.string	"/proc/141/status"
.LC141:
	.string	"/proc/142/status"
.LC142:
	.string	"/proc/143/status"
.LC143:
	.string	"/proc/144/status"
.LC144:
	.string	"/proc/145/status"
.LC145:
	.string	"/proc/146/status"
.LC146:
	.string	"/proc/147/status"
.LC147:
	.string	"/proc/148/status"
.LC148:
	.string	"/proc/149/status"
.LC149:
	.string	"/proc/150/status"
.LC150:
	.string	"/proc/151/status"
.LC151:
	.string	"/proc/152/status"
.LC152:
	.string	"/proc/153/status"
.LC153:
	.string	"/proc/154/status"
.LC154:
	.string	"/proc/155/status"
.LC155:
	.string	"/proc/156/status"
.LC156:
	.string	"/proc/157/status"
.LC157:
	.string	"/proc/158/status"
.LC158:
	.string	"/proc/159/status"
.LC159:
	.string	"/proc/160/status"
.LC160:
	.string	"/proc/161/status"
.LC161:
	.string	"/proc/162/status"
.LC162:
	.string	"/proc/163/status"
.LC163:
	.string	"/proc/164/status"
.LC164:
	.string	"/proc/165/status"
.LC165:
	.string	"/proc/166/status"
.LC166:
	.string	"/proc/167/status"
.LC167:
	.string	"/proc/168/status"
.LC168:
	.string	"/proc/169/status"
.LC169:
	.string	"/proc/170/status"
.LC170:
	.string	"/proc/171/status"
.LC171:
	.string	"/proc/172/status"
.LC172:
	.string	"/proc/173/status"
.LC173:
	.string	"/proc/174/status"
.LC174:
	.string	"/proc/175/status"
.LC175:
	.string	"/proc/176/status"
.LC176:
	.string	"/proc/177/status"
.LC177:
	.string	"/proc/178/status"
.LC178:
	.string	"/proc/179/status"
.LC179:
	.string	"/proc/180/status"
.LC180:
	.string	"/proc/181/status"
.LC181:
	.string	"/proc/182/status"
.LC182:
	.string	"/proc/183/status"
.LC183:
	.string	"/proc/184/status"
.LC184:
	.string	"/proc/185/status"
.LC185:
	.string	"/proc/186/status"
.LC186:
	.string	"/proc/187/status"
.LC187:
	.string	"/proc/188/status"
.LC188:
	.string	"/proc/189/status"
.LC189:
	.string	"/proc/190/status"
.LC190:
	.string	"/proc/191/status"
.LC191:
	.string	"/proc/192/status"
.LC192:
	.string	"/proc/193/status"
.LC193:
	.string	"/proc/194/status"
.LC194:
	.string	"/proc/195/status"
.LC195:
	.string	"/proc/196/status"
.LC196:
	.string	"/proc/197/status"
.LC197:
	.string	"/proc/198/status"
.LC198:
	.string	"/proc/199/status"
.LC199:
	.string	"/proc/200/status"
.LC200:
	.string	"/proc/201/status"
.LC201:
	.string	"/proc/202/status"
.LC202:
	.string	"/proc/203/status"
.LC203:
	.string	"/proc/204/status"
.LC204:
	.string	"/proc/205/status"
.LC205:
	.string	"/proc/206/status"
.LC206:
	.string	"/proc/207/status"
.LC207:
	.string	"/proc/208/status"
.LC208:
	.string	"/proc/209/status"
.LC209:
	.string	"/proc/210/status"
.LC210:
	.string	"/proc/211/status"
.LC211:
	.string	"/proc/212/status"
.LC212:
	.string	"/proc/213/status"
.LC213:
	.string	"/proc/214/status"
.LC214:
	.string	"/proc/215/status"
.LC215:
	.string	"/proc/216/status"
.LC216:
	.string	"/proc/217/status"
.LC217:
	.string	"/proc/218/status"
.LC218:
	.string	"/proc/219/status"
.LC219:
	.string	"/proc/220/status"
.LC220:
	.string	"/proc/221/status"
.LC221:
	.string	"/proc/222/status"
.LC222:
	.string	"/proc/223/status"
.LC223:
	.string	"/proc/224/status"
.LC224:
	.string	"/proc/225/status"
.LC225:
	.string	"/proc/226/status"
.LC226:
	.string	"/proc/227/status"
.LC227:
	.string	"/proc/228/status"
.LC228:
	.string	"/proc/229/status"
.LC229:
	.string	"/proc/230/status"
.LC230:
	.string	"/proc/231/status"
.LC231:
	.string	"/proc/232/status"
.LC232:
	.string	"/proc/233/status"
.LC233:
	.string	"/proc/234/status"
.LC234:
	.string	"/proc/235/status"
.LC235:
	.string	"/proc/236/status"
.LC236:
	.string	"/proc/237/status"
.LC237:
	.string	"/proc/238/status"
.LC238:
	.string	"/proc/239/status"
.LC239:
	.string	"/proc/240/status"
.LC240:
	.string	"/proc/241/status"
.LC241:
	.string	"/proc/242/status"
.LC242:
	.string	"/proc/243/status"
.LC243:
	.string	"/proc/244/status"
.LC244:
	.string	"/proc/245/status"
.LC245:
	.string	"/proc/246/status"
.LC246:
	.string	"/proc/247/status"
.LC247:
	.string	"/proc/248/status"
.LC248:
	.string	"/proc/249/status"
.LC249:
	.string	"/proc/250/status"
.LC250:
	.string	"/proc/251/status"
.LC251:
	.string	"/proc/252/status"
.LC252:
	.string	"/proc/253/status"
.LC253:
	.string	"/proc/254/status"
.LC254:
	.string	"/proc/255/status"
.LC255:
	.string	"/proc/256/status"
.LC256:
	.string	"/proc/257/status"
.LC257:
	.string	"/proc/258/status"
.LC258:
	.string	"/proc/259/status"
.LC259:
	.string	"/proc/260/status"
.LC260:
	.string	"/proc/261/status"
.LC261:
	.string	"/proc/262/status"
.LC262:
	.string	"/proc/263/status"
.LC263:
	.string	"/proc/264/status"
.LC264:
	.string	"/proc/265/status"
.LC265:
	.string	"/proc/266/status"
.LC266:
	.string	"/proc/267/status"
.LC267:
	.string	"/proc/268/status"
.LC268:
	.string	"/proc/269/status"
.LC269:
	.string	"/proc/270/status"
.LC270:
	.string	"/proc/271/status"
.LC271:
	.string	"/proc/272/status"
.LC272:
	.string	"/proc/273/status"
.LC273:
	.string	"/proc/274/status"
.LC274:
	.string	"/proc/275/status"
.LC275:
	.string	"/proc/276/status"
.LC276:
	.string	"/proc/277/status"
.LC277:
	.string	"/proc/278/status"
.LC278:
	.string	"/proc/279/status"
.LC279:
	.string	"/proc/280/status"
.LC280:
	.string	"/proc/281/status"
.LC281:
	.string	"/proc/282/status"
.LC282:
	.string	"/proc/283/status"
.LC283:
	.string	"/proc/284/status"
.LC284:
	.string	"/proc/285/status"
.LC285:
	.string	"/proc/286/status"
.LC286:
	.string	"/proc/287/status"
.LC287:
	.string	"/proc/288/status"
.LC288:
	.string	"/proc/289/status"
.LC289:
	.string	"/proc/290/status"
.LC290:
	.string	"/proc/291/status"
.LC291:
	.string	"/proc/292/status"
.LC292:
	.string	"/proc/293/status"
.LC293:
	.string	"/proc/294/status"
.LC294:
	.string	"/proc/295/status"
.LC295:
	.string	"/proc/296/status"
.LC296:
	.string	"/proc/297/status"
.LC297:
	.string	"/proc/298/status"
.LC298:
	.string	"/proc/299/status"
.LC299:
	.string	"/proc/300/status"
.LC300:
	.string	"/proc/301/status"
.LC301:
	.string	"/proc/302/status"
.LC302:
	.string	"/proc/303/status"
.LC303:
	.string	"/proc/304/status"
.LC304:
	.string	"/proc/305/status"
.LC305:
	.string	"/proc/306/status"
.LC306:
	.string	"/proc/307/status"
.LC307:
	.string	"/proc/308/status"
.LC308:
	.string	"/proc/309/status"
.LC309:
	.string	"/proc/310/status"
.LC310:
	.string	"/proc/311/status"
.LC311:
	.string	"/proc/312/status"
.LC312:
	.string	"/proc/313/status"
.LC313:
	.string	"/proc/314/status"
.LC314:
	.string	"/proc/315/status"
.LC315:
	.string	"/proc/316/status"
.LC316:
	.string	"/proc/317/status"
.LC317:
	.string	"/proc/318/status"
.LC318:
	.string	"/proc/319/status"
.LC319:
	.string	"/proc/320/status"
.LC320:
	.string	"/proc/321/status"
.LC321:
	.string	"/proc/322/status"
.LC322:
	.string	"/proc/323/status"
.LC323:
	.string	"/proc/324/status"
.LC324:
	.string	"/proc/325/status"
.LC325:
	.string	"/proc/326/status"
.LC326:
	.string	"/proc/327/status"
.LC327:
	.string	"/proc/328/status"
.LC328:
	.string	"/proc/329/status"
.LC329:
	.string	"/proc/330/status"
.LC330:
	.string	"/proc/331/status"
.LC331:
	.string	"/proc/332/status"
.LC332:
	.string	"/proc/333/status"
.LC333:
	.string	"/proc/334/status"
.LC334:
	.string	"/proc/335/status"
.LC335:
	.string	"/proc/336/status"
.LC336:
	.string	"/proc/337/status"
.LC337:
	.string	"/proc/338/status"
.LC338:
	.string	"/proc/339/status"
.LC339:
	.string	"/proc/340/status"
.LC340:
	.string	"/proc/341/status"
.LC341:
	.string	"/proc/342/status"
.LC342:
	.string	"/proc/343/status"
.LC343:
	.string	"/proc/344/status"
.LC344:
	.string	"/proc/345/status"
.LC345:
	.string	"/proc/346/status"
.LC346:
	.string	"/proc/347/status"
.LC347:
	.string	"/proc/348/status"
.LC348:
	.string	"/proc/349/status"
.LC349:
	.string	"/proc/350/status"
.LC350:
	.string	"/proc/351/status"
.LC351:
	.string	"/proc/352/status"
.LC352:
	.string	"/proc/353/status"
.LC353:
	.string	"/proc/354/status"
.LC354:
	.string	"/proc/355/status"
.LC355:
	.string	"/proc/356/status"
.LC356:
	.string	"/proc/357/status"
.LC357:
	.string	"/proc/358/status"
.LC358:
	.string	"/proc/359/status"
.LC359:
	.string	"/proc/360/status"
.LC360:
	.string	"/proc/361/status"
.LC361:
	.string	"/proc/362/status"
.LC362:
	.string	"/proc/363/status"
.LC363:
	.string	"/proc/364/status"
.LC364:
	.string	"/proc/365/status"
.LC365:
	.string	"/proc/366/status"
.LC366:
	.string	"/proc/367/status"
.LC367:
	.string	"/proc/368/status"
.LC368:
	.string	"/proc/369/status"
.LC369:
	.string	"/proc/370/status"
.LC370:
	.string	"/proc/371/status"
.LC371:
	.string	"/proc/372/status"
.LC372:
	.string	"/proc/373/status"
.LC373:
	.string	"/proc/374/status"
.LC374:
	.string	"/proc/375/status"
.LC375:
	.string	"/proc/376/status"
.LC376:
	.string	"/proc/377/status"
.LC377:
	.string	"/proc/378/status"
.LC378:
	.string	"/proc/379/status"
.LC379:
	.string	"/proc/380/status"
.LC380:
	.string	"/proc/381/status"
.LC381:
	.string	"/proc/382/status"
.LC382:
	.string	"/proc/383/status"
.LC383:
	.string	"/proc/384/status"
.LC384:
	.string	"/proc/385/status"
.LC385:
	.string	"/proc/386/status"
.LC386:
	.string	"/proc/387/status"
.LC387:
	.string	"/proc/388/status"
.LC388:
	.string	"/proc/389/status"
.LC389:
	.string	"/proc/390/status"
.LC390:
	.string	"/proc/391/status"
.LC391:
	.string	"/proc/392/status"
.LC392:
	.string	"/proc/393/status"
.LC393:
	.string	"/proc/394/status"
.LC394:
	.string	"/proc/395/status"
.LC395:
	.string	"/proc/396/status"
.LC396:
	.string	"/proc/397/status"
.LC397:
	.string	"/proc/398/status"
.LC398:
	.string	"/proc/399/status"
.LC399:
	.string	"/proc/400/status"
.LC400:
	.string	"/proc/401/status"
.LC401:
	.string	"/proc/402/status"
.LC402:
	.string	"/proc/403/status"
.LC403:
	.string	"/proc/404/status"
.LC404:
	.string	"/proc/405/status"
.LC405:
	.string	"/proc/406/status"
.LC406:
	.string	"/proc/407/status"
.LC407:
	.string	"/proc/408/status"
.LC408:
	.string	"/proc/409/status"
.LC409:
	.string	"/proc/410/status"
.LC410:
	.string	"/proc/411/status"
.LC411:
	.string	"/proc/412/status"
.LC412:
	.string	"/proc/413/status"
.LC413:
	.string	"/proc/414/status"
.LC414:
	.string	"/proc/415/status"
.LC415:
	.string	"/proc/416/status"
.LC416:
	.string	"/proc/417/status"
.LC417:
	.string	"/proc/418/status"
.LC418:
	.string	"/proc/419/status"
.LC419:
	.string	"/proc/420/status"
.LC420:
	.string	"/proc/421/status"
.LC421:
	.string	"/proc/422/status"
.LC422:
	.string	"/proc/423/status"
.LC423:
	.string	"/proc/424/status"
.LC424:
	.string	"/proc/425/status"
.LC425:
	.string	"/proc/426/status"
.LC426:
	.string	"/proc/427/status"
.LC427:
	.string	"/proc/428/status"
.LC428:
	.string	"/proc/429/status"
.LC429:
	.string	"/proc/430/status"
.LC430:
	.string	"/proc/431/status"
.LC431:
	.string	"/proc/432/status"
.LC432:
	.string	"/proc/433/status"
.LC433:
	.string	"/proc/434/status"
.LC434:
	.string	"/proc/435/status"
.LC435:
	.string	"/proc/436/status"
.LC436:
	.string	"/proc/437/status"
.LC437:
	.string	"/proc/438/status"
.LC438:
	.string	"/proc/439/status"
.LC439:
	.string	"/proc/440/status"
.LC440:
	.string	"/proc/441/status"
.LC441:
	.string	"/proc/442/status"
.LC442:
	.string	"/proc/443/status"
.LC443:
	.string	"/proc/444/status"
.LC444:
	.string	"/proc/445/status"
.LC445:
	.string	"/proc/446/status"
.LC446:
	.string	"/proc/447/status"
.LC447:
	.string	"/proc/448/status"
.LC448:
	.string	"/proc/449/status"
.LC449:
	.string	"/proc/450/status"
.LC450:
	.string	"/proc/451/status"
.LC451:
	.string	"/proc/452/status"
.LC452:
	.string	"/proc/453/status"
.LC453:
	.string	"/proc/454/status"
.LC454:
	.string	"/proc/455/status"
.LC455:
	.string	"/proc/456/status"
.LC456:
	.string	"/proc/457/status"
.LC457:
	.string	"/proc/458/status"
.LC458:
	.string	"/proc/459/status"
.LC459:
	.string	"/proc/460/status"
.LC460:
	.string	"/proc/461/status"
.LC461:
	.string	"/proc/462/status"
.LC462:
	.string	"/proc/463/status"
.LC463:
	.string	"/proc/464/status"
.LC464:
	.string	"/proc/465/status"
.LC465:
	.string	"/proc/466/status"
.LC466:
	.string	"/proc/467/status"
.LC467:
	.string	"/proc/468/status"
.LC468:
	.string	"/proc/469/status"
.LC469:
	.string	"/proc/470/status"
.LC470:
	.string	"/proc/471/status"
.LC471:
	.string	"/proc/472/status"
.LC472:
	.string	"/proc/473/status"
.LC473:
	.string	"/proc/474/status"
.LC474:
	.string	"/proc/475/status"
.LC475:
	.string	"/proc/476/status"
.LC476:
	.string	"/proc/477/status"
.LC477:
	.string	"/proc/478/status"
.LC478:
	.string	"/proc/479/status"
.LC479:
	.string	"/proc/480/status"
.LC480:
	.string	"/proc/481/status"
.LC481:
	.string	"/proc/482/status"
.LC482:
	.string	"/proc/483/status"
.LC483:
	.string	"/proc/484/status"
.LC484:
	.string	"/proc/485/status"
.LC485:
	.string	"/proc/486/status"
.LC486:
	.string	"/proc/487/status"
.LC487:
	.string	"/proc/488/status"
.LC488:
	.string	"/proc/489/status"
.LC489:
	.string	"/proc/490/status"
.LC490:
	.string	"/proc/491/status"
.LC491:
	.string	"/proc/492/status"
.LC492:
	.string	"/proc/493/status"
.LC493:
	.string	"/proc/494/status"
.LC494:
	.string	"/proc/495/status"
.LC495:
	.string	"/proc/496/status"
.LC496:
	.string	"/proc/497/status"
.LC497:
	.string	"/proc/498/status"
.LC498:
	.string	"/proc/499/status"
.LC499:
	.string	"/proc/500/status"


	.section	.data.rel.local,"aw"
	.align 32
	.type	procs, @object
	.size	procs, 1592
procs:
	.quad	.LC0
	.quad	.LC1
	.quad	.LC2
	.quad	.LC3
	.quad	.LC4
	.quad	.LC5
	.quad	.LC6
	.quad	.LC7
	.quad	.LC8
	.quad	.LC9
	.quad	.LC10
	.quad	.LC11
	.quad	.LC12
	.quad	.LC13
	.quad	.LC14
	.quad	.LC15
	.quad	.LC16
	.quad	.LC17
	.quad	.LC18
	.quad	.LC19
	.quad	.LC20
	.quad	.LC21
	.quad	.LC22
	.quad	.LC23
	.quad	.LC24
	.quad	.LC25
	.quad	.LC26
	.quad	.LC27
	.quad	.LC28
	.quad	.LC29
	.quad	.LC30
	.quad	.LC31
	.quad	.LC32
	.quad	.LC33
	.quad	.LC34
	.quad	.LC35
	.quad	.LC36
	.quad	.LC37
	.quad	.LC38
	.quad	.LC39
	.quad	.LC40
	.quad	.LC41
	.quad	.LC42
	.quad	.LC43
	.quad	.LC44
	.quad	.LC45
	.quad	.LC46
	.quad	.LC47
	.quad	.LC48
	.quad	.LC49
	.quad	.LC50
	.quad	.LC51
	.quad	.LC52
	.quad	.LC53
	.quad	.LC54
	.quad	.LC55
	.quad	.LC56
	.quad	.LC57
	.quad	.LC58
	.quad	.LC59
	.quad	.LC60
	.quad	.LC61
	.quad	.LC62
	.quad	.LC63
	.quad	.LC64
	.quad	.LC65
	.quad	.LC66
	.quad	.LC67
	.quad	.LC68
	.quad	.LC69
	.quad	.LC70
	.quad	.LC71
	.quad	.LC72
	.quad	.LC73
	.quad	.LC74
	.quad	.LC75
	.quad	.LC76
	.quad	.LC77
	.quad	.LC78
	.quad	.LC79
	.quad	.LC80
	.quad	.LC81
	.quad	.LC82
	.quad	.LC83
	.quad	.LC84
	.quad	.LC85
	.quad	.LC86
	.quad	.LC87
	.quad	.LC88
	.quad	.LC89
	.quad	.LC90
	.quad	.LC91
	.quad	.LC92
	.quad	.LC93
	.quad	.LC94
	.quad	.LC95
	.quad	.LC96
	.quad	.LC97
	.quad	.LC98
	.quad	.LC99
	.quad	.LC100
	.quad	.LC101
	.quad	.LC102
	.quad	.LC103
	.quad	.LC104
	.quad	.LC105
	.quad	.LC106
	.quad	.LC107
	.quad	.LC108
	.quad	.LC109
	.quad	.LC110
	.quad	.LC111
	.quad	.LC112
	.quad	.LC113
	.quad	.LC114
	.quad	.LC115
	.quad	.LC116
	.quad	.LC117
	.quad	.LC118
	.quad	.LC119
	.quad	.LC120
	.quad	.LC121
	.quad	.LC122
	.quad	.LC123
	.quad	.LC124
	.quad	.LC125
	.quad	.LC126
	.quad	.LC127
	.quad	.LC128
	.quad	.LC129
	.quad	.LC130
	.quad	.LC131
	.quad	.LC132
	.quad	.LC133
	.quad	.LC134
	.quad	.LC135
	.quad	.LC136
	.quad	.LC137
	.quad	.LC138
	.quad	.LC139
	.quad	.LC140
	.quad	.LC141
	.quad	.LC142
	.quad	.LC143
	.quad	.LC144
	.quad	.LC145
	.quad	.LC146
	.quad	.LC147
	.quad	.LC148
	.quad	.LC149
	.quad	.LC150
	.quad	.LC151
	.quad	.LC152
	.quad	.LC153
	.quad	.LC154
	.quad	.LC155
	.quad	.LC156
	.quad	.LC157
	.quad	.LC158
	.quad	.LC159
	.quad	.LC160
	.quad	.LC161
	.quad	.LC162
	.quad	.LC163
	.quad	.LC164
	.quad	.LC165
	.quad	.LC166
	.quad	.LC167
	.quad	.LC168
	.quad	.LC169
	.quad	.LC170
	.quad	.LC171
	.quad	.LC172
	.quad	.LC173
	.quad	.LC174
	.quad	.LC175
	.quad	.LC176
	.quad	.LC177
	.quad	.LC178
	.quad	.LC179
	.quad	.LC180
	.quad	.LC181
	.quad	.LC182
	.quad	.LC183
	.quad	.LC184
	.quad	.LC185
	.quad	.LC186
	.quad	.LC187
	.quad	.LC188
	.quad	.LC189
	.quad	.LC190
	.quad	.LC191
	.quad	.LC192
	.quad	.LC193
	.quad	.LC194
	.quad	.LC195
	.quad	.LC196
	.quad	.LC197
	.quad	.LC198
	.quad .LC199
	.quad .LC200
	.quad .LC201
	.quad .LC202
	.quad .LC203
	.quad .LC204
	.quad .LC205
	.quad .LC206
	.quad .LC207
	.quad .LC208
	.quad .LC209
	.quad .LC210
	.quad .LC211
	.quad .LC212
	.quad .LC213
	.quad .LC214
	.quad .LC215
	.quad .LC216
	.quad .LC217
	.quad .LC218
	.quad .LC219
	.quad .LC220
	.quad .LC221
	.quad .LC222
	.quad .LC223
	.quad .LC224
	.quad .LC225
	.quad .LC226
	.quad .LC227
	.quad .LC228
	.quad .LC229
	.quad .LC230
	.quad .LC231
	.quad .LC232
	.quad .LC233
	.quad .LC234
	.quad .LC235
	.quad .LC236
	.quad .LC237
	.quad .LC238
	.quad .LC239
	.quad .LC240
	.quad .LC241
	.quad .LC242
	.quad .LC243
	.quad .LC244
	.quad .LC245
	.quad .LC246
	.quad .LC247
	.quad .LC248
	.quad .LC249
	.quad .LC250
	.quad .LC251
	.quad .LC252
	.quad .LC253
	.quad .LC254
	.quad .LC255
	.quad .LC256
	.quad .LC257
	.quad .LC258
	.quad .LC259
	.quad .LC260
	.quad .LC261
	.quad .LC262
	.quad .LC263
	.quad .LC264
	.quad .LC265
	.quad .LC266
	.quad .LC267
	.quad .LC268
	.quad .LC269
	.quad .LC270
	.quad .LC271
	.quad .LC272
	.quad .LC273
	.quad .LC274
	.quad .LC275
	.quad .LC276
	.quad .LC277
	.quad .LC278
	.quad .LC279
	.quad .LC280
	.quad .LC281
	.quad .LC282
	.quad .LC283
	.quad .LC284
	.quad .LC285
	.quad .LC286
	.quad .LC287
	.quad .LC288
	.quad .LC289
	.quad .LC290
	.quad .LC291
	.quad .LC292
	.quad .LC293
	.quad .LC294
	.quad .LC295
	.quad .LC296
	.quad .LC297
	.quad .LC298
	.quad .LC299
	.quad .LC300
	.quad .LC301
	.quad .LC302
	.quad .LC303
	.quad .LC304
	.quad .LC305
	.quad .LC306
	.quad .LC307
	.quad .LC308
	.quad .LC309
	.quad .LC310
	.quad .LC311
	.quad .LC312
	.quad .LC313
	.quad .LC314
	.quad .LC315
	.quad .LC316
	.quad .LC317
	.quad .LC318
	.quad .LC319
	.quad .LC320
	.quad .LC321
	.quad .LC322
	.quad .LC323
	.quad .LC324
	.quad .LC325
	.quad .LC326
	.quad .LC327
	.quad .LC328
	.quad .LC329
	.quad .LC330
	.quad .LC331
	.quad .LC332
	.quad .LC333
	.quad .LC334
	.quad .LC335
	.quad .LC336
	.quad .LC337
	.quad .LC338
	.quad .LC339
	.quad .LC340
	.quad .LC341
	.quad .LC342
	.quad .LC343
	.quad .LC344
	.quad .LC345
	.quad .LC346
	.quad .LC347
	.quad .LC348
	.quad .LC349
	.quad .LC350
	.quad .LC351
	.quad .LC352
	.quad .LC353
	.quad .LC354
	.quad .LC355
	.quad .LC356
	.quad .LC357
	.quad .LC358
	.quad .LC359
	.quad .LC360
	.quad .LC361
	.quad .LC362
	.quad .LC363
	.quad .LC364
	.quad .LC365
	.quad .LC366
	.quad .LC367
	.quad .LC368
	.quad .LC369
	.quad .LC370
	.quad .LC371
	.quad .LC372
	.quad .LC373
	.quad .LC374
	.quad .LC375
	.quad .LC376
	.quad .LC377
	.quad .LC378
	.quad .LC379
	.quad .LC380
	.quad .LC381
	.quad .LC382
	.quad .LC383
	.quad .LC384
	.quad .LC385
	.quad .LC386
	.quad .LC387
	.quad .LC388
	.quad .LC389
	.quad .LC390
	.quad .LC391
	.quad .LC392
	.quad .LC393
	.quad .LC394
	.quad .LC395
	.quad .LC396
	.quad .LC397
	.quad .LC398
	.quad .LC399
	.quad .LC400
	.quad .LC401
	.quad .LC402
	.quad .LC403
	.quad .LC404
	.quad .LC405
	.quad .LC406
	.quad .LC407
	.quad .LC408
	.quad .LC409
	.quad .LC410
	.quad .LC411
	.quad .LC412
	.quad .LC413
	.quad .LC414
	.quad .LC415
	.quad .LC416
	.quad .LC417
	.quad .LC418
	.quad .LC419
	.quad .LC420
	.quad .LC421
	.quad .LC422
	.quad .LC423
	.quad .LC424
	.quad .LC425
	.quad .LC426
	.quad .LC427
	.quad .LC428
	.quad .LC429
	.quad .LC430
	.quad .LC431
	.quad .LC432
	.quad .LC433
	.quad .LC434
	.quad .LC435
	.quad .LC436
	.quad .LC437
	.quad .LC438
	.quad .LC439
	.quad .LC440
	.quad .LC441
	.quad .LC442
	.quad .LC443
	.quad .LC444
	.quad .LC445
	.quad .LC446
	.quad .LC447
	.quad .LC448
	.quad .LC449
	.quad .LC450
	.quad .LC451
	.quad .LC452
	.quad .LC453
	.quad .LC454
	.quad .LC455
	.quad .LC456
	.quad .LC457
	.quad .LC458
	.quad .LC459
	.quad .LC460
	.quad .LC461
	.quad .LC462
	.quad .LC463
	.quad .LC464
	.quad .LC465
	.quad .LC466
	.quad .LC467
	.quad .LC468
	.quad .LC469
	.quad .LC470
	.quad .LC471
	.quad .LC472
	.quad .LC473
	.quad .LC474
	.quad .LC475
	.quad .LC476
	.quad .LC477
	.quad .LC478
	.quad .LC479
	.quad .LC480
	.quad .LC481
	.quad .LC482
	.quad .LC483
	.quad .LC484
	.quad .LC485
	.quad .LC486
	.quad .LC487
	.quad .LC488
	.quad .LC489
	.quad .LC490
	.quad .LC491
	.quad .LC492
	.quad .LC493
	.quad .LC494
	.quad .LC495
	.quad .LC496
	.quad .LC497
	.quad .LC498
	.quad .LC499

.bss
.lcomm argc, 8
.lcomm arg, 8
.lcomm name_buff, 64

.text

_start:
						pop     		rax
						mov     		[argc], rax
						cmp			    byte ptr [argc], 2
						jne 				exit
						pop			    rax
						pop     		rax
						mov     		[arg], rax
						mov     		r12, 0

1:
						inc     		r12
						cmp     		r12, 500
						jge 				4f
						mov     		rax, SYS_openat
						mov     		rsi, [procs + 8*(r12-1)]
						mov     		rdi, AT_FDCWD
						mov     		rdx, O_RDONLY
						syscall

						cmp     		rax, 0
						jl 					1b
						mov     		r13, rax
						mov     		rdi, r13
						lea     		rsi, [name_buff]
						mov     		rdx, 64
						mov     		rax, SYS_read
						syscall

						mov			    rax, SYS_close
						mov    			rdi, r13
						syscall

						mov     		r11, 0
2:
						cmp     		r11, 64
						jge 				3f 
						xor		     	rax, rax
						mov   		  rsi, [arg]
						mov     		al, byte ptr [rsi + r11]
						mov     		dil, byte ptr [name_buff + 6 + r11] 
						inc     		r11 
						test    		al, al 
						jz 					3f 
						cmp     		dil, 0x0a
						je 					3f
						cmp     		dil, al
						jne 				3f
						jmp 				2b
3:
						test    		rax, rax
						jnz 				1b
						cmp     		dil, 0x0a
						jne 				1b


						mov     		rax, SYS_kill
						mov     		rdi, r12
						mov    			rsi, SIGKILL
						syscall 		
						
						jmp 				1b

4:
						call 				exit

exit:
						mov    		 	rax, SYS_exit
						mov     		rdi, EXIT_SUCCESS
						syscall

