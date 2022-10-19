
bin/kernel：     文件格式 elf32-i386


Disassembly of section .text:

00100000 <kern_init>:
int kern_init(void) __attribute__((noreturn));
void grade_backtrace(void);
static void lab1_switch_test(void);

int
kern_init(void) {
  100000:	55                   	push   %ebp
  100001:	89 e5                	mov    %esp,%ebp
  100003:	83 ec 28             	sub    $0x28,%esp
    extern char edata[], end[];
    memset(edata, 0, end - edata);
  100006:	ba 20 fd 10 00       	mov    $0x10fd20,%edx
  10000b:	b8 16 ea 10 00       	mov    $0x10ea16,%eax
  100010:	29 c2                	sub    %eax,%edx
  100012:	89 d0                	mov    %edx,%eax
  100014:	89 44 24 08          	mov    %eax,0x8(%esp)
  100018:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  10001f:	00 
  100020:	c7 04 24 16 ea 10 00 	movl   $0x10ea16,(%esp)
  100027:	e8 ee 2d 00 00       	call   102e1a <memset>

    cons_init();                // init the console
  10002c:	e8 64 15 00 00       	call   101595 <cons_init>

    const char *message = "(THU.CST) os is loading ...";
  100031:	c7 45 f4 20 36 10 00 	movl   $0x103620,-0xc(%ebp)
    cprintf("%s\n\n", message);
  100038:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10003b:	89 44 24 04          	mov    %eax,0x4(%esp)
  10003f:	c7 04 24 3c 36 10 00 	movl   $0x10363c,(%esp)
  100046:	e8 21 02 00 00       	call   10026c <cprintf>

    print_kerninfo();
  10004b:	e8 c2 08 00 00       	call   100912 <print_kerninfo>

    grade_backtrace();
  100050:	e8 8e 00 00 00       	call   1000e3 <grade_backtrace>

    pmm_init();                 // init physical memory management
  100055:	e8 95 2a 00 00       	call   102aef <pmm_init>

    pic_init();                 // init interrupt controller
  10005a:	e8 74 16 00 00       	call   1016d3 <pic_init>
    idt_init();                 // init interrupt descriptor table
  10005f:	e8 cd 17 00 00       	call   101831 <idt_init>

    clock_init();               // init clock interrupt
  100064:	e8 1d 0d 00 00       	call   100d86 <clock_init>
    intr_enable();              // enable irq interrupt
  100069:	e8 98 17 00 00       	call   101806 <intr_enable>

    //LAB1: CAHLLENGE 1 If you try to do it, uncomment lab1_switch_test()
    // user/kernel mode switch test
    lab1_switch_test();
  10006e:	e8 6b 01 00 00       	call   1001de <lab1_switch_test>

    /* do nothing */
    while (1);
  100073:	eb fe                	jmp    100073 <kern_init+0x73>

00100075 <grade_backtrace2>:
}

void __attribute__((noinline))
grade_backtrace2(int arg0, int arg1, int arg2, int arg3) {
  100075:	55                   	push   %ebp
  100076:	89 e5                	mov    %esp,%ebp
  100078:	83 ec 18             	sub    $0x18,%esp
    mon_backtrace(0, NULL, NULL);
  10007b:	c7 44 24 08 00 00 00 	movl   $0x0,0x8(%esp)
  100082:	00 
  100083:	c7 44 24 04 00 00 00 	movl   $0x0,0x4(%esp)
  10008a:	00 
  10008b:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  100092:	e8 dd 0c 00 00       	call   100d74 <mon_backtrace>
}
  100097:	90                   	nop
  100098:	c9                   	leave  
  100099:	c3                   	ret    

0010009a <grade_backtrace1>:

void __attribute__((noinline))
grade_backtrace1(int arg0, int arg1) {
  10009a:	55                   	push   %ebp
  10009b:	89 e5                	mov    %esp,%ebp
  10009d:	53                   	push   %ebx
  10009e:	83 ec 14             	sub    $0x14,%esp
    grade_backtrace2(arg0, (int)&arg0, arg1, (int)&arg1);
  1000a1:	8d 4d 0c             	lea    0xc(%ebp),%ecx
  1000a4:	8b 55 0c             	mov    0xc(%ebp),%edx
  1000a7:	8d 5d 08             	lea    0x8(%ebp),%ebx
  1000aa:	8b 45 08             	mov    0x8(%ebp),%eax
  1000ad:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
  1000b1:	89 54 24 08          	mov    %edx,0x8(%esp)
  1000b5:	89 5c 24 04          	mov    %ebx,0x4(%esp)
  1000b9:	89 04 24             	mov    %eax,(%esp)
  1000bc:	e8 b4 ff ff ff       	call   100075 <grade_backtrace2>
}
  1000c1:	90                   	nop
  1000c2:	83 c4 14             	add    $0x14,%esp
  1000c5:	5b                   	pop    %ebx
  1000c6:	5d                   	pop    %ebp
  1000c7:	c3                   	ret    

001000c8 <grade_backtrace0>:

void __attribute__((noinline))
grade_backtrace0(int arg0, int arg1, int arg2) {
  1000c8:	55                   	push   %ebp
  1000c9:	89 e5                	mov    %esp,%ebp
  1000cb:	83 ec 18             	sub    $0x18,%esp
    grade_backtrace1(arg0, arg2);
  1000ce:	8b 45 10             	mov    0x10(%ebp),%eax
  1000d1:	89 44 24 04          	mov    %eax,0x4(%esp)
  1000d5:	8b 45 08             	mov    0x8(%ebp),%eax
  1000d8:	89 04 24             	mov    %eax,(%esp)
  1000db:	e8 ba ff ff ff       	call   10009a <grade_backtrace1>
}
  1000e0:	90                   	nop
  1000e1:	c9                   	leave  
  1000e2:	c3                   	ret    

001000e3 <grade_backtrace>:

void
grade_backtrace(void) {
  1000e3:	55                   	push   %ebp
  1000e4:	89 e5                	mov    %esp,%ebp
  1000e6:	83 ec 18             	sub    $0x18,%esp
    grade_backtrace0(0, (int)kern_init, 0xffff0000);
  1000e9:	b8 00 00 10 00       	mov    $0x100000,%eax
  1000ee:	c7 44 24 08 00 00 ff 	movl   $0xffff0000,0x8(%esp)
  1000f5:	ff 
  1000f6:	89 44 24 04          	mov    %eax,0x4(%esp)
  1000fa:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  100101:	e8 c2 ff ff ff       	call   1000c8 <grade_backtrace0>
}
  100106:	90                   	nop
  100107:	c9                   	leave  
  100108:	c3                   	ret    

00100109 <lab1_print_cur_status>:

static void
lab1_print_cur_status(void) {
  100109:	55                   	push   %ebp
  10010a:	89 e5                	mov    %esp,%ebp
  10010c:	83 ec 28             	sub    $0x28,%esp
    static int round = 0;
    uint16_t reg1, reg2, reg3, reg4;
    asm volatile (
  10010f:	8c 4d f6             	mov    %cs,-0xa(%ebp)
  100112:	8c 5d f4             	mov    %ds,-0xc(%ebp)
  100115:	8c 45 f2             	mov    %es,-0xe(%ebp)
  100118:	8c 55 f0             	mov    %ss,-0x10(%ebp)
            "mov %%cs, %0;"
            "mov %%ds, %1;"
            "mov %%es, %2;"
            "mov %%ss, %3;"
            : "=m"(reg1), "=m"(reg2), "=m"(reg3), "=m"(reg4));
    cprintf("%d: @ring %d\n", round, reg1 & 3);
  10011b:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  10011f:	83 e0 03             	and    $0x3,%eax
  100122:	89 c2                	mov    %eax,%edx
  100124:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  100129:	89 54 24 08          	mov    %edx,0x8(%esp)
  10012d:	89 44 24 04          	mov    %eax,0x4(%esp)
  100131:	c7 04 24 41 36 10 00 	movl   $0x103641,(%esp)
  100138:	e8 2f 01 00 00       	call   10026c <cprintf>
    cprintf("%d:  cs = %x\n", round, reg1);
  10013d:	0f b7 45 f6          	movzwl -0xa(%ebp),%eax
  100141:	89 c2                	mov    %eax,%edx
  100143:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  100148:	89 54 24 08          	mov    %edx,0x8(%esp)
  10014c:	89 44 24 04          	mov    %eax,0x4(%esp)
  100150:	c7 04 24 4f 36 10 00 	movl   $0x10364f,(%esp)
  100157:	e8 10 01 00 00       	call   10026c <cprintf>
    cprintf("%d:  ds = %x\n", round, reg2);
  10015c:	0f b7 45 f4          	movzwl -0xc(%ebp),%eax
  100160:	89 c2                	mov    %eax,%edx
  100162:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  100167:	89 54 24 08          	mov    %edx,0x8(%esp)
  10016b:	89 44 24 04          	mov    %eax,0x4(%esp)
  10016f:	c7 04 24 5d 36 10 00 	movl   $0x10365d,(%esp)
  100176:	e8 f1 00 00 00       	call   10026c <cprintf>
    cprintf("%d:  es = %x\n", round, reg3);
  10017b:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  10017f:	89 c2                	mov    %eax,%edx
  100181:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  100186:	89 54 24 08          	mov    %edx,0x8(%esp)
  10018a:	89 44 24 04          	mov    %eax,0x4(%esp)
  10018e:	c7 04 24 6b 36 10 00 	movl   $0x10366b,(%esp)
  100195:	e8 d2 00 00 00       	call   10026c <cprintf>
    cprintf("%d:  ss = %x\n", round, reg4);
  10019a:	0f b7 45 f0          	movzwl -0x10(%ebp),%eax
  10019e:	89 c2                	mov    %eax,%edx
  1001a0:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  1001a5:	89 54 24 08          	mov    %edx,0x8(%esp)
  1001a9:	89 44 24 04          	mov    %eax,0x4(%esp)
  1001ad:	c7 04 24 79 36 10 00 	movl   $0x103679,(%esp)
  1001b4:	e8 b3 00 00 00       	call   10026c <cprintf>
    round ++;
  1001b9:	a1 20 ea 10 00       	mov    0x10ea20,%eax
  1001be:	40                   	inc    %eax
  1001bf:	a3 20 ea 10 00       	mov    %eax,0x10ea20
}
  1001c4:	90                   	nop
  1001c5:	c9                   	leave  
  1001c6:	c3                   	ret    

001001c7 <lab1_switch_to_user>:

static void
lab1_switch_to_user(void) {
  1001c7:	55                   	push   %ebp
  1001c8:	89 e5                	mov    %esp,%ebp
    // LAB1 CHALLENGE 1 : TODO
    // LAB1 2013743 Roslin
    asm volatile(
  1001ca:	83 ec 08             	sub    $0x8,%esp
  1001cd:	cd 78                	int    $0x78
  1001cf:	89 ec                	mov    %ebp,%esp
		    "int %0 \n"
		    "movl %%ebp, %%esp \n"
		    :
		    :"i"(T_SWITCH_TOU)
		);
}
  1001d1:	90                   	nop
  1001d2:	5d                   	pop    %ebp
  1001d3:	c3                   	ret    

001001d4 <lab1_switch_to_kernel>:

static void
lab1_switch_to_kernel(void) {
  1001d4:	55                   	push   %ebp
  1001d5:	89 e5                	mov    %esp,%ebp
    // LAB1 CHALLENGE 1 :  TODO
    // LAB1 2013743 Roslin
    asm volatile(
  1001d7:	cd 79                	int    $0x79
  1001d9:	89 ec                	mov    %ebp,%esp
		    "int %0 \n"
		    "movl %%ebp, %%esp \n"
		    :
		    :"i"(T_SWITCH_TOK)
		);
}
  1001db:	90                   	nop
  1001dc:	5d                   	pop    %ebp
  1001dd:	c3                   	ret    

001001de <lab1_switch_test>:

static void
lab1_switch_test(void) {
  1001de:	55                   	push   %ebp
  1001df:	89 e5                	mov    %esp,%ebp
  1001e1:	83 ec 18             	sub    $0x18,%esp
    lab1_print_cur_status();
  1001e4:	e8 20 ff ff ff       	call   100109 <lab1_print_cur_status>
    cprintf("+++ switch to  user  mode +++\n");
  1001e9:	c7 04 24 88 36 10 00 	movl   $0x103688,(%esp)
  1001f0:	e8 77 00 00 00       	call   10026c <cprintf>
    lab1_switch_to_user();
  1001f5:	e8 cd ff ff ff       	call   1001c7 <lab1_switch_to_user>
    lab1_print_cur_status();
  1001fa:	e8 0a ff ff ff       	call   100109 <lab1_print_cur_status>
    cprintf("+++ switch to kernel mode +++\n");
  1001ff:	c7 04 24 a8 36 10 00 	movl   $0x1036a8,(%esp)
  100206:	e8 61 00 00 00       	call   10026c <cprintf>
    lab1_switch_to_kernel();
  10020b:	e8 c4 ff ff ff       	call   1001d4 <lab1_switch_to_kernel>
    lab1_print_cur_status();
  100210:	e8 f4 fe ff ff       	call   100109 <lab1_print_cur_status>
}
  100215:	90                   	nop
  100216:	c9                   	leave  
  100217:	c3                   	ret    

00100218 <cputch>:
/* *
 * cputch - writes a single character @c to stdout, and it will
 * increace the value of counter pointed by @cnt.
 * */
static void
cputch(int c, int *cnt) {
  100218:	55                   	push   %ebp
  100219:	89 e5                	mov    %esp,%ebp
  10021b:	83 ec 18             	sub    $0x18,%esp
    cons_putc(c);
  10021e:	8b 45 08             	mov    0x8(%ebp),%eax
  100221:	89 04 24             	mov    %eax,(%esp)
  100224:	e8 99 13 00 00       	call   1015c2 <cons_putc>
    (*cnt) ++;
  100229:	8b 45 0c             	mov    0xc(%ebp),%eax
  10022c:	8b 00                	mov    (%eax),%eax
  10022e:	8d 50 01             	lea    0x1(%eax),%edx
  100231:	8b 45 0c             	mov    0xc(%ebp),%eax
  100234:	89 10                	mov    %edx,(%eax)
}
  100236:	90                   	nop
  100237:	c9                   	leave  
  100238:	c3                   	ret    

00100239 <vcprintf>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want cprintf() instead.
 * */
int
vcprintf(const char *fmt, va_list ap) {
  100239:	55                   	push   %ebp
  10023a:	89 e5                	mov    %esp,%ebp
  10023c:	83 ec 28             	sub    $0x28,%esp
    int cnt = 0;
  10023f:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    vprintfmt((void*)cputch, &cnt, fmt, ap);
  100246:	8b 45 0c             	mov    0xc(%ebp),%eax
  100249:	89 44 24 0c          	mov    %eax,0xc(%esp)
  10024d:	8b 45 08             	mov    0x8(%ebp),%eax
  100250:	89 44 24 08          	mov    %eax,0x8(%esp)
  100254:	8d 45 f4             	lea    -0xc(%ebp),%eax
  100257:	89 44 24 04          	mov    %eax,0x4(%esp)
  10025b:	c7 04 24 18 02 10 00 	movl   $0x100218,(%esp)
  100262:	e8 06 2f 00 00       	call   10316d <vprintfmt>
    return cnt;
  100267:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  10026a:	c9                   	leave  
  10026b:	c3                   	ret    

0010026c <cprintf>:
 *
 * The return value is the number of characters which would be
 * written to stdout.
 * */
int
cprintf(const char *fmt, ...) {
  10026c:	55                   	push   %ebp
  10026d:	89 e5                	mov    %esp,%ebp
  10026f:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    int cnt;
    va_start(ap, fmt);
  100272:	8d 45 0c             	lea    0xc(%ebp),%eax
  100275:	89 45 f0             	mov    %eax,-0x10(%ebp)
    cnt = vcprintf(fmt, ap);
  100278:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10027b:	89 44 24 04          	mov    %eax,0x4(%esp)
  10027f:	8b 45 08             	mov    0x8(%ebp),%eax
  100282:	89 04 24             	mov    %eax,(%esp)
  100285:	e8 af ff ff ff       	call   100239 <vcprintf>
  10028a:	89 45 f4             	mov    %eax,-0xc(%ebp)
    va_end(ap);
    return cnt;
  10028d:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100290:	c9                   	leave  
  100291:	c3                   	ret    

00100292 <cputchar>:

/* cputchar - writes a single character to stdout */
void
cputchar(int c) {
  100292:	55                   	push   %ebp
  100293:	89 e5                	mov    %esp,%ebp
  100295:	83 ec 18             	sub    $0x18,%esp
    cons_putc(c);
  100298:	8b 45 08             	mov    0x8(%ebp),%eax
  10029b:	89 04 24             	mov    %eax,(%esp)
  10029e:	e8 1f 13 00 00       	call   1015c2 <cons_putc>
}
  1002a3:	90                   	nop
  1002a4:	c9                   	leave  
  1002a5:	c3                   	ret    

001002a6 <cputs>:
/* *
 * cputs- writes the string pointed by @str to stdout and
 * appends a newline character.
 * */
int
cputs(const char *str) {
  1002a6:	55                   	push   %ebp
  1002a7:	89 e5                	mov    %esp,%ebp
  1002a9:	83 ec 28             	sub    $0x28,%esp
    int cnt = 0;
  1002ac:	c7 45 f0 00 00 00 00 	movl   $0x0,-0x10(%ebp)
    char c;
    while ((c = *str ++) != '\0') {
  1002b3:	eb 13                	jmp    1002c8 <cputs+0x22>
        cputch(c, &cnt);
  1002b5:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  1002b9:	8d 55 f0             	lea    -0x10(%ebp),%edx
  1002bc:	89 54 24 04          	mov    %edx,0x4(%esp)
  1002c0:	89 04 24             	mov    %eax,(%esp)
  1002c3:	e8 50 ff ff ff       	call   100218 <cputch>
 * */
int
cputs(const char *str) {
    int cnt = 0;
    char c;
    while ((c = *str ++) != '\0') {
  1002c8:	8b 45 08             	mov    0x8(%ebp),%eax
  1002cb:	8d 50 01             	lea    0x1(%eax),%edx
  1002ce:	89 55 08             	mov    %edx,0x8(%ebp)
  1002d1:	0f b6 00             	movzbl (%eax),%eax
  1002d4:	88 45 f7             	mov    %al,-0x9(%ebp)
  1002d7:	80 7d f7 00          	cmpb   $0x0,-0x9(%ebp)
  1002db:	75 d8                	jne    1002b5 <cputs+0xf>
        cputch(c, &cnt);
    }
    cputch('\n', &cnt);
  1002dd:	8d 45 f0             	lea    -0x10(%ebp),%eax
  1002e0:	89 44 24 04          	mov    %eax,0x4(%esp)
  1002e4:	c7 04 24 0a 00 00 00 	movl   $0xa,(%esp)
  1002eb:	e8 28 ff ff ff       	call   100218 <cputch>
    return cnt;
  1002f0:	8b 45 f0             	mov    -0x10(%ebp),%eax
}
  1002f3:	c9                   	leave  
  1002f4:	c3                   	ret    

001002f5 <getchar>:

/* getchar - reads a single non-zero character from stdin */
int
getchar(void) {
  1002f5:	55                   	push   %ebp
  1002f6:	89 e5                	mov    %esp,%ebp
  1002f8:	83 ec 18             	sub    $0x18,%esp
    int c;
    while ((c = cons_getc()) == 0)
  1002fb:	e8 ec 12 00 00       	call   1015ec <cons_getc>
  100300:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100303:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100307:	74 f2                	je     1002fb <getchar+0x6>
        /* do nothing */;
    return c;
  100309:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  10030c:	c9                   	leave  
  10030d:	c3                   	ret    

0010030e <readline>:
 * The readline() function returns the text of the line read. If some errors
 * are happened, NULL is returned. The return value is a global variable,
 * thus it should be copied before it is used.
 * */
char *
readline(const char *prompt) {
  10030e:	55                   	push   %ebp
  10030f:	89 e5                	mov    %esp,%ebp
  100311:	83 ec 28             	sub    $0x28,%esp
    if (prompt != NULL) {
  100314:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  100318:	74 13                	je     10032d <readline+0x1f>
        cprintf("%s", prompt);
  10031a:	8b 45 08             	mov    0x8(%ebp),%eax
  10031d:	89 44 24 04          	mov    %eax,0x4(%esp)
  100321:	c7 04 24 c7 36 10 00 	movl   $0x1036c7,(%esp)
  100328:	e8 3f ff ff ff       	call   10026c <cprintf>
    }
    int i = 0, c;
  10032d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while (1) {
        c = getchar();
  100334:	e8 bc ff ff ff       	call   1002f5 <getchar>
  100339:	89 45 f0             	mov    %eax,-0x10(%ebp)
        if (c < 0) {
  10033c:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  100340:	79 07                	jns    100349 <readline+0x3b>
            return NULL;
  100342:	b8 00 00 00 00       	mov    $0x0,%eax
  100347:	eb 78                	jmp    1003c1 <readline+0xb3>
        }
        else if (c >= ' ' && i < BUFSIZE - 1) {
  100349:	83 7d f0 1f          	cmpl   $0x1f,-0x10(%ebp)
  10034d:	7e 28                	jle    100377 <readline+0x69>
  10034f:	81 7d f4 fe 03 00 00 	cmpl   $0x3fe,-0xc(%ebp)
  100356:	7f 1f                	jg     100377 <readline+0x69>
            cputchar(c);
  100358:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10035b:	89 04 24             	mov    %eax,(%esp)
  10035e:	e8 2f ff ff ff       	call   100292 <cputchar>
            buf[i ++] = c;
  100363:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100366:	8d 50 01             	lea    0x1(%eax),%edx
  100369:	89 55 f4             	mov    %edx,-0xc(%ebp)
  10036c:	8b 55 f0             	mov    -0x10(%ebp),%edx
  10036f:	88 90 40 ea 10 00    	mov    %dl,0x10ea40(%eax)
  100375:	eb 45                	jmp    1003bc <readline+0xae>
        }
        else if (c == '\b' && i > 0) {
  100377:	83 7d f0 08          	cmpl   $0x8,-0x10(%ebp)
  10037b:	75 16                	jne    100393 <readline+0x85>
  10037d:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100381:	7e 10                	jle    100393 <readline+0x85>
            cputchar(c);
  100383:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100386:	89 04 24             	mov    %eax,(%esp)
  100389:	e8 04 ff ff ff       	call   100292 <cputchar>
            i --;
  10038e:	ff 4d f4             	decl   -0xc(%ebp)
  100391:	eb 29                	jmp    1003bc <readline+0xae>
        }
        else if (c == '\n' || c == '\r') {
  100393:	83 7d f0 0a          	cmpl   $0xa,-0x10(%ebp)
  100397:	74 06                	je     10039f <readline+0x91>
  100399:	83 7d f0 0d          	cmpl   $0xd,-0x10(%ebp)
  10039d:	75 95                	jne    100334 <readline+0x26>
            cputchar(c);
  10039f:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1003a2:	89 04 24             	mov    %eax,(%esp)
  1003a5:	e8 e8 fe ff ff       	call   100292 <cputchar>
            buf[i] = '\0';
  1003aa:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1003ad:	05 40 ea 10 00       	add    $0x10ea40,%eax
  1003b2:	c6 00 00             	movb   $0x0,(%eax)
            return buf;
  1003b5:	b8 40 ea 10 00       	mov    $0x10ea40,%eax
  1003ba:	eb 05                	jmp    1003c1 <readline+0xb3>
        }
    }
  1003bc:	e9 73 ff ff ff       	jmp    100334 <readline+0x26>
}
  1003c1:	c9                   	leave  
  1003c2:	c3                   	ret    

001003c3 <__panic>:
/* *
 * __panic - __panic is called on unresolvable fatal errors. it prints
 * "panic: 'message'", and then enters the kernel monitor.
 * */
void
__panic(const char *file, int line, const char *fmt, ...) {
  1003c3:	55                   	push   %ebp
  1003c4:	89 e5                	mov    %esp,%ebp
  1003c6:	83 ec 28             	sub    $0x28,%esp
    if (is_panic) {
  1003c9:	a1 40 ee 10 00       	mov    0x10ee40,%eax
  1003ce:	85 c0                	test   %eax,%eax
  1003d0:	75 5b                	jne    10042d <__panic+0x6a>
        goto panic_dead;
    }
    is_panic = 1;
  1003d2:	c7 05 40 ee 10 00 01 	movl   $0x1,0x10ee40
  1003d9:	00 00 00 

    // print the 'message'
    va_list ap;
    va_start(ap, fmt);
  1003dc:	8d 45 14             	lea    0x14(%ebp),%eax
  1003df:	89 45 f4             	mov    %eax,-0xc(%ebp)
    cprintf("kernel panic at %s:%d:\n    ", file, line);
  1003e2:	8b 45 0c             	mov    0xc(%ebp),%eax
  1003e5:	89 44 24 08          	mov    %eax,0x8(%esp)
  1003e9:	8b 45 08             	mov    0x8(%ebp),%eax
  1003ec:	89 44 24 04          	mov    %eax,0x4(%esp)
  1003f0:	c7 04 24 ca 36 10 00 	movl   $0x1036ca,(%esp)
  1003f7:	e8 70 fe ff ff       	call   10026c <cprintf>
    vcprintf(fmt, ap);
  1003fc:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1003ff:	89 44 24 04          	mov    %eax,0x4(%esp)
  100403:	8b 45 10             	mov    0x10(%ebp),%eax
  100406:	89 04 24             	mov    %eax,(%esp)
  100409:	e8 2b fe ff ff       	call   100239 <vcprintf>
    cprintf("\n");
  10040e:	c7 04 24 e6 36 10 00 	movl   $0x1036e6,(%esp)
  100415:	e8 52 fe ff ff       	call   10026c <cprintf>
    
    cprintf("stack trackback:\n");
  10041a:	c7 04 24 e8 36 10 00 	movl   $0x1036e8,(%esp)
  100421:	e8 46 fe ff ff       	call   10026c <cprintf>
    print_stackframe();
  100426:	e8 32 06 00 00       	call   100a5d <print_stackframe>
  10042b:	eb 01                	jmp    10042e <__panic+0x6b>
 * "panic: 'message'", and then enters the kernel monitor.
 * */
void
__panic(const char *file, int line, const char *fmt, ...) {
    if (is_panic) {
        goto panic_dead;
  10042d:	90                   	nop
    print_stackframe();
    
    va_end(ap);

panic_dead:
    intr_disable();
  10042e:	e8 da 13 00 00       	call   10180d <intr_disable>
    while (1) {
        kmonitor(NULL);
  100433:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  10043a:	e8 68 08 00 00       	call   100ca7 <kmonitor>
    }
  10043f:	eb f2                	jmp    100433 <__panic+0x70>

00100441 <__warn>:
}

/* __warn - like panic, but don't */
void
__warn(const char *file, int line, const char *fmt, ...) {
  100441:	55                   	push   %ebp
  100442:	89 e5                	mov    %esp,%ebp
  100444:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    va_start(ap, fmt);
  100447:	8d 45 14             	lea    0x14(%ebp),%eax
  10044a:	89 45 f4             	mov    %eax,-0xc(%ebp)
    cprintf("kernel warning at %s:%d:\n    ", file, line);
  10044d:	8b 45 0c             	mov    0xc(%ebp),%eax
  100450:	89 44 24 08          	mov    %eax,0x8(%esp)
  100454:	8b 45 08             	mov    0x8(%ebp),%eax
  100457:	89 44 24 04          	mov    %eax,0x4(%esp)
  10045b:	c7 04 24 fa 36 10 00 	movl   $0x1036fa,(%esp)
  100462:	e8 05 fe ff ff       	call   10026c <cprintf>
    vcprintf(fmt, ap);
  100467:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10046a:	89 44 24 04          	mov    %eax,0x4(%esp)
  10046e:	8b 45 10             	mov    0x10(%ebp),%eax
  100471:	89 04 24             	mov    %eax,(%esp)
  100474:	e8 c0 fd ff ff       	call   100239 <vcprintf>
    cprintf("\n");
  100479:	c7 04 24 e6 36 10 00 	movl   $0x1036e6,(%esp)
  100480:	e8 e7 fd ff ff       	call   10026c <cprintf>
    va_end(ap);
}
  100485:	90                   	nop
  100486:	c9                   	leave  
  100487:	c3                   	ret    

00100488 <is_kernel_panic>:

bool
is_kernel_panic(void) {
  100488:	55                   	push   %ebp
  100489:	89 e5                	mov    %esp,%ebp
    return is_panic;
  10048b:	a1 40 ee 10 00       	mov    0x10ee40,%eax
}
  100490:	5d                   	pop    %ebp
  100491:	c3                   	ret    

00100492 <stab_binsearch>:
 *      stab_binsearch(stabs, &left, &right, N_SO, 0xf0100184);
 * will exit setting left = 118, right = 554.
 * */
static void
stab_binsearch(const struct stab *stabs, int *region_left, int *region_right,
           int type, uintptr_t addr) {
  100492:	55                   	push   %ebp
  100493:	89 e5                	mov    %esp,%ebp
  100495:	83 ec 20             	sub    $0x20,%esp
    int l = *region_left, r = *region_right, any_matches = 0;
  100498:	8b 45 0c             	mov    0xc(%ebp),%eax
  10049b:	8b 00                	mov    (%eax),%eax
  10049d:	89 45 fc             	mov    %eax,-0x4(%ebp)
  1004a0:	8b 45 10             	mov    0x10(%ebp),%eax
  1004a3:	8b 00                	mov    (%eax),%eax
  1004a5:	89 45 f8             	mov    %eax,-0x8(%ebp)
  1004a8:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)

    while (l <= r) {
  1004af:	e9 ca 00 00 00       	jmp    10057e <stab_binsearch+0xec>
        int true_m = (l + r) / 2, m = true_m;
  1004b4:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1004b7:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1004ba:	01 d0                	add    %edx,%eax
  1004bc:	89 c2                	mov    %eax,%edx
  1004be:	c1 ea 1f             	shr    $0x1f,%edx
  1004c1:	01 d0                	add    %edx,%eax
  1004c3:	d1 f8                	sar    %eax
  1004c5:	89 45 ec             	mov    %eax,-0x14(%ebp)
  1004c8:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1004cb:	89 45 f0             	mov    %eax,-0x10(%ebp)

        // search for earliest stab with right type
        while (m >= l && stabs[m].n_type != type) {
  1004ce:	eb 03                	jmp    1004d3 <stab_binsearch+0x41>
            m --;
  1004d0:	ff 4d f0             	decl   -0x10(%ebp)

    while (l <= r) {
        int true_m = (l + r) / 2, m = true_m;

        // search for earliest stab with right type
        while (m >= l && stabs[m].n_type != type) {
  1004d3:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1004d6:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  1004d9:	7c 1f                	jl     1004fa <stab_binsearch+0x68>
  1004db:	8b 55 f0             	mov    -0x10(%ebp),%edx
  1004de:	89 d0                	mov    %edx,%eax
  1004e0:	01 c0                	add    %eax,%eax
  1004e2:	01 d0                	add    %edx,%eax
  1004e4:	c1 e0 02             	shl    $0x2,%eax
  1004e7:	89 c2                	mov    %eax,%edx
  1004e9:	8b 45 08             	mov    0x8(%ebp),%eax
  1004ec:	01 d0                	add    %edx,%eax
  1004ee:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  1004f2:	0f b6 c0             	movzbl %al,%eax
  1004f5:	3b 45 14             	cmp    0x14(%ebp),%eax
  1004f8:	75 d6                	jne    1004d0 <stab_binsearch+0x3e>
            m --;
        }
        if (m < l) {    // no match in [l, m]
  1004fa:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1004fd:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  100500:	7d 09                	jge    10050b <stab_binsearch+0x79>
            l = true_m + 1;
  100502:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100505:	40                   	inc    %eax
  100506:	89 45 fc             	mov    %eax,-0x4(%ebp)
            continue;
  100509:	eb 73                	jmp    10057e <stab_binsearch+0xec>
        }

        // actual binary search
        any_matches = 1;
  10050b:	c7 45 f4 01 00 00 00 	movl   $0x1,-0xc(%ebp)
        if (stabs[m].n_value < addr) {
  100512:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100515:	89 d0                	mov    %edx,%eax
  100517:	01 c0                	add    %eax,%eax
  100519:	01 d0                	add    %edx,%eax
  10051b:	c1 e0 02             	shl    $0x2,%eax
  10051e:	89 c2                	mov    %eax,%edx
  100520:	8b 45 08             	mov    0x8(%ebp),%eax
  100523:	01 d0                	add    %edx,%eax
  100525:	8b 40 08             	mov    0x8(%eax),%eax
  100528:	3b 45 18             	cmp    0x18(%ebp),%eax
  10052b:	73 11                	jae    10053e <stab_binsearch+0xac>
            *region_left = m;
  10052d:	8b 45 0c             	mov    0xc(%ebp),%eax
  100530:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100533:	89 10                	mov    %edx,(%eax)
            l = true_m + 1;
  100535:	8b 45 ec             	mov    -0x14(%ebp),%eax
  100538:	40                   	inc    %eax
  100539:	89 45 fc             	mov    %eax,-0x4(%ebp)
  10053c:	eb 40                	jmp    10057e <stab_binsearch+0xec>
        } else if (stabs[m].n_value > addr) {
  10053e:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100541:	89 d0                	mov    %edx,%eax
  100543:	01 c0                	add    %eax,%eax
  100545:	01 d0                	add    %edx,%eax
  100547:	c1 e0 02             	shl    $0x2,%eax
  10054a:	89 c2                	mov    %eax,%edx
  10054c:	8b 45 08             	mov    0x8(%ebp),%eax
  10054f:	01 d0                	add    %edx,%eax
  100551:	8b 40 08             	mov    0x8(%eax),%eax
  100554:	3b 45 18             	cmp    0x18(%ebp),%eax
  100557:	76 14                	jbe    10056d <stab_binsearch+0xdb>
            *region_right = m - 1;
  100559:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10055c:	8d 50 ff             	lea    -0x1(%eax),%edx
  10055f:	8b 45 10             	mov    0x10(%ebp),%eax
  100562:	89 10                	mov    %edx,(%eax)
            r = m - 1;
  100564:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100567:	48                   	dec    %eax
  100568:	89 45 f8             	mov    %eax,-0x8(%ebp)
  10056b:	eb 11                	jmp    10057e <stab_binsearch+0xec>
        } else {
            // exact match for 'addr', but continue loop to find
            // *region_right
            *region_left = m;
  10056d:	8b 45 0c             	mov    0xc(%ebp),%eax
  100570:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100573:	89 10                	mov    %edx,(%eax)
            l = m;
  100575:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100578:	89 45 fc             	mov    %eax,-0x4(%ebp)
            addr ++;
  10057b:	ff 45 18             	incl   0x18(%ebp)
static void
stab_binsearch(const struct stab *stabs, int *region_left, int *region_right,
           int type, uintptr_t addr) {
    int l = *region_left, r = *region_right, any_matches = 0;

    while (l <= r) {
  10057e:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100581:	3b 45 f8             	cmp    -0x8(%ebp),%eax
  100584:	0f 8e 2a ff ff ff    	jle    1004b4 <stab_binsearch+0x22>
            l = m;
            addr ++;
        }
    }

    if (!any_matches) {
  10058a:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  10058e:	75 0f                	jne    10059f <stab_binsearch+0x10d>
        *region_right = *region_left - 1;
  100590:	8b 45 0c             	mov    0xc(%ebp),%eax
  100593:	8b 00                	mov    (%eax),%eax
  100595:	8d 50 ff             	lea    -0x1(%eax),%edx
  100598:	8b 45 10             	mov    0x10(%ebp),%eax
  10059b:	89 10                	mov    %edx,(%eax)
        l = *region_right;
        for (; l > *region_left && stabs[l].n_type != type; l --)
            /* do nothing */;
        *region_left = l;
    }
}
  10059d:	eb 3e                	jmp    1005dd <stab_binsearch+0x14b>
    if (!any_matches) {
        *region_right = *region_left - 1;
    }
    else {
        // find rightmost region containing 'addr'
        l = *region_right;
  10059f:	8b 45 10             	mov    0x10(%ebp),%eax
  1005a2:	8b 00                	mov    (%eax),%eax
  1005a4:	89 45 fc             	mov    %eax,-0x4(%ebp)
        for (; l > *region_left && stabs[l].n_type != type; l --)
  1005a7:	eb 03                	jmp    1005ac <stab_binsearch+0x11a>
  1005a9:	ff 4d fc             	decl   -0x4(%ebp)
  1005ac:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005af:	8b 00                	mov    (%eax),%eax
  1005b1:	3b 45 fc             	cmp    -0x4(%ebp),%eax
  1005b4:	7d 1f                	jge    1005d5 <stab_binsearch+0x143>
  1005b6:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1005b9:	89 d0                	mov    %edx,%eax
  1005bb:	01 c0                	add    %eax,%eax
  1005bd:	01 d0                	add    %edx,%eax
  1005bf:	c1 e0 02             	shl    $0x2,%eax
  1005c2:	89 c2                	mov    %eax,%edx
  1005c4:	8b 45 08             	mov    0x8(%ebp),%eax
  1005c7:	01 d0                	add    %edx,%eax
  1005c9:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  1005cd:	0f b6 c0             	movzbl %al,%eax
  1005d0:	3b 45 14             	cmp    0x14(%ebp),%eax
  1005d3:	75 d4                	jne    1005a9 <stab_binsearch+0x117>
            /* do nothing */;
        *region_left = l;
  1005d5:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005d8:	8b 55 fc             	mov    -0x4(%ebp),%edx
  1005db:	89 10                	mov    %edx,(%eax)
    }
}
  1005dd:	90                   	nop
  1005de:	c9                   	leave  
  1005df:	c3                   	ret    

001005e0 <debuginfo_eip>:
 * the specified instruction address, @addr.  Returns 0 if information
 * was found, and negative if not.  But even if it returns negative it
 * has stored some information into '*info'.
 * */
int
debuginfo_eip(uintptr_t addr, struct eipdebuginfo *info) {
  1005e0:	55                   	push   %ebp
  1005e1:	89 e5                	mov    %esp,%ebp
  1005e3:	83 ec 58             	sub    $0x58,%esp
    const struct stab *stabs, *stab_end;
    const char *stabstr, *stabstr_end;

    info->eip_file = "<unknown>";
  1005e6:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005e9:	c7 00 18 37 10 00    	movl   $0x103718,(%eax)
    info->eip_line = 0;
  1005ef:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005f2:	c7 40 04 00 00 00 00 	movl   $0x0,0x4(%eax)
    info->eip_fn_name = "<unknown>";
  1005f9:	8b 45 0c             	mov    0xc(%ebp),%eax
  1005fc:	c7 40 08 18 37 10 00 	movl   $0x103718,0x8(%eax)
    info->eip_fn_namelen = 9;
  100603:	8b 45 0c             	mov    0xc(%ebp),%eax
  100606:	c7 40 0c 09 00 00 00 	movl   $0x9,0xc(%eax)
    info->eip_fn_addr = addr;
  10060d:	8b 45 0c             	mov    0xc(%ebp),%eax
  100610:	8b 55 08             	mov    0x8(%ebp),%edx
  100613:	89 50 10             	mov    %edx,0x10(%eax)
    info->eip_fn_narg = 0;
  100616:	8b 45 0c             	mov    0xc(%ebp),%eax
  100619:	c7 40 14 00 00 00 00 	movl   $0x0,0x14(%eax)

    stabs = __STAB_BEGIN__;
  100620:	c7 45 f4 6c 3f 10 00 	movl   $0x103f6c,-0xc(%ebp)
    stab_end = __STAB_END__;
  100627:	c7 45 f0 9c ba 10 00 	movl   $0x10ba9c,-0x10(%ebp)
    stabstr = __STABSTR_BEGIN__;
  10062e:	c7 45 ec 9d ba 10 00 	movl   $0x10ba9d,-0x14(%ebp)
    stabstr_end = __STABSTR_END__;
  100635:	c7 45 e8 d1 da 10 00 	movl   $0x10dad1,-0x18(%ebp)

    // String table validity checks
    if (stabstr_end <= stabstr || stabstr_end[-1] != 0) {
  10063c:	8b 45 e8             	mov    -0x18(%ebp),%eax
  10063f:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  100642:	76 0b                	jbe    10064f <debuginfo_eip+0x6f>
  100644:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100647:	48                   	dec    %eax
  100648:	0f b6 00             	movzbl (%eax),%eax
  10064b:	84 c0                	test   %al,%al
  10064d:	74 0a                	je     100659 <debuginfo_eip+0x79>
        return -1;
  10064f:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  100654:	e9 b7 02 00 00       	jmp    100910 <debuginfo_eip+0x330>
    // 'eip'.  First, we find the basic source file containing 'eip'.
    // Then, we look in that source file for the function.  Then we look
    // for the line number.

    // Search the entire set of stabs for the source file (type N_SO).
    int lfile = 0, rfile = (stab_end - stabs) - 1;
  100659:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
  100660:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100663:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100666:	29 c2                	sub    %eax,%edx
  100668:	89 d0                	mov    %edx,%eax
  10066a:	c1 f8 02             	sar    $0x2,%eax
  10066d:	69 c0 ab aa aa aa    	imul   $0xaaaaaaab,%eax,%eax
  100673:	48                   	dec    %eax
  100674:	89 45 e0             	mov    %eax,-0x20(%ebp)
    stab_binsearch(stabs, &lfile, &rfile, N_SO, addr);
  100677:	8b 45 08             	mov    0x8(%ebp),%eax
  10067a:	89 44 24 10          	mov    %eax,0x10(%esp)
  10067e:	c7 44 24 0c 64 00 00 	movl   $0x64,0xc(%esp)
  100685:	00 
  100686:	8d 45 e0             	lea    -0x20(%ebp),%eax
  100689:	89 44 24 08          	mov    %eax,0x8(%esp)
  10068d:	8d 45 e4             	lea    -0x1c(%ebp),%eax
  100690:	89 44 24 04          	mov    %eax,0x4(%esp)
  100694:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100697:	89 04 24             	mov    %eax,(%esp)
  10069a:	e8 f3 fd ff ff       	call   100492 <stab_binsearch>
    if (lfile == 0)
  10069f:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1006a2:	85 c0                	test   %eax,%eax
  1006a4:	75 0a                	jne    1006b0 <debuginfo_eip+0xd0>
        return -1;
  1006a6:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1006ab:	e9 60 02 00 00       	jmp    100910 <debuginfo_eip+0x330>

    // Search within that file's stabs for the function definition
    // (N_FUN).
    int lfun = lfile, rfun = rfile;
  1006b0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1006b3:	89 45 dc             	mov    %eax,-0x24(%ebp)
  1006b6:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1006b9:	89 45 d8             	mov    %eax,-0x28(%ebp)
    int lline, rline;
    stab_binsearch(stabs, &lfun, &rfun, N_FUN, addr);
  1006bc:	8b 45 08             	mov    0x8(%ebp),%eax
  1006bf:	89 44 24 10          	mov    %eax,0x10(%esp)
  1006c3:	c7 44 24 0c 24 00 00 	movl   $0x24,0xc(%esp)
  1006ca:	00 
  1006cb:	8d 45 d8             	lea    -0x28(%ebp),%eax
  1006ce:	89 44 24 08          	mov    %eax,0x8(%esp)
  1006d2:	8d 45 dc             	lea    -0x24(%ebp),%eax
  1006d5:	89 44 24 04          	mov    %eax,0x4(%esp)
  1006d9:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1006dc:	89 04 24             	mov    %eax,(%esp)
  1006df:	e8 ae fd ff ff       	call   100492 <stab_binsearch>

    if (lfun <= rfun) {
  1006e4:	8b 55 dc             	mov    -0x24(%ebp),%edx
  1006e7:	8b 45 d8             	mov    -0x28(%ebp),%eax
  1006ea:	39 c2                	cmp    %eax,%edx
  1006ec:	7f 7c                	jg     10076a <debuginfo_eip+0x18a>
        // stabs[lfun] points to the function name
        // in the string table, but check bounds just in case.
        if (stabs[lfun].n_strx < stabstr_end - stabstr) {
  1006ee:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1006f1:	89 c2                	mov    %eax,%edx
  1006f3:	89 d0                	mov    %edx,%eax
  1006f5:	01 c0                	add    %eax,%eax
  1006f7:	01 d0                	add    %edx,%eax
  1006f9:	c1 e0 02             	shl    $0x2,%eax
  1006fc:	89 c2                	mov    %eax,%edx
  1006fe:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100701:	01 d0                	add    %edx,%eax
  100703:	8b 00                	mov    (%eax),%eax
  100705:	8b 4d e8             	mov    -0x18(%ebp),%ecx
  100708:	8b 55 ec             	mov    -0x14(%ebp),%edx
  10070b:	29 d1                	sub    %edx,%ecx
  10070d:	89 ca                	mov    %ecx,%edx
  10070f:	39 d0                	cmp    %edx,%eax
  100711:	73 22                	jae    100735 <debuginfo_eip+0x155>
            info->eip_fn_name = stabstr + stabs[lfun].n_strx;
  100713:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100716:	89 c2                	mov    %eax,%edx
  100718:	89 d0                	mov    %edx,%eax
  10071a:	01 c0                	add    %eax,%eax
  10071c:	01 d0                	add    %edx,%eax
  10071e:	c1 e0 02             	shl    $0x2,%eax
  100721:	89 c2                	mov    %eax,%edx
  100723:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100726:	01 d0                	add    %edx,%eax
  100728:	8b 10                	mov    (%eax),%edx
  10072a:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10072d:	01 c2                	add    %eax,%edx
  10072f:	8b 45 0c             	mov    0xc(%ebp),%eax
  100732:	89 50 08             	mov    %edx,0x8(%eax)
        }
        info->eip_fn_addr = stabs[lfun].n_value;
  100735:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100738:	89 c2                	mov    %eax,%edx
  10073a:	89 d0                	mov    %edx,%eax
  10073c:	01 c0                	add    %eax,%eax
  10073e:	01 d0                	add    %edx,%eax
  100740:	c1 e0 02             	shl    $0x2,%eax
  100743:	89 c2                	mov    %eax,%edx
  100745:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100748:	01 d0                	add    %edx,%eax
  10074a:	8b 50 08             	mov    0x8(%eax),%edx
  10074d:	8b 45 0c             	mov    0xc(%ebp),%eax
  100750:	89 50 10             	mov    %edx,0x10(%eax)
        addr -= info->eip_fn_addr;
  100753:	8b 45 0c             	mov    0xc(%ebp),%eax
  100756:	8b 40 10             	mov    0x10(%eax),%eax
  100759:	29 45 08             	sub    %eax,0x8(%ebp)
        // Search within the function definition for the line number.
        lline = lfun;
  10075c:	8b 45 dc             	mov    -0x24(%ebp),%eax
  10075f:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        rline = rfun;
  100762:	8b 45 d8             	mov    -0x28(%ebp),%eax
  100765:	89 45 d0             	mov    %eax,-0x30(%ebp)
  100768:	eb 15                	jmp    10077f <debuginfo_eip+0x19f>
    } else {
        // Couldn't find function stab!  Maybe we're in an assembly
        // file.  Search the whole file for the line number.
        info->eip_fn_addr = addr;
  10076a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10076d:	8b 55 08             	mov    0x8(%ebp),%edx
  100770:	89 50 10             	mov    %edx,0x10(%eax)
        lline = lfile;
  100773:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100776:	89 45 d4             	mov    %eax,-0x2c(%ebp)
        rline = rfile;
  100779:	8b 45 e0             	mov    -0x20(%ebp),%eax
  10077c:	89 45 d0             	mov    %eax,-0x30(%ebp)
    }
    info->eip_fn_namelen = strfind(info->eip_fn_name, ':') - info->eip_fn_name;
  10077f:	8b 45 0c             	mov    0xc(%ebp),%eax
  100782:	8b 40 08             	mov    0x8(%eax),%eax
  100785:	c7 44 24 04 3a 00 00 	movl   $0x3a,0x4(%esp)
  10078c:	00 
  10078d:	89 04 24             	mov    %eax,(%esp)
  100790:	e8 01 25 00 00       	call   102c96 <strfind>
  100795:	89 c2                	mov    %eax,%edx
  100797:	8b 45 0c             	mov    0xc(%ebp),%eax
  10079a:	8b 40 08             	mov    0x8(%eax),%eax
  10079d:	29 c2                	sub    %eax,%edx
  10079f:	8b 45 0c             	mov    0xc(%ebp),%eax
  1007a2:	89 50 0c             	mov    %edx,0xc(%eax)

    // Search within [lline, rline] for the line number stab.
    // If found, set info->eip_line to the right line number.
    // If not found, return -1.
    stab_binsearch(stabs, &lline, &rline, N_SLINE, addr);
  1007a5:	8b 45 08             	mov    0x8(%ebp),%eax
  1007a8:	89 44 24 10          	mov    %eax,0x10(%esp)
  1007ac:	c7 44 24 0c 44 00 00 	movl   $0x44,0xc(%esp)
  1007b3:	00 
  1007b4:	8d 45 d0             	lea    -0x30(%ebp),%eax
  1007b7:	89 44 24 08          	mov    %eax,0x8(%esp)
  1007bb:	8d 45 d4             	lea    -0x2c(%ebp),%eax
  1007be:	89 44 24 04          	mov    %eax,0x4(%esp)
  1007c2:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1007c5:	89 04 24             	mov    %eax,(%esp)
  1007c8:	e8 c5 fc ff ff       	call   100492 <stab_binsearch>
    if (lline <= rline) {
  1007cd:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  1007d0:	8b 45 d0             	mov    -0x30(%ebp),%eax
  1007d3:	39 c2                	cmp    %eax,%edx
  1007d5:	7f 23                	jg     1007fa <debuginfo_eip+0x21a>
        info->eip_line = stabs[rline].n_desc;
  1007d7:	8b 45 d0             	mov    -0x30(%ebp),%eax
  1007da:	89 c2                	mov    %eax,%edx
  1007dc:	89 d0                	mov    %edx,%eax
  1007de:	01 c0                	add    %eax,%eax
  1007e0:	01 d0                	add    %edx,%eax
  1007e2:	c1 e0 02             	shl    $0x2,%eax
  1007e5:	89 c2                	mov    %eax,%edx
  1007e7:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1007ea:	01 d0                	add    %edx,%eax
  1007ec:	0f b7 40 06          	movzwl 0x6(%eax),%eax
  1007f0:	89 c2                	mov    %eax,%edx
  1007f2:	8b 45 0c             	mov    0xc(%ebp),%eax
  1007f5:	89 50 04             	mov    %edx,0x4(%eax)

    // Search backwards from the line number for the relevant filename stab.
    // We can't just use the "lfile" stab because inlined functions
    // can interpolate code from a different file!
    // Such included source files use the N_SOL stab type.
    while (lline >= lfile
  1007f8:	eb 11                	jmp    10080b <debuginfo_eip+0x22b>
    // If not found, return -1.
    stab_binsearch(stabs, &lline, &rline, N_SLINE, addr);
    if (lline <= rline) {
        info->eip_line = stabs[rline].n_desc;
    } else {
        return -1;
  1007fa:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  1007ff:	e9 0c 01 00 00       	jmp    100910 <debuginfo_eip+0x330>
    // can interpolate code from a different file!
    // Such included source files use the N_SOL stab type.
    while (lline >= lfile
           && stabs[lline].n_type != N_SOL
           && (stabs[lline].n_type != N_SO || !stabs[lline].n_value)) {
        lline --;
  100804:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100807:	48                   	dec    %eax
  100808:	89 45 d4             	mov    %eax,-0x2c(%ebp)

    // Search backwards from the line number for the relevant filename stab.
    // We can't just use the "lfile" stab because inlined functions
    // can interpolate code from a different file!
    // Such included source files use the N_SOL stab type.
    while (lline >= lfile
  10080b:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  10080e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100811:	39 c2                	cmp    %eax,%edx
  100813:	7c 56                	jl     10086b <debuginfo_eip+0x28b>
           && stabs[lline].n_type != N_SOL
  100815:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100818:	89 c2                	mov    %eax,%edx
  10081a:	89 d0                	mov    %edx,%eax
  10081c:	01 c0                	add    %eax,%eax
  10081e:	01 d0                	add    %edx,%eax
  100820:	c1 e0 02             	shl    $0x2,%eax
  100823:	89 c2                	mov    %eax,%edx
  100825:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100828:	01 d0                	add    %edx,%eax
  10082a:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  10082e:	3c 84                	cmp    $0x84,%al
  100830:	74 39                	je     10086b <debuginfo_eip+0x28b>
           && (stabs[lline].n_type != N_SO || !stabs[lline].n_value)) {
  100832:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100835:	89 c2                	mov    %eax,%edx
  100837:	89 d0                	mov    %edx,%eax
  100839:	01 c0                	add    %eax,%eax
  10083b:	01 d0                	add    %edx,%eax
  10083d:	c1 e0 02             	shl    $0x2,%eax
  100840:	89 c2                	mov    %eax,%edx
  100842:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100845:	01 d0                	add    %edx,%eax
  100847:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  10084b:	3c 64                	cmp    $0x64,%al
  10084d:	75 b5                	jne    100804 <debuginfo_eip+0x224>
  10084f:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100852:	89 c2                	mov    %eax,%edx
  100854:	89 d0                	mov    %edx,%eax
  100856:	01 c0                	add    %eax,%eax
  100858:	01 d0                	add    %edx,%eax
  10085a:	c1 e0 02             	shl    $0x2,%eax
  10085d:	89 c2                	mov    %eax,%edx
  10085f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100862:	01 d0                	add    %edx,%eax
  100864:	8b 40 08             	mov    0x8(%eax),%eax
  100867:	85 c0                	test   %eax,%eax
  100869:	74 99                	je     100804 <debuginfo_eip+0x224>
        lline --;
    }
    if (lline >= lfile && stabs[lline].n_strx < stabstr_end - stabstr) {
  10086b:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  10086e:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100871:	39 c2                	cmp    %eax,%edx
  100873:	7c 46                	jl     1008bb <debuginfo_eip+0x2db>
  100875:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  100878:	89 c2                	mov    %eax,%edx
  10087a:	89 d0                	mov    %edx,%eax
  10087c:	01 c0                	add    %eax,%eax
  10087e:	01 d0                	add    %edx,%eax
  100880:	c1 e0 02             	shl    $0x2,%eax
  100883:	89 c2                	mov    %eax,%edx
  100885:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100888:	01 d0                	add    %edx,%eax
  10088a:	8b 00                	mov    (%eax),%eax
  10088c:	8b 4d e8             	mov    -0x18(%ebp),%ecx
  10088f:	8b 55 ec             	mov    -0x14(%ebp),%edx
  100892:	29 d1                	sub    %edx,%ecx
  100894:	89 ca                	mov    %ecx,%edx
  100896:	39 d0                	cmp    %edx,%eax
  100898:	73 21                	jae    1008bb <debuginfo_eip+0x2db>
        info->eip_file = stabstr + stabs[lline].n_strx;
  10089a:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  10089d:	89 c2                	mov    %eax,%edx
  10089f:	89 d0                	mov    %edx,%eax
  1008a1:	01 c0                	add    %eax,%eax
  1008a3:	01 d0                	add    %edx,%eax
  1008a5:	c1 e0 02             	shl    $0x2,%eax
  1008a8:	89 c2                	mov    %eax,%edx
  1008aa:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1008ad:	01 d0                	add    %edx,%eax
  1008af:	8b 10                	mov    (%eax),%edx
  1008b1:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1008b4:	01 c2                	add    %eax,%edx
  1008b6:	8b 45 0c             	mov    0xc(%ebp),%eax
  1008b9:	89 10                	mov    %edx,(%eax)
    }

    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
  1008bb:	8b 55 dc             	mov    -0x24(%ebp),%edx
  1008be:	8b 45 d8             	mov    -0x28(%ebp),%eax
  1008c1:	39 c2                	cmp    %eax,%edx
  1008c3:	7d 46                	jge    10090b <debuginfo_eip+0x32b>
        for (lline = lfun + 1;
  1008c5:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1008c8:	40                   	inc    %eax
  1008c9:	89 45 d4             	mov    %eax,-0x2c(%ebp)
  1008cc:	eb 16                	jmp    1008e4 <debuginfo_eip+0x304>
             lline < rfun && stabs[lline].n_type == N_PSYM;
             lline ++) {
            info->eip_fn_narg ++;
  1008ce:	8b 45 0c             	mov    0xc(%ebp),%eax
  1008d1:	8b 40 14             	mov    0x14(%eax),%eax
  1008d4:	8d 50 01             	lea    0x1(%eax),%edx
  1008d7:	8b 45 0c             	mov    0xc(%ebp),%eax
  1008da:	89 50 14             	mov    %edx,0x14(%eax)
    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
        for (lline = lfun + 1;
             lline < rfun && stabs[lline].n_type == N_PSYM;
             lline ++) {
  1008dd:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1008e0:	40                   	inc    %eax
  1008e1:	89 45 d4             	mov    %eax,-0x2c(%ebp)

    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
        for (lline = lfun + 1;
             lline < rfun && stabs[lline].n_type == N_PSYM;
  1008e4:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  1008e7:	8b 45 d8             	mov    -0x28(%ebp),%eax
    }

    // Set eip_fn_narg to the number of arguments taken by the function,
    // or 0 if there was no containing function.
    if (lfun < rfun) {
        for (lline = lfun + 1;
  1008ea:	39 c2                	cmp    %eax,%edx
  1008ec:	7d 1d                	jge    10090b <debuginfo_eip+0x32b>
             lline < rfun && stabs[lline].n_type == N_PSYM;
  1008ee:	8b 45 d4             	mov    -0x2c(%ebp),%eax
  1008f1:	89 c2                	mov    %eax,%edx
  1008f3:	89 d0                	mov    %edx,%eax
  1008f5:	01 c0                	add    %eax,%eax
  1008f7:	01 d0                	add    %edx,%eax
  1008f9:	c1 e0 02             	shl    $0x2,%eax
  1008fc:	89 c2                	mov    %eax,%edx
  1008fe:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100901:	01 d0                	add    %edx,%eax
  100903:	0f b6 40 04          	movzbl 0x4(%eax),%eax
  100907:	3c a0                	cmp    $0xa0,%al
  100909:	74 c3                	je     1008ce <debuginfo_eip+0x2ee>
             lline ++) {
            info->eip_fn_narg ++;
        }
    }
    return 0;
  10090b:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100910:	c9                   	leave  
  100911:	c3                   	ret    

00100912 <print_kerninfo>:
 * print_kerninfo - print the information about kernel, including the location
 * of kernel entry, the start addresses of data and text segements, the start
 * address of free memory and how many memory that kernel has used.
 * */
void
print_kerninfo(void) {
  100912:	55                   	push   %ebp
  100913:	89 e5                	mov    %esp,%ebp
  100915:	83 ec 18             	sub    $0x18,%esp
    extern char etext[], edata[], end[], kern_init[];
    cprintf("Special kernel symbols:\n");
  100918:	c7 04 24 22 37 10 00 	movl   $0x103722,(%esp)
  10091f:	e8 48 f9 ff ff       	call   10026c <cprintf>
    cprintf("  entry  0x%08x (phys)\n", kern_init);
  100924:	c7 44 24 04 00 00 10 	movl   $0x100000,0x4(%esp)
  10092b:	00 
  10092c:	c7 04 24 3b 37 10 00 	movl   $0x10373b,(%esp)
  100933:	e8 34 f9 ff ff       	call   10026c <cprintf>
    cprintf("  etext  0x%08x (phys)\n", etext);
  100938:	c7 44 24 04 14 36 10 	movl   $0x103614,0x4(%esp)
  10093f:	00 
  100940:	c7 04 24 53 37 10 00 	movl   $0x103753,(%esp)
  100947:	e8 20 f9 ff ff       	call   10026c <cprintf>
    cprintf("  edata  0x%08x (phys)\n", edata);
  10094c:	c7 44 24 04 16 ea 10 	movl   $0x10ea16,0x4(%esp)
  100953:	00 
  100954:	c7 04 24 6b 37 10 00 	movl   $0x10376b,(%esp)
  10095b:	e8 0c f9 ff ff       	call   10026c <cprintf>
    cprintf("  end    0x%08x (phys)\n", end);
  100960:	c7 44 24 04 20 fd 10 	movl   $0x10fd20,0x4(%esp)
  100967:	00 
  100968:	c7 04 24 83 37 10 00 	movl   $0x103783,(%esp)
  10096f:	e8 f8 f8 ff ff       	call   10026c <cprintf>
    cprintf("Kernel executable memory footprint: %dKB\n", (end - kern_init + 1023)/1024);
  100974:	b8 20 fd 10 00       	mov    $0x10fd20,%eax
  100979:	8d 90 ff 03 00 00    	lea    0x3ff(%eax),%edx
  10097f:	b8 00 00 10 00       	mov    $0x100000,%eax
  100984:	29 c2                	sub    %eax,%edx
  100986:	89 d0                	mov    %edx,%eax
  100988:	8d 90 ff 03 00 00    	lea    0x3ff(%eax),%edx
  10098e:	85 c0                	test   %eax,%eax
  100990:	0f 48 c2             	cmovs  %edx,%eax
  100993:	c1 f8 0a             	sar    $0xa,%eax
  100996:	89 44 24 04          	mov    %eax,0x4(%esp)
  10099a:	c7 04 24 9c 37 10 00 	movl   $0x10379c,(%esp)
  1009a1:	e8 c6 f8 ff ff       	call   10026c <cprintf>
}
  1009a6:	90                   	nop
  1009a7:	c9                   	leave  
  1009a8:	c3                   	ret    

001009a9 <print_debuginfo>:
/* *
 * print_debuginfo - read and print the stat information for the address @eip,
 * and info.eip_fn_addr should be the first address of the related function.
 * */
void
print_debuginfo(uintptr_t eip) {
  1009a9:	55                   	push   %ebp
  1009aa:	89 e5                	mov    %esp,%ebp
  1009ac:	81 ec 48 01 00 00    	sub    $0x148,%esp
    struct eipdebuginfo info;
    if (debuginfo_eip(eip, &info) != 0) {
  1009b2:	8d 45 dc             	lea    -0x24(%ebp),%eax
  1009b5:	89 44 24 04          	mov    %eax,0x4(%esp)
  1009b9:	8b 45 08             	mov    0x8(%ebp),%eax
  1009bc:	89 04 24             	mov    %eax,(%esp)
  1009bf:	e8 1c fc ff ff       	call   1005e0 <debuginfo_eip>
  1009c4:	85 c0                	test   %eax,%eax
  1009c6:	74 15                	je     1009dd <print_debuginfo+0x34>
        cprintf("    <unknow>: -- 0x%08x --\n", eip);
  1009c8:	8b 45 08             	mov    0x8(%ebp),%eax
  1009cb:	89 44 24 04          	mov    %eax,0x4(%esp)
  1009cf:	c7 04 24 c6 37 10 00 	movl   $0x1037c6,(%esp)
  1009d6:	e8 91 f8 ff ff       	call   10026c <cprintf>
        }
        fnname[j] = '\0';
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
                fnname, eip - info.eip_fn_addr);
    }
}
  1009db:	eb 6c                	jmp    100a49 <print_debuginfo+0xa0>
        cprintf("    <unknow>: -- 0x%08x --\n", eip);
    }
    else {
        char fnname[256];
        int j;
        for (j = 0; j < info.eip_fn_namelen; j ++) {
  1009dd:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  1009e4:	eb 1b                	jmp    100a01 <print_debuginfo+0x58>
            fnname[j] = info.eip_fn_name[j];
  1009e6:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  1009e9:	8b 45 f4             	mov    -0xc(%ebp),%eax
  1009ec:	01 d0                	add    %edx,%eax
  1009ee:	0f b6 00             	movzbl (%eax),%eax
  1009f1:	8d 8d dc fe ff ff    	lea    -0x124(%ebp),%ecx
  1009f7:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1009fa:	01 ca                	add    %ecx,%edx
  1009fc:	88 02                	mov    %al,(%edx)
        cprintf("    <unknow>: -- 0x%08x --\n", eip);
    }
    else {
        char fnname[256];
        int j;
        for (j = 0; j < info.eip_fn_namelen; j ++) {
  1009fe:	ff 45 f4             	incl   -0xc(%ebp)
  100a01:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100a04:	3b 45 f4             	cmp    -0xc(%ebp),%eax
  100a07:	7f dd                	jg     1009e6 <print_debuginfo+0x3d>
            fnname[j] = info.eip_fn_name[j];
        }
        fnname[j] = '\0';
  100a09:	8d 95 dc fe ff ff    	lea    -0x124(%ebp),%edx
  100a0f:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100a12:	01 d0                	add    %edx,%eax
  100a14:	c6 00 00             	movb   $0x0,(%eax)
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
                fnname, eip - info.eip_fn_addr);
  100a17:	8b 45 ec             	mov    -0x14(%ebp),%eax
        int j;
        for (j = 0; j < info.eip_fn_namelen; j ++) {
            fnname[j] = info.eip_fn_name[j];
        }
        fnname[j] = '\0';
        cprintf("    %s:%d: %s+%d\n", info.eip_file, info.eip_line,
  100a1a:	8b 55 08             	mov    0x8(%ebp),%edx
  100a1d:	89 d1                	mov    %edx,%ecx
  100a1f:	29 c1                	sub    %eax,%ecx
  100a21:	8b 55 e0             	mov    -0x20(%ebp),%edx
  100a24:	8b 45 dc             	mov    -0x24(%ebp),%eax
  100a27:	89 4c 24 10          	mov    %ecx,0x10(%esp)
  100a2b:	8d 8d dc fe ff ff    	lea    -0x124(%ebp),%ecx
  100a31:	89 4c 24 0c          	mov    %ecx,0xc(%esp)
  100a35:	89 54 24 08          	mov    %edx,0x8(%esp)
  100a39:	89 44 24 04          	mov    %eax,0x4(%esp)
  100a3d:	c7 04 24 e2 37 10 00 	movl   $0x1037e2,(%esp)
  100a44:	e8 23 f8 ff ff       	call   10026c <cprintf>
                fnname, eip - info.eip_fn_addr);
    }
}
  100a49:	90                   	nop
  100a4a:	c9                   	leave  
  100a4b:	c3                   	ret    

00100a4c <read_eip>:

static __noinline uint32_t
read_eip(void) {
  100a4c:	55                   	push   %ebp
  100a4d:	89 e5                	mov    %esp,%ebp
  100a4f:	83 ec 10             	sub    $0x10,%esp
    uint32_t eip;
    asm volatile("movl 4(%%ebp), %0" : "=r" (eip));
  100a52:	8b 45 04             	mov    0x4(%ebp),%eax
  100a55:	89 45 fc             	mov    %eax,-0x4(%ebp)
    return eip;
  100a58:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  100a5b:	c9                   	leave  
  100a5c:	c3                   	ret    

00100a5d <print_stackframe>:
 *
 * Note that, the length of ebp-chain is limited. In boot/bootasm.S, before jumping
 * to the kernel entry, the value of ebp has been set to zero, that's the boundary.
 * */
void
print_stackframe(void) {
  100a5d:	55                   	push   %ebp
  100a5e:	89 e5                	mov    %esp,%ebp
  100a60:	83 ec 38             	sub    $0x38,%esp
}

static inline uint32_t
read_ebp(void) {
    uint32_t ebp;
    asm volatile ("movl %%ebp, %0" : "=r" (ebp));
  100a63:	89 e8                	mov    %ebp,%eax
  100a65:	89 45 e0             	mov    %eax,-0x20(%ebp)
    return ebp;
  100a68:	8b 45 e0             	mov    -0x20(%ebp),%eax
      *    (3.5) popup a calling stackframe
      *           NOTICE: the calling funciton's return addr eip  = ss:[ebp+4]
      *                   the calling funciton's ebp = ss:[ebp]
      */
    // LAB1 2013743 Roslin
    uint32_t ebp=read_ebp();
  100a6b:	89 45 f4             	mov    %eax,-0xc(%ebp)
    uint32_t eip=read_eip();
  100a6e:	e8 d9 ff ff ff       	call   100a4c <read_eip>
  100a73:	89 45 f0             	mov    %eax,-0x10(%ebp)
    // STACKFRAME_DEPTH = 20
    for(int i = 0; ebp && eip && i < STACKFRAME_DEPTH; i++) {
  100a76:	c7 45 ec 00 00 00 00 	movl   $0x0,-0x14(%ebp)
  100a7d:	e9 9c 00 00 00       	jmp    100b1e <print_stackframe+0xc1>
        cprintf("ebp: 0x%08x\n", ebp);
  100a82:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100a85:	89 44 24 04          	mov    %eax,0x4(%esp)
  100a89:	c7 04 24 f4 37 10 00 	movl   $0x1037f4,(%esp)
  100a90:	e8 d7 f7 ff ff       	call   10026c <cprintf>
        cprintf("eip: 0x%08x\n", eip);
  100a95:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100a98:	89 44 24 04          	mov    %eax,0x4(%esp)
  100a9c:	c7 04 24 01 38 10 00 	movl   $0x103801,(%esp)
  100aa3:	e8 c4 f7 ff ff       	call   10026c <cprintf>
        uint32_t *args = (uint32_t *)ebp + 2; //传参
  100aa8:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100aab:	83 c0 08             	add    $0x8,%eax
  100aae:	89 45 e4             	mov    %eax,-0x1c(%ebp)
        cprintf("args: ");
  100ab1:	c7 04 24 0e 38 10 00 	movl   $0x10380e,(%esp)
  100ab8:	e8 af f7 ff ff       	call   10026c <cprintf>
        for(int j = 0; j < 4; j++)
  100abd:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
  100ac4:	eb 24                	jmp    100aea <print_stackframe+0x8d>
            cprintf("0x%08x ",args[j]); 
  100ac6:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100ac9:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  100ad0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100ad3:	01 d0                	add    %edx,%eax
  100ad5:	8b 00                	mov    (%eax),%eax
  100ad7:	89 44 24 04          	mov    %eax,0x4(%esp)
  100adb:	c7 04 24 15 38 10 00 	movl   $0x103815,(%esp)
  100ae2:	e8 85 f7 ff ff       	call   10026c <cprintf>
    for(int i = 0; ebp && eip && i < STACKFRAME_DEPTH; i++) {
        cprintf("ebp: 0x%08x\n", ebp);
        cprintf("eip: 0x%08x\n", eip);
        uint32_t *args = (uint32_t *)ebp + 2; //传参
        cprintf("args: ");
        for(int j = 0; j < 4; j++)
  100ae7:	ff 45 e8             	incl   -0x18(%ebp)
  100aea:	83 7d e8 03          	cmpl   $0x3,-0x18(%ebp)
  100aee:	7e d6                	jle    100ac6 <print_stackframe+0x69>
            cprintf("0x%08x ",args[j]); 
        cprintf("\n");
  100af0:	c7 04 24 1d 38 10 00 	movl   $0x10381d,(%esp)
  100af7:	e8 70 f7 ff ff       	call   10026c <cprintf>
        print_debuginfo(eip - 1);
  100afc:	8b 45 f0             	mov    -0x10(%ebp),%eax
  100aff:	48                   	dec    %eax
  100b00:	89 04 24             	mov    %eax,(%esp)
  100b03:	e8 a1 fe ff ff       	call   1009a9 <print_debuginfo>
        //模拟函数执行完毕
        eip = *((uint32_t *)(ebp + 4));	//调用函数的返回地址
  100b08:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100b0b:	83 c0 04             	add    $0x4,%eax
  100b0e:	8b 00                	mov    (%eax),%eax
  100b10:	89 45 f0             	mov    %eax,-0x10(%ebp)
        ebp = *((uint32_t *)ebp);		//上一个函数的栈针 
  100b13:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100b16:	8b 00                	mov    (%eax),%eax
  100b18:	89 45 f4             	mov    %eax,-0xc(%ebp)
      */
    // LAB1 2013743 Roslin
    uint32_t ebp=read_ebp();
    uint32_t eip=read_eip();
    // STACKFRAME_DEPTH = 20
    for(int i = 0; ebp && eip && i < STACKFRAME_DEPTH; i++) {
  100b1b:	ff 45 ec             	incl   -0x14(%ebp)
  100b1e:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100b22:	74 10                	je     100b34 <print_stackframe+0xd7>
  100b24:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  100b28:	74 0a                	je     100b34 <print_stackframe+0xd7>
  100b2a:	83 7d ec 13          	cmpl   $0x13,-0x14(%ebp)
  100b2e:	0f 8e 4e ff ff ff    	jle    100a82 <print_stackframe+0x25>
        print_debuginfo(eip - 1);
        //模拟函数执行完毕
        eip = *((uint32_t *)(ebp + 4));	//调用函数的返回地址
        ebp = *((uint32_t *)ebp);		//上一个函数的栈针 
    }
}
  100b34:	90                   	nop
  100b35:	c9                   	leave  
  100b36:	c3                   	ret    

00100b37 <parse>:
#define MAXARGS         16
#define WHITESPACE      " \t\n\r"

/* parse - parse the command buffer into whitespace-separated arguments */
static int
parse(char *buf, char **argv) {
  100b37:	55                   	push   %ebp
  100b38:	89 e5                	mov    %esp,%ebp
  100b3a:	83 ec 28             	sub    $0x28,%esp
    int argc = 0;
  100b3d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    while (1) {
        // find global whitespace
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100b44:	eb 0c                	jmp    100b52 <parse+0x1b>
            *buf ++ = '\0';
  100b46:	8b 45 08             	mov    0x8(%ebp),%eax
  100b49:	8d 50 01             	lea    0x1(%eax),%edx
  100b4c:	89 55 08             	mov    %edx,0x8(%ebp)
  100b4f:	c6 00 00             	movb   $0x0,(%eax)
static int
parse(char *buf, char **argv) {
    int argc = 0;
    while (1) {
        // find global whitespace
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
  100b52:	8b 45 08             	mov    0x8(%ebp),%eax
  100b55:	0f b6 00             	movzbl (%eax),%eax
  100b58:	84 c0                	test   %al,%al
  100b5a:	74 1d                	je     100b79 <parse+0x42>
  100b5c:	8b 45 08             	mov    0x8(%ebp),%eax
  100b5f:	0f b6 00             	movzbl (%eax),%eax
  100b62:	0f be c0             	movsbl %al,%eax
  100b65:	89 44 24 04          	mov    %eax,0x4(%esp)
  100b69:	c7 04 24 a0 38 10 00 	movl   $0x1038a0,(%esp)
  100b70:	e8 ef 20 00 00       	call   102c64 <strchr>
  100b75:	85 c0                	test   %eax,%eax
  100b77:	75 cd                	jne    100b46 <parse+0xf>
            *buf ++ = '\0';
        }
        if (*buf == '\0') {
  100b79:	8b 45 08             	mov    0x8(%ebp),%eax
  100b7c:	0f b6 00             	movzbl (%eax),%eax
  100b7f:	84 c0                	test   %al,%al
  100b81:	74 69                	je     100bec <parse+0xb5>
            break;
        }

        // save and scan past next arg
        if (argc == MAXARGS - 1) {
  100b83:	83 7d f4 0f          	cmpl   $0xf,-0xc(%ebp)
  100b87:	75 14                	jne    100b9d <parse+0x66>
            cprintf("Too many arguments (max %d).\n", MAXARGS);
  100b89:	c7 44 24 04 10 00 00 	movl   $0x10,0x4(%esp)
  100b90:	00 
  100b91:	c7 04 24 a5 38 10 00 	movl   $0x1038a5,(%esp)
  100b98:	e8 cf f6 ff ff       	call   10026c <cprintf>
        }
        argv[argc ++] = buf;
  100b9d:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100ba0:	8d 50 01             	lea    0x1(%eax),%edx
  100ba3:	89 55 f4             	mov    %edx,-0xc(%ebp)
  100ba6:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  100bad:	8b 45 0c             	mov    0xc(%ebp),%eax
  100bb0:	01 c2                	add    %eax,%edx
  100bb2:	8b 45 08             	mov    0x8(%ebp),%eax
  100bb5:	89 02                	mov    %eax,(%edx)
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
  100bb7:	eb 03                	jmp    100bbc <parse+0x85>
            buf ++;
  100bb9:	ff 45 08             	incl   0x8(%ebp)
        // save and scan past next arg
        if (argc == MAXARGS - 1) {
            cprintf("Too many arguments (max %d).\n", MAXARGS);
        }
        argv[argc ++] = buf;
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
  100bbc:	8b 45 08             	mov    0x8(%ebp),%eax
  100bbf:	0f b6 00             	movzbl (%eax),%eax
  100bc2:	84 c0                	test   %al,%al
  100bc4:	0f 84 7a ff ff ff    	je     100b44 <parse+0xd>
  100bca:	8b 45 08             	mov    0x8(%ebp),%eax
  100bcd:	0f b6 00             	movzbl (%eax),%eax
  100bd0:	0f be c0             	movsbl %al,%eax
  100bd3:	89 44 24 04          	mov    %eax,0x4(%esp)
  100bd7:	c7 04 24 a0 38 10 00 	movl   $0x1038a0,(%esp)
  100bde:	e8 81 20 00 00       	call   102c64 <strchr>
  100be3:	85 c0                	test   %eax,%eax
  100be5:	74 d2                	je     100bb9 <parse+0x82>
            buf ++;
        }
    }
  100be7:	e9 58 ff ff ff       	jmp    100b44 <parse+0xd>
        // find global whitespace
        while (*buf != '\0' && strchr(WHITESPACE, *buf) != NULL) {
            *buf ++ = '\0';
        }
        if (*buf == '\0') {
            break;
  100bec:	90                   	nop
        argv[argc ++] = buf;
        while (*buf != '\0' && strchr(WHITESPACE, *buf) == NULL) {
            buf ++;
        }
    }
    return argc;
  100bed:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  100bf0:	c9                   	leave  
  100bf1:	c3                   	ret    

00100bf2 <runcmd>:
/* *
 * runcmd - parse the input string, split it into separated arguments
 * and then lookup and invoke some related commands/
 * */
static int
runcmd(char *buf, struct trapframe *tf) {
  100bf2:	55                   	push   %ebp
  100bf3:	89 e5                	mov    %esp,%ebp
  100bf5:	53                   	push   %ebx
  100bf6:	83 ec 64             	sub    $0x64,%esp
    char *argv[MAXARGS];
    int argc = parse(buf, argv);
  100bf9:	8d 45 b0             	lea    -0x50(%ebp),%eax
  100bfc:	89 44 24 04          	mov    %eax,0x4(%esp)
  100c00:	8b 45 08             	mov    0x8(%ebp),%eax
  100c03:	89 04 24             	mov    %eax,(%esp)
  100c06:	e8 2c ff ff ff       	call   100b37 <parse>
  100c0b:	89 45 f0             	mov    %eax,-0x10(%ebp)
    if (argc == 0) {
  100c0e:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  100c12:	75 0a                	jne    100c1e <runcmd+0x2c>
        return 0;
  100c14:	b8 00 00 00 00       	mov    $0x0,%eax
  100c19:	e9 83 00 00 00       	jmp    100ca1 <runcmd+0xaf>
    }
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100c1e:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100c25:	eb 5a                	jmp    100c81 <runcmd+0x8f>
        if (strcmp(commands[i].name, argv[0]) == 0) {
  100c27:	8b 4d b0             	mov    -0x50(%ebp),%ecx
  100c2a:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100c2d:	89 d0                	mov    %edx,%eax
  100c2f:	01 c0                	add    %eax,%eax
  100c31:	01 d0                	add    %edx,%eax
  100c33:	c1 e0 02             	shl    $0x2,%eax
  100c36:	05 00 e0 10 00       	add    $0x10e000,%eax
  100c3b:	8b 00                	mov    (%eax),%eax
  100c3d:	89 4c 24 04          	mov    %ecx,0x4(%esp)
  100c41:	89 04 24             	mov    %eax,(%esp)
  100c44:	e8 7e 1f 00 00       	call   102bc7 <strcmp>
  100c49:	85 c0                	test   %eax,%eax
  100c4b:	75 31                	jne    100c7e <runcmd+0x8c>
            return commands[i].func(argc - 1, argv + 1, tf);
  100c4d:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100c50:	89 d0                	mov    %edx,%eax
  100c52:	01 c0                	add    %eax,%eax
  100c54:	01 d0                	add    %edx,%eax
  100c56:	c1 e0 02             	shl    $0x2,%eax
  100c59:	05 08 e0 10 00       	add    $0x10e008,%eax
  100c5e:	8b 10                	mov    (%eax),%edx
  100c60:	8d 45 b0             	lea    -0x50(%ebp),%eax
  100c63:	83 c0 04             	add    $0x4,%eax
  100c66:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  100c69:	8d 59 ff             	lea    -0x1(%ecx),%ebx
  100c6c:	8b 4d 0c             	mov    0xc(%ebp),%ecx
  100c6f:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  100c73:	89 44 24 04          	mov    %eax,0x4(%esp)
  100c77:	89 1c 24             	mov    %ebx,(%esp)
  100c7a:	ff d2                	call   *%edx
  100c7c:	eb 23                	jmp    100ca1 <runcmd+0xaf>
    int argc = parse(buf, argv);
    if (argc == 0) {
        return 0;
    }
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100c7e:	ff 45 f4             	incl   -0xc(%ebp)
  100c81:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100c84:	83 f8 02             	cmp    $0x2,%eax
  100c87:	76 9e                	jbe    100c27 <runcmd+0x35>
        if (strcmp(commands[i].name, argv[0]) == 0) {
            return commands[i].func(argc - 1, argv + 1, tf);
        }
    }
    cprintf("Unknown command '%s'\n", argv[0]);
  100c89:	8b 45 b0             	mov    -0x50(%ebp),%eax
  100c8c:	89 44 24 04          	mov    %eax,0x4(%esp)
  100c90:	c7 04 24 c3 38 10 00 	movl   $0x1038c3,(%esp)
  100c97:	e8 d0 f5 ff ff       	call   10026c <cprintf>
    return 0;
  100c9c:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100ca1:	83 c4 64             	add    $0x64,%esp
  100ca4:	5b                   	pop    %ebx
  100ca5:	5d                   	pop    %ebp
  100ca6:	c3                   	ret    

00100ca7 <kmonitor>:

/***** Implementations of basic kernel monitor commands *****/

void
kmonitor(struct trapframe *tf) {
  100ca7:	55                   	push   %ebp
  100ca8:	89 e5                	mov    %esp,%ebp
  100caa:	83 ec 28             	sub    $0x28,%esp
    cprintf("Welcome to the kernel debug monitor!!\n");
  100cad:	c7 04 24 dc 38 10 00 	movl   $0x1038dc,(%esp)
  100cb4:	e8 b3 f5 ff ff       	call   10026c <cprintf>
    cprintf("Type 'help' for a list of commands.\n");
  100cb9:	c7 04 24 04 39 10 00 	movl   $0x103904,(%esp)
  100cc0:	e8 a7 f5 ff ff       	call   10026c <cprintf>

    if (tf != NULL) {
  100cc5:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  100cc9:	74 0b                	je     100cd6 <kmonitor+0x2f>
        print_trapframe(tf);
  100ccb:	8b 45 08             	mov    0x8(%ebp),%eax
  100cce:	89 04 24             	mov    %eax,(%esp)
  100cd1:	e8 12 0d 00 00       	call   1019e8 <print_trapframe>
    }

    char *buf;
    while (1) {
        if ((buf = readline("K> ")) != NULL) {
  100cd6:	c7 04 24 29 39 10 00 	movl   $0x103929,(%esp)
  100cdd:	e8 2c f6 ff ff       	call   10030e <readline>
  100ce2:	89 45 f4             	mov    %eax,-0xc(%ebp)
  100ce5:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  100ce9:	74 eb                	je     100cd6 <kmonitor+0x2f>
            if (runcmd(buf, tf) < 0) {
  100ceb:	8b 45 08             	mov    0x8(%ebp),%eax
  100cee:	89 44 24 04          	mov    %eax,0x4(%esp)
  100cf2:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100cf5:	89 04 24             	mov    %eax,(%esp)
  100cf8:	e8 f5 fe ff ff       	call   100bf2 <runcmd>
  100cfd:	85 c0                	test   %eax,%eax
  100cff:	78 02                	js     100d03 <kmonitor+0x5c>
                break;
            }
        }
    }
  100d01:	eb d3                	jmp    100cd6 <kmonitor+0x2f>

    char *buf;
    while (1) {
        if ((buf = readline("K> ")) != NULL) {
            if (runcmd(buf, tf) < 0) {
                break;
  100d03:	90                   	nop
            }
        }
    }
}
  100d04:	90                   	nop
  100d05:	c9                   	leave  
  100d06:	c3                   	ret    

00100d07 <mon_help>:

/* mon_help - print the information about mon_* functions */
int
mon_help(int argc, char **argv, struct trapframe *tf) {
  100d07:	55                   	push   %ebp
  100d08:	89 e5                	mov    %esp,%ebp
  100d0a:	83 ec 28             	sub    $0x28,%esp
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100d0d:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  100d14:	eb 3d                	jmp    100d53 <mon_help+0x4c>
        cprintf("%s - %s\n", commands[i].name, commands[i].desc);
  100d16:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100d19:	89 d0                	mov    %edx,%eax
  100d1b:	01 c0                	add    %eax,%eax
  100d1d:	01 d0                	add    %edx,%eax
  100d1f:	c1 e0 02             	shl    $0x2,%eax
  100d22:	05 04 e0 10 00       	add    $0x10e004,%eax
  100d27:	8b 08                	mov    (%eax),%ecx
  100d29:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100d2c:	89 d0                	mov    %edx,%eax
  100d2e:	01 c0                	add    %eax,%eax
  100d30:	01 d0                	add    %edx,%eax
  100d32:	c1 e0 02             	shl    $0x2,%eax
  100d35:	05 00 e0 10 00       	add    $0x10e000,%eax
  100d3a:	8b 00                	mov    (%eax),%eax
  100d3c:	89 4c 24 08          	mov    %ecx,0x8(%esp)
  100d40:	89 44 24 04          	mov    %eax,0x4(%esp)
  100d44:	c7 04 24 2d 39 10 00 	movl   $0x10392d,(%esp)
  100d4b:	e8 1c f5 ff ff       	call   10026c <cprintf>

/* mon_help - print the information about mon_* functions */
int
mon_help(int argc, char **argv, struct trapframe *tf) {
    int i;
    for (i = 0; i < NCOMMANDS; i ++) {
  100d50:	ff 45 f4             	incl   -0xc(%ebp)
  100d53:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100d56:	83 f8 02             	cmp    $0x2,%eax
  100d59:	76 bb                	jbe    100d16 <mon_help+0xf>
        cprintf("%s - %s\n", commands[i].name, commands[i].desc);
    }
    return 0;
  100d5b:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100d60:	c9                   	leave  
  100d61:	c3                   	ret    

00100d62 <mon_kerninfo>:
/* *
 * mon_kerninfo - call print_kerninfo in kern/debug/kdebug.c to
 * print the memory occupancy in kernel.
 * */
int
mon_kerninfo(int argc, char **argv, struct trapframe *tf) {
  100d62:	55                   	push   %ebp
  100d63:	89 e5                	mov    %esp,%ebp
  100d65:	83 ec 08             	sub    $0x8,%esp
    print_kerninfo();
  100d68:	e8 a5 fb ff ff       	call   100912 <print_kerninfo>
    return 0;
  100d6d:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100d72:	c9                   	leave  
  100d73:	c3                   	ret    

00100d74 <mon_backtrace>:
/* *
 * mon_backtrace - call print_stackframe in kern/debug/kdebug.c to
 * print a backtrace of the stack.
 * */
int
mon_backtrace(int argc, char **argv, struct trapframe *tf) {
  100d74:	55                   	push   %ebp
  100d75:	89 e5                	mov    %esp,%ebp
  100d77:	83 ec 08             	sub    $0x8,%esp
    print_stackframe();
  100d7a:	e8 de fc ff ff       	call   100a5d <print_stackframe>
    return 0;
  100d7f:	b8 00 00 00 00       	mov    $0x0,%eax
}
  100d84:	c9                   	leave  
  100d85:	c3                   	ret    

00100d86 <clock_init>:
/* *
 * clock_init - initialize 8253 clock to interrupt 100 times per second,
 * and then enable IRQ_TIMER.
 * */
void
clock_init(void) {
  100d86:	55                   	push   %ebp
  100d87:	89 e5                	mov    %esp,%ebp
  100d89:	83 ec 28             	sub    $0x28,%esp
  100d8c:	66 c7 45 f6 43 00    	movw   $0x43,-0xa(%ebp)
  100d92:	c6 45 ef 34          	movb   $0x34,-0x11(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100d96:	0f b6 45 ef          	movzbl -0x11(%ebp),%eax
  100d9a:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  100d9e:	ee                   	out    %al,(%dx)
  100d9f:	66 c7 45 f4 40 00    	movw   $0x40,-0xc(%ebp)
  100da5:	c6 45 f0 9c          	movb   $0x9c,-0x10(%ebp)
  100da9:	0f b6 45 f0          	movzbl -0x10(%ebp),%eax
  100dad:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100db0:	ee                   	out    %al,(%dx)
  100db1:	66 c7 45 f2 40 00    	movw   $0x40,-0xe(%ebp)
  100db7:	c6 45 f1 2e          	movb   $0x2e,-0xf(%ebp)
  100dbb:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  100dbf:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  100dc3:	ee                   	out    %al,(%dx)
    outb(TIMER_MODE, TIMER_SEL0 | TIMER_RATEGEN | TIMER_16BIT);
    outb(IO_TIMER1, TIMER_DIV(100) % 256);
    outb(IO_TIMER1, TIMER_DIV(100) / 256);

    // initialize time counter 'ticks' to zero
    ticks = 0;
  100dc4:	c7 05 08 f9 10 00 00 	movl   $0x0,0x10f908
  100dcb:	00 00 00 

    cprintf("++ setup timer interrupts\n");
  100dce:	c7 04 24 36 39 10 00 	movl   $0x103936,(%esp)
  100dd5:	e8 92 f4 ff ff       	call   10026c <cprintf>
    pic_enable(IRQ_TIMER);
  100dda:	c7 04 24 00 00 00 00 	movl   $0x0,(%esp)
  100de1:	e8 ba 08 00 00       	call   1016a0 <pic_enable>
}
  100de6:	90                   	nop
  100de7:	c9                   	leave  
  100de8:	c3                   	ret    

00100de9 <delay>:
#include <picirq.h>
#include <trap.h>

/* stupid I/O delay routine necessitated by historical PC design flaws */
static void
delay(void) {
  100de9:	55                   	push   %ebp
  100dea:	89 e5                	mov    %esp,%ebp
  100dec:	83 ec 10             	sub    $0x10,%esp
  100def:	66 c7 45 fe 84 00    	movw   $0x84,-0x2(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100df5:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  100df9:	89 c2                	mov    %eax,%edx
  100dfb:	ec                   	in     (%dx),%al
  100dfc:	88 45 f4             	mov    %al,-0xc(%ebp)
  100dff:	66 c7 45 fc 84 00    	movw   $0x84,-0x4(%ebp)
  100e05:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e08:	89 c2                	mov    %eax,%edx
  100e0a:	ec                   	in     (%dx),%al
  100e0b:	88 45 f5             	mov    %al,-0xb(%ebp)
  100e0e:	66 c7 45 fa 84 00    	movw   $0x84,-0x6(%ebp)
  100e14:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  100e18:	89 c2                	mov    %eax,%edx
  100e1a:	ec                   	in     (%dx),%al
  100e1b:	88 45 f6             	mov    %al,-0xa(%ebp)
  100e1e:	66 c7 45 f8 84 00    	movw   $0x84,-0x8(%ebp)
  100e24:	8b 45 f8             	mov    -0x8(%ebp),%eax
  100e27:	89 c2                	mov    %eax,%edx
  100e29:	ec                   	in     (%dx),%al
  100e2a:	88 45 f7             	mov    %al,-0x9(%ebp)
    inb(0x84);
    inb(0x84);
    inb(0x84);
    inb(0x84);
}
  100e2d:	90                   	nop
  100e2e:	c9                   	leave  
  100e2f:	c3                   	ret    

00100e30 <cga_init>:
//    -- 数据寄存器 映射 到 端口 0x3D5或0x3B5 
//    -- 索引寄存器 0x3D4或0x3B4,决定在数据寄存器中的数据表示什么。

/* TEXT-mode CGA/VGA display output */
static void
cga_init(void) {
  100e30:	55                   	push   %ebp
  100e31:	89 e5                	mov    %esp,%ebp
  100e33:	83 ec 20             	sub    $0x20,%esp
    volatile uint16_t *cp = (uint16_t *)CGA_BUF;   //CGA_BUF: 0xB8000 (彩色显示的显存物理基址)
  100e36:	c7 45 fc 00 80 0b 00 	movl   $0xb8000,-0x4(%ebp)
    uint16_t was = *cp;                                            //保存当前显存0xB8000处的值
  100e3d:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e40:	0f b7 00             	movzwl (%eax),%eax
  100e43:	66 89 45 fa          	mov    %ax,-0x6(%ebp)
    *cp = (uint16_t) 0xA55A;                                   // 给这个地址随便写个值，看看能否再读出同样的值
  100e47:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e4a:	66 c7 00 5a a5       	movw   $0xa55a,(%eax)
    if (*cp != 0xA55A) {                                            // 如果读不出来，说明没有这块显存，即是单显配置
  100e4f:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e52:	0f b7 00             	movzwl (%eax),%eax
  100e55:	0f b7 c0             	movzwl %ax,%eax
  100e58:	3d 5a a5 00 00       	cmp    $0xa55a,%eax
  100e5d:	74 12                	je     100e71 <cga_init+0x41>
        cp = (uint16_t*)MONO_BUF;                         //设置为单显的显存基址 MONO_BUF： 0xB0000
  100e5f:	c7 45 fc 00 00 0b 00 	movl   $0xb0000,-0x4(%ebp)
        addr_6845 = MONO_BASE;                           //设置为单显控制的IO地址，MONO_BASE: 0x3B4
  100e66:	66 c7 05 66 ee 10 00 	movw   $0x3b4,0x10ee66
  100e6d:	b4 03 
  100e6f:	eb 13                	jmp    100e84 <cga_init+0x54>
    } else {                                                                // 如果读出来了，有这块显存，即是彩显配置
        *cp = was;                                                      //还原原来显存位置的值
  100e71:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100e74:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  100e78:	66 89 10             	mov    %dx,(%eax)
        addr_6845 = CGA_BASE;                               // 设置为彩显控制的IO地址，CGA_BASE: 0x3D4 
  100e7b:	66 c7 05 66 ee 10 00 	movw   $0x3d4,0x10ee66
  100e82:	d4 03 
    // Extract cursor location
    // 6845索引寄存器的index 0x0E（及十进制的14）== 光标位置(高位)
    // 6845索引寄存器的index 0x0F（及十进制的15）== 光标位置(低位)
    // 6845 reg 15 : Cursor Address (Low Byte)
    uint32_t pos;
    outb(addr_6845, 14);                                        
  100e84:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100e8b:	66 89 45 f8          	mov    %ax,-0x8(%ebp)
  100e8f:	c6 45 ea 0e          	movb   $0xe,-0x16(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100e93:	0f b6 45 ea          	movzbl -0x16(%ebp),%eax
  100e97:	8b 55 f8             	mov    -0x8(%ebp),%edx
  100e9a:	ee                   	out    %al,(%dx)
    pos = inb(addr_6845 + 1) << 8;                       //读出了光标位置(高位)
  100e9b:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100ea2:	40                   	inc    %eax
  100ea3:	0f b7 c0             	movzwl %ax,%eax
  100ea6:	66 89 45 f2          	mov    %ax,-0xe(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100eaa:	0f b7 45 f2          	movzwl -0xe(%ebp),%eax
  100eae:	89 c2                	mov    %eax,%edx
  100eb0:	ec                   	in     (%dx),%al
  100eb1:	88 45 eb             	mov    %al,-0x15(%ebp)
    return data;
  100eb4:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
  100eb8:	0f b6 c0             	movzbl %al,%eax
  100ebb:	c1 e0 08             	shl    $0x8,%eax
  100ebe:	89 45 f4             	mov    %eax,-0xc(%ebp)
    outb(addr_6845, 15);
  100ec1:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100ec8:	66 89 45 f0          	mov    %ax,-0x10(%ebp)
  100ecc:	c6 45 ec 0f          	movb   $0xf,-0x14(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100ed0:	0f b6 45 ec          	movzbl -0x14(%ebp),%eax
  100ed4:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100ed7:	ee                   	out    %al,(%dx)
    pos |= inb(addr_6845 + 1);                             //读出了光标位置(低位)
  100ed8:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  100edf:	40                   	inc    %eax
  100ee0:	0f b7 c0             	movzwl %ax,%eax
  100ee3:	66 89 45 ee          	mov    %ax,-0x12(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100ee7:	0f b7 45 ee          	movzwl -0x12(%ebp),%eax
  100eeb:	89 c2                	mov    %eax,%edx
  100eed:	ec                   	in     (%dx),%al
  100eee:	88 45 ed             	mov    %al,-0x13(%ebp)
    return data;
  100ef1:	0f b6 45 ed          	movzbl -0x13(%ebp),%eax
  100ef5:	0f b6 c0             	movzbl %al,%eax
  100ef8:	09 45 f4             	or     %eax,-0xc(%ebp)

    crt_buf = (uint16_t*) cp;                                  //crt_buf是CGA显存起始地址
  100efb:	8b 45 fc             	mov    -0x4(%ebp),%eax
  100efe:	a3 60 ee 10 00       	mov    %eax,0x10ee60
    crt_pos = pos;                                                  //crt_pos是CGA当前光标位置
  100f03:	8b 45 f4             	mov    -0xc(%ebp),%eax
  100f06:	0f b7 c0             	movzwl %ax,%eax
  100f09:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
}
  100f0f:	90                   	nop
  100f10:	c9                   	leave  
  100f11:	c3                   	ret    

00100f12 <serial_init>:

static bool serial_exists = 0;

static void
serial_init(void) {
  100f12:	55                   	push   %ebp
  100f13:	89 e5                	mov    %esp,%ebp
  100f15:	83 ec 38             	sub    $0x38,%esp
  100f18:	66 c7 45 f6 fa 03    	movw   $0x3fa,-0xa(%ebp)
  100f1e:	c6 45 da 00          	movb   $0x0,-0x26(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  100f22:	0f b6 45 da          	movzbl -0x26(%ebp),%eax
  100f26:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  100f2a:	ee                   	out    %al,(%dx)
  100f2b:	66 c7 45 f4 fb 03    	movw   $0x3fb,-0xc(%ebp)
  100f31:	c6 45 db 80          	movb   $0x80,-0x25(%ebp)
  100f35:	0f b6 45 db          	movzbl -0x25(%ebp),%eax
  100f39:	8b 55 f4             	mov    -0xc(%ebp),%edx
  100f3c:	ee                   	out    %al,(%dx)
  100f3d:	66 c7 45 f2 f8 03    	movw   $0x3f8,-0xe(%ebp)
  100f43:	c6 45 dc 0c          	movb   $0xc,-0x24(%ebp)
  100f47:	0f b6 45 dc          	movzbl -0x24(%ebp),%eax
  100f4b:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  100f4f:	ee                   	out    %al,(%dx)
  100f50:	66 c7 45 f0 f9 03    	movw   $0x3f9,-0x10(%ebp)
  100f56:	c6 45 dd 00          	movb   $0x0,-0x23(%ebp)
  100f5a:	0f b6 45 dd          	movzbl -0x23(%ebp),%eax
  100f5e:	8b 55 f0             	mov    -0x10(%ebp),%edx
  100f61:	ee                   	out    %al,(%dx)
  100f62:	66 c7 45 ee fb 03    	movw   $0x3fb,-0x12(%ebp)
  100f68:	c6 45 de 03          	movb   $0x3,-0x22(%ebp)
  100f6c:	0f b6 45 de          	movzbl -0x22(%ebp),%eax
  100f70:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  100f74:	ee                   	out    %al,(%dx)
  100f75:	66 c7 45 ec fc 03    	movw   $0x3fc,-0x14(%ebp)
  100f7b:	c6 45 df 00          	movb   $0x0,-0x21(%ebp)
  100f7f:	0f b6 45 df          	movzbl -0x21(%ebp),%eax
  100f83:	8b 55 ec             	mov    -0x14(%ebp),%edx
  100f86:	ee                   	out    %al,(%dx)
  100f87:	66 c7 45 ea f9 03    	movw   $0x3f9,-0x16(%ebp)
  100f8d:	c6 45 e0 01          	movb   $0x1,-0x20(%ebp)
  100f91:	0f b6 45 e0          	movzbl -0x20(%ebp),%eax
  100f95:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  100f99:	ee                   	out    %al,(%dx)
  100f9a:	66 c7 45 e8 fd 03    	movw   $0x3fd,-0x18(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100fa0:	8b 45 e8             	mov    -0x18(%ebp),%eax
  100fa3:	89 c2                	mov    %eax,%edx
  100fa5:	ec                   	in     (%dx),%al
  100fa6:	88 45 e1             	mov    %al,-0x1f(%ebp)
    return data;
  100fa9:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
    // Enable rcv interrupts
    outb(COM1 + COM_IER, COM_IER_RDI);

    // Clear any preexisting overrun indications and interrupts
    // Serial port doesn't exist if COM_LSR returns 0xFF
    serial_exists = (inb(COM1 + COM_LSR) != 0xFF);
  100fad:	3c ff                	cmp    $0xff,%al
  100faf:	0f 95 c0             	setne  %al
  100fb2:	0f b6 c0             	movzbl %al,%eax
  100fb5:	a3 68 ee 10 00       	mov    %eax,0x10ee68
  100fba:	66 c7 45 e6 fa 03    	movw   $0x3fa,-0x1a(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  100fc0:	0f b7 45 e6          	movzwl -0x1a(%ebp),%eax
  100fc4:	89 c2                	mov    %eax,%edx
  100fc6:	ec                   	in     (%dx),%al
  100fc7:	88 45 e2             	mov    %al,-0x1e(%ebp)
  100fca:	66 c7 45 e4 f8 03    	movw   $0x3f8,-0x1c(%ebp)
  100fd0:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  100fd3:	89 c2                	mov    %eax,%edx
  100fd5:	ec                   	in     (%dx),%al
  100fd6:	88 45 e3             	mov    %al,-0x1d(%ebp)
    (void) inb(COM1+COM_IIR);
    (void) inb(COM1+COM_RX);

    if (serial_exists) {
  100fd9:	a1 68 ee 10 00       	mov    0x10ee68,%eax
  100fde:	85 c0                	test   %eax,%eax
  100fe0:	74 0c                	je     100fee <serial_init+0xdc>
        pic_enable(IRQ_COM1);
  100fe2:	c7 04 24 04 00 00 00 	movl   $0x4,(%esp)
  100fe9:	e8 b2 06 00 00       	call   1016a0 <pic_enable>
    }
}
  100fee:	90                   	nop
  100fef:	c9                   	leave  
  100ff0:	c3                   	ret    

00100ff1 <lpt_putc_sub>:

static void
lpt_putc_sub(int c) {
  100ff1:	55                   	push   %ebp
  100ff2:	89 e5                	mov    %esp,%ebp
  100ff4:	83 ec 10             	sub    $0x10,%esp
    int i;
    for (i = 0; !(inb(LPTPORT + 1) & 0x80) && i < 12800; i ++) {
  100ff7:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  100ffe:	eb 08                	jmp    101008 <lpt_putc_sub+0x17>
        delay();
  101000:	e8 e4 fd ff ff       	call   100de9 <delay>
}

static void
lpt_putc_sub(int c) {
    int i;
    for (i = 0; !(inb(LPTPORT + 1) & 0x80) && i < 12800; i ++) {
  101005:	ff 45 fc             	incl   -0x4(%ebp)
  101008:	66 c7 45 f4 79 03    	movw   $0x379,-0xc(%ebp)
  10100e:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101011:	89 c2                	mov    %eax,%edx
  101013:	ec                   	in     (%dx),%al
  101014:	88 45 f3             	mov    %al,-0xd(%ebp)
    return data;
  101017:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  10101b:	84 c0                	test   %al,%al
  10101d:	78 09                	js     101028 <lpt_putc_sub+0x37>
  10101f:	81 7d fc ff 31 00 00 	cmpl   $0x31ff,-0x4(%ebp)
  101026:	7e d8                	jle    101000 <lpt_putc_sub+0xf>
        delay();
    }
    outb(LPTPORT + 0, c);
  101028:	8b 45 08             	mov    0x8(%ebp),%eax
  10102b:	0f b6 c0             	movzbl %al,%eax
  10102e:	66 c7 45 f8 78 03    	movw   $0x378,-0x8(%ebp)
  101034:	88 45 f0             	mov    %al,-0x10(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101037:	0f b6 45 f0          	movzbl -0x10(%ebp),%eax
  10103b:	8b 55 f8             	mov    -0x8(%ebp),%edx
  10103e:	ee                   	out    %al,(%dx)
  10103f:	66 c7 45 f6 7a 03    	movw   $0x37a,-0xa(%ebp)
  101045:	c6 45 f1 0d          	movb   $0xd,-0xf(%ebp)
  101049:	0f b6 45 f1          	movzbl -0xf(%ebp),%eax
  10104d:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  101051:	ee                   	out    %al,(%dx)
  101052:	66 c7 45 fa 7a 03    	movw   $0x37a,-0x6(%ebp)
  101058:	c6 45 f2 08          	movb   $0x8,-0xe(%ebp)
  10105c:	0f b6 45 f2          	movzbl -0xe(%ebp),%eax
  101060:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  101064:	ee                   	out    %al,(%dx)
    outb(LPTPORT + 2, 0x08 | 0x04 | 0x01);
    outb(LPTPORT + 2, 0x08);
}
  101065:	90                   	nop
  101066:	c9                   	leave  
  101067:	c3                   	ret    

00101068 <lpt_putc>:

/* lpt_putc - copy console output to parallel port */
static void
lpt_putc(int c) {
  101068:	55                   	push   %ebp
  101069:	89 e5                	mov    %esp,%ebp
  10106b:	83 ec 04             	sub    $0x4,%esp
    if (c != '\b') {
  10106e:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  101072:	74 0d                	je     101081 <lpt_putc+0x19>
        lpt_putc_sub(c);
  101074:	8b 45 08             	mov    0x8(%ebp),%eax
  101077:	89 04 24             	mov    %eax,(%esp)
  10107a:	e8 72 ff ff ff       	call   100ff1 <lpt_putc_sub>
    else {
        lpt_putc_sub('\b');
        lpt_putc_sub(' ');
        lpt_putc_sub('\b');
    }
}
  10107f:	eb 24                	jmp    1010a5 <lpt_putc+0x3d>
lpt_putc(int c) {
    if (c != '\b') {
        lpt_putc_sub(c);
    }
    else {
        lpt_putc_sub('\b');
  101081:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  101088:	e8 64 ff ff ff       	call   100ff1 <lpt_putc_sub>
        lpt_putc_sub(' ');
  10108d:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  101094:	e8 58 ff ff ff       	call   100ff1 <lpt_putc_sub>
        lpt_putc_sub('\b');
  101099:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  1010a0:	e8 4c ff ff ff       	call   100ff1 <lpt_putc_sub>
    }
}
  1010a5:	90                   	nop
  1010a6:	c9                   	leave  
  1010a7:	c3                   	ret    

001010a8 <cga_putc>:

/* cga_putc - print character to console */
static void
cga_putc(int c) {
  1010a8:	55                   	push   %ebp
  1010a9:	89 e5                	mov    %esp,%ebp
  1010ab:	53                   	push   %ebx
  1010ac:	83 ec 24             	sub    $0x24,%esp
    // set black on white
    if (!(c & ~0xFF)) {
  1010af:	8b 45 08             	mov    0x8(%ebp),%eax
  1010b2:	25 00 ff ff ff       	and    $0xffffff00,%eax
  1010b7:	85 c0                	test   %eax,%eax
  1010b9:	75 07                	jne    1010c2 <cga_putc+0x1a>
        c |= 0x0700;
  1010bb:	81 4d 08 00 07 00 00 	orl    $0x700,0x8(%ebp)
    }

    switch (c & 0xff) {
  1010c2:	8b 45 08             	mov    0x8(%ebp),%eax
  1010c5:	0f b6 c0             	movzbl %al,%eax
  1010c8:	83 f8 0a             	cmp    $0xa,%eax
  1010cb:	74 54                	je     101121 <cga_putc+0x79>
  1010cd:	83 f8 0d             	cmp    $0xd,%eax
  1010d0:	74 62                	je     101134 <cga_putc+0x8c>
  1010d2:	83 f8 08             	cmp    $0x8,%eax
  1010d5:	0f 85 93 00 00 00    	jne    10116e <cga_putc+0xc6>
    case '\b':
        if (crt_pos > 0) {
  1010db:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  1010e2:	85 c0                	test   %eax,%eax
  1010e4:	0f 84 ae 00 00 00    	je     101198 <cga_putc+0xf0>
            crt_pos --;
  1010ea:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  1010f1:	48                   	dec    %eax
  1010f2:	0f b7 c0             	movzwl %ax,%eax
  1010f5:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
            crt_buf[crt_pos] = (c & ~0xff) | ' ';
  1010fb:	a1 60 ee 10 00       	mov    0x10ee60,%eax
  101100:	0f b7 15 64 ee 10 00 	movzwl 0x10ee64,%edx
  101107:	01 d2                	add    %edx,%edx
  101109:	01 c2                	add    %eax,%edx
  10110b:	8b 45 08             	mov    0x8(%ebp),%eax
  10110e:	98                   	cwtl   
  10110f:	25 00 ff ff ff       	and    $0xffffff00,%eax
  101114:	98                   	cwtl   
  101115:	83 c8 20             	or     $0x20,%eax
  101118:	98                   	cwtl   
  101119:	0f b7 c0             	movzwl %ax,%eax
  10111c:	66 89 02             	mov    %ax,(%edx)
        }
        break;
  10111f:	eb 77                	jmp    101198 <cga_putc+0xf0>
    case '\n':
        crt_pos += CRT_COLS;
  101121:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  101128:	83 c0 50             	add    $0x50,%eax
  10112b:	0f b7 c0             	movzwl %ax,%eax
  10112e:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
    case '\r':
        crt_pos -= (crt_pos % CRT_COLS);
  101134:	0f b7 1d 64 ee 10 00 	movzwl 0x10ee64,%ebx
  10113b:	0f b7 0d 64 ee 10 00 	movzwl 0x10ee64,%ecx
  101142:	ba cd cc cc cc       	mov    $0xcccccccd,%edx
  101147:	89 c8                	mov    %ecx,%eax
  101149:	f7 e2                	mul    %edx
  10114b:	c1 ea 06             	shr    $0x6,%edx
  10114e:	89 d0                	mov    %edx,%eax
  101150:	c1 e0 02             	shl    $0x2,%eax
  101153:	01 d0                	add    %edx,%eax
  101155:	c1 e0 04             	shl    $0x4,%eax
  101158:	29 c1                	sub    %eax,%ecx
  10115a:	89 c8                	mov    %ecx,%eax
  10115c:	0f b7 c0             	movzwl %ax,%eax
  10115f:	29 c3                	sub    %eax,%ebx
  101161:	89 d8                	mov    %ebx,%eax
  101163:	0f b7 c0             	movzwl %ax,%eax
  101166:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
        break;
  10116c:	eb 2b                	jmp    101199 <cga_putc+0xf1>
    default:
        crt_buf[crt_pos ++] = c;     // write the character
  10116e:	8b 0d 60 ee 10 00    	mov    0x10ee60,%ecx
  101174:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  10117b:	8d 50 01             	lea    0x1(%eax),%edx
  10117e:	0f b7 d2             	movzwl %dx,%edx
  101181:	66 89 15 64 ee 10 00 	mov    %dx,0x10ee64
  101188:	01 c0                	add    %eax,%eax
  10118a:	8d 14 01             	lea    (%ecx,%eax,1),%edx
  10118d:	8b 45 08             	mov    0x8(%ebp),%eax
  101190:	0f b7 c0             	movzwl %ax,%eax
  101193:	66 89 02             	mov    %ax,(%edx)
        break;
  101196:	eb 01                	jmp    101199 <cga_putc+0xf1>
    case '\b':
        if (crt_pos > 0) {
            crt_pos --;
            crt_buf[crt_pos] = (c & ~0xff) | ' ';
        }
        break;
  101198:	90                   	nop
        crt_buf[crt_pos ++] = c;     // write the character
        break;
    }

    // What is the purpose of this?
    if (crt_pos >= CRT_SIZE) {
  101199:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  1011a0:	3d cf 07 00 00       	cmp    $0x7cf,%eax
  1011a5:	76 5d                	jbe    101204 <cga_putc+0x15c>
        int i;
        memmove(crt_buf, crt_buf + CRT_COLS, (CRT_SIZE - CRT_COLS) * sizeof(uint16_t));
  1011a7:	a1 60 ee 10 00       	mov    0x10ee60,%eax
  1011ac:	8d 90 a0 00 00 00    	lea    0xa0(%eax),%edx
  1011b2:	a1 60 ee 10 00       	mov    0x10ee60,%eax
  1011b7:	c7 44 24 08 00 0f 00 	movl   $0xf00,0x8(%esp)
  1011be:	00 
  1011bf:	89 54 24 04          	mov    %edx,0x4(%esp)
  1011c3:	89 04 24             	mov    %eax,(%esp)
  1011c6:	e8 8f 1c 00 00       	call   102e5a <memmove>
        for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i ++) {
  1011cb:	c7 45 f4 80 07 00 00 	movl   $0x780,-0xc(%ebp)
  1011d2:	eb 14                	jmp    1011e8 <cga_putc+0x140>
            crt_buf[i] = 0x0700 | ' ';
  1011d4:	a1 60 ee 10 00       	mov    0x10ee60,%eax
  1011d9:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1011dc:	01 d2                	add    %edx,%edx
  1011de:	01 d0                	add    %edx,%eax
  1011e0:	66 c7 00 20 07       	movw   $0x720,(%eax)

    // What is the purpose of this?
    if (crt_pos >= CRT_SIZE) {
        int i;
        memmove(crt_buf, crt_buf + CRT_COLS, (CRT_SIZE - CRT_COLS) * sizeof(uint16_t));
        for (i = CRT_SIZE - CRT_COLS; i < CRT_SIZE; i ++) {
  1011e5:	ff 45 f4             	incl   -0xc(%ebp)
  1011e8:	81 7d f4 cf 07 00 00 	cmpl   $0x7cf,-0xc(%ebp)
  1011ef:	7e e3                	jle    1011d4 <cga_putc+0x12c>
            crt_buf[i] = 0x0700 | ' ';
        }
        crt_pos -= CRT_COLS;
  1011f1:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  1011f8:	83 e8 50             	sub    $0x50,%eax
  1011fb:	0f b7 c0             	movzwl %ax,%eax
  1011fe:	66 a3 64 ee 10 00    	mov    %ax,0x10ee64
    }

    // move that little blinky thing
    outb(addr_6845, 14);
  101204:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  10120b:	66 89 45 f2          	mov    %ax,-0xe(%ebp)
  10120f:	c6 45 e8 0e          	movb   $0xe,-0x18(%ebp)
  101213:	0f b6 45 e8          	movzbl -0x18(%ebp),%eax
  101217:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  10121b:	ee                   	out    %al,(%dx)
    outb(addr_6845 + 1, crt_pos >> 8);
  10121c:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  101223:	c1 e8 08             	shr    $0x8,%eax
  101226:	0f b7 c0             	movzwl %ax,%eax
  101229:	0f b6 c0             	movzbl %al,%eax
  10122c:	0f b7 15 66 ee 10 00 	movzwl 0x10ee66,%edx
  101233:	42                   	inc    %edx
  101234:	0f b7 d2             	movzwl %dx,%edx
  101237:	66 89 55 f0          	mov    %dx,-0x10(%ebp)
  10123b:	88 45 e9             	mov    %al,-0x17(%ebp)
  10123e:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  101242:	8b 55 f0             	mov    -0x10(%ebp),%edx
  101245:	ee                   	out    %al,(%dx)
    outb(addr_6845, 15);
  101246:	0f b7 05 66 ee 10 00 	movzwl 0x10ee66,%eax
  10124d:	66 89 45 ee          	mov    %ax,-0x12(%ebp)
  101251:	c6 45 ea 0f          	movb   $0xf,-0x16(%ebp)
  101255:	0f b6 45 ea          	movzbl -0x16(%ebp),%eax
  101259:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  10125d:	ee                   	out    %al,(%dx)
    outb(addr_6845 + 1, crt_pos);
  10125e:	0f b7 05 64 ee 10 00 	movzwl 0x10ee64,%eax
  101265:	0f b6 c0             	movzbl %al,%eax
  101268:	0f b7 15 66 ee 10 00 	movzwl 0x10ee66,%edx
  10126f:	42                   	inc    %edx
  101270:	0f b7 d2             	movzwl %dx,%edx
  101273:	66 89 55 ec          	mov    %dx,-0x14(%ebp)
  101277:	88 45 eb             	mov    %al,-0x15(%ebp)
  10127a:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
  10127e:	8b 55 ec             	mov    -0x14(%ebp),%edx
  101281:	ee                   	out    %al,(%dx)
}
  101282:	90                   	nop
  101283:	83 c4 24             	add    $0x24,%esp
  101286:	5b                   	pop    %ebx
  101287:	5d                   	pop    %ebp
  101288:	c3                   	ret    

00101289 <serial_putc_sub>:

static void
serial_putc_sub(int c) {
  101289:	55                   	push   %ebp
  10128a:	89 e5                	mov    %esp,%ebp
  10128c:	83 ec 10             	sub    $0x10,%esp
    int i;
    for (i = 0; !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800; i ++) {
  10128f:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  101296:	eb 08                	jmp    1012a0 <serial_putc_sub+0x17>
        delay();
  101298:	e8 4c fb ff ff       	call   100de9 <delay>
}

static void
serial_putc_sub(int c) {
    int i;
    for (i = 0; !(inb(COM1 + COM_LSR) & COM_LSR_TXRDY) && i < 12800; i ++) {
  10129d:	ff 45 fc             	incl   -0x4(%ebp)
  1012a0:	66 c7 45 f8 fd 03    	movw   $0x3fd,-0x8(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  1012a6:	8b 45 f8             	mov    -0x8(%ebp),%eax
  1012a9:	89 c2                	mov    %eax,%edx
  1012ab:	ec                   	in     (%dx),%al
  1012ac:	88 45 f7             	mov    %al,-0x9(%ebp)
    return data;
  1012af:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
  1012b3:	0f b6 c0             	movzbl %al,%eax
  1012b6:	83 e0 20             	and    $0x20,%eax
  1012b9:	85 c0                	test   %eax,%eax
  1012bb:	75 09                	jne    1012c6 <serial_putc_sub+0x3d>
  1012bd:	81 7d fc ff 31 00 00 	cmpl   $0x31ff,-0x4(%ebp)
  1012c4:	7e d2                	jle    101298 <serial_putc_sub+0xf>
        delay();
    }
    outb(COM1 + COM_TX, c);
  1012c6:	8b 45 08             	mov    0x8(%ebp),%eax
  1012c9:	0f b6 c0             	movzbl %al,%eax
  1012cc:	66 c7 45 fa f8 03    	movw   $0x3f8,-0x6(%ebp)
  1012d2:	88 45 f6             	mov    %al,-0xa(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  1012d5:	0f b6 45 f6          	movzbl -0xa(%ebp),%eax
  1012d9:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  1012dd:	ee                   	out    %al,(%dx)
}
  1012de:	90                   	nop
  1012df:	c9                   	leave  
  1012e0:	c3                   	ret    

001012e1 <serial_putc>:

/* serial_putc - print character to serial port */
static void
serial_putc(int c) {
  1012e1:	55                   	push   %ebp
  1012e2:	89 e5                	mov    %esp,%ebp
  1012e4:	83 ec 04             	sub    $0x4,%esp
    if (c != '\b') {
  1012e7:	83 7d 08 08          	cmpl   $0x8,0x8(%ebp)
  1012eb:	74 0d                	je     1012fa <serial_putc+0x19>
        serial_putc_sub(c);
  1012ed:	8b 45 08             	mov    0x8(%ebp),%eax
  1012f0:	89 04 24             	mov    %eax,(%esp)
  1012f3:	e8 91 ff ff ff       	call   101289 <serial_putc_sub>
    else {
        serial_putc_sub('\b');
        serial_putc_sub(' ');
        serial_putc_sub('\b');
    }
}
  1012f8:	eb 24                	jmp    10131e <serial_putc+0x3d>
serial_putc(int c) {
    if (c != '\b') {
        serial_putc_sub(c);
    }
    else {
        serial_putc_sub('\b');
  1012fa:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  101301:	e8 83 ff ff ff       	call   101289 <serial_putc_sub>
        serial_putc_sub(' ');
  101306:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  10130d:	e8 77 ff ff ff       	call   101289 <serial_putc_sub>
        serial_putc_sub('\b');
  101312:	c7 04 24 08 00 00 00 	movl   $0x8,(%esp)
  101319:	e8 6b ff ff ff       	call   101289 <serial_putc_sub>
    }
}
  10131e:	90                   	nop
  10131f:	c9                   	leave  
  101320:	c3                   	ret    

00101321 <cons_intr>:
/* *
 * cons_intr - called by device interrupt routines to feed input
 * characters into the circular console input buffer.
 * */
static void
cons_intr(int (*proc)(void)) {
  101321:	55                   	push   %ebp
  101322:	89 e5                	mov    %esp,%ebp
  101324:	83 ec 18             	sub    $0x18,%esp
    int c;
    while ((c = (*proc)()) != -1) {
  101327:	eb 33                	jmp    10135c <cons_intr+0x3b>
        if (c != 0) {
  101329:	83 7d f4 00          	cmpl   $0x0,-0xc(%ebp)
  10132d:	74 2d                	je     10135c <cons_intr+0x3b>
            cons.buf[cons.wpos ++] = c;
  10132f:	a1 84 f0 10 00       	mov    0x10f084,%eax
  101334:	8d 50 01             	lea    0x1(%eax),%edx
  101337:	89 15 84 f0 10 00    	mov    %edx,0x10f084
  10133d:	8b 55 f4             	mov    -0xc(%ebp),%edx
  101340:	88 90 80 ee 10 00    	mov    %dl,0x10ee80(%eax)
            if (cons.wpos == CONSBUFSIZE) {
  101346:	a1 84 f0 10 00       	mov    0x10f084,%eax
  10134b:	3d 00 02 00 00       	cmp    $0x200,%eax
  101350:	75 0a                	jne    10135c <cons_intr+0x3b>
                cons.wpos = 0;
  101352:	c7 05 84 f0 10 00 00 	movl   $0x0,0x10f084
  101359:	00 00 00 
 * characters into the circular console input buffer.
 * */
static void
cons_intr(int (*proc)(void)) {
    int c;
    while ((c = (*proc)()) != -1) {
  10135c:	8b 45 08             	mov    0x8(%ebp),%eax
  10135f:	ff d0                	call   *%eax
  101361:	89 45 f4             	mov    %eax,-0xc(%ebp)
  101364:	83 7d f4 ff          	cmpl   $0xffffffff,-0xc(%ebp)
  101368:	75 bf                	jne    101329 <cons_intr+0x8>
            if (cons.wpos == CONSBUFSIZE) {
                cons.wpos = 0;
            }
        }
    }
}
  10136a:	90                   	nop
  10136b:	c9                   	leave  
  10136c:	c3                   	ret    

0010136d <serial_proc_data>:

/* serial_proc_data - get data from serial port */
static int
serial_proc_data(void) {
  10136d:	55                   	push   %ebp
  10136e:	89 e5                	mov    %esp,%ebp
  101370:	83 ec 10             	sub    $0x10,%esp
  101373:	66 c7 45 f8 fd 03    	movw   $0x3fd,-0x8(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  101379:	8b 45 f8             	mov    -0x8(%ebp),%eax
  10137c:	89 c2                	mov    %eax,%edx
  10137e:	ec                   	in     (%dx),%al
  10137f:	88 45 f7             	mov    %al,-0x9(%ebp)
    return data;
  101382:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
    if (!(inb(COM1 + COM_LSR) & COM_LSR_DATA)) {
  101386:	0f b6 c0             	movzbl %al,%eax
  101389:	83 e0 01             	and    $0x1,%eax
  10138c:	85 c0                	test   %eax,%eax
  10138e:	75 07                	jne    101397 <serial_proc_data+0x2a>
        return -1;
  101390:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  101395:	eb 2a                	jmp    1013c1 <serial_proc_data+0x54>
  101397:	66 c7 45 fa f8 03    	movw   $0x3f8,-0x6(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  10139d:	0f b7 45 fa          	movzwl -0x6(%ebp),%eax
  1013a1:	89 c2                	mov    %eax,%edx
  1013a3:	ec                   	in     (%dx),%al
  1013a4:	88 45 f6             	mov    %al,-0xa(%ebp)
    return data;
  1013a7:	0f b6 45 f6          	movzbl -0xa(%ebp),%eax
    }
    int c = inb(COM1 + COM_RX);
  1013ab:	0f b6 c0             	movzbl %al,%eax
  1013ae:	89 45 fc             	mov    %eax,-0x4(%ebp)
    if (c == 127) {
  1013b1:	83 7d fc 7f          	cmpl   $0x7f,-0x4(%ebp)
  1013b5:	75 07                	jne    1013be <serial_proc_data+0x51>
        c = '\b';
  1013b7:	c7 45 fc 08 00 00 00 	movl   $0x8,-0x4(%ebp)
    }
    return c;
  1013be:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  1013c1:	c9                   	leave  
  1013c2:	c3                   	ret    

001013c3 <serial_intr>:

/* serial_intr - try to feed input characters from serial port */
void
serial_intr(void) {
  1013c3:	55                   	push   %ebp
  1013c4:	89 e5                	mov    %esp,%ebp
  1013c6:	83 ec 18             	sub    $0x18,%esp
    if (serial_exists) {
  1013c9:	a1 68 ee 10 00       	mov    0x10ee68,%eax
  1013ce:	85 c0                	test   %eax,%eax
  1013d0:	74 0c                	je     1013de <serial_intr+0x1b>
        cons_intr(serial_proc_data);
  1013d2:	c7 04 24 6d 13 10 00 	movl   $0x10136d,(%esp)
  1013d9:	e8 43 ff ff ff       	call   101321 <cons_intr>
    }
}
  1013de:	90                   	nop
  1013df:	c9                   	leave  
  1013e0:	c3                   	ret    

001013e1 <kbd_proc_data>:
 *
 * The kbd_proc_data() function gets data from the keyboard.
 * If we finish a character, return it, else 0. And return -1 if no data.
 * */
static int
kbd_proc_data(void) {
  1013e1:	55                   	push   %ebp
  1013e2:	89 e5                	mov    %esp,%ebp
  1013e4:	83 ec 28             	sub    $0x28,%esp
  1013e7:	66 c7 45 ec 64 00    	movw   $0x64,-0x14(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  1013ed:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1013f0:	89 c2                	mov    %eax,%edx
  1013f2:	ec                   	in     (%dx),%al
  1013f3:	88 45 eb             	mov    %al,-0x15(%ebp)
    return data;
  1013f6:	0f b6 45 eb          	movzbl -0x15(%ebp),%eax
    int c;
    uint8_t data;
    static uint32_t shift;

    if ((inb(KBSTATP) & KBS_DIB) == 0) {
  1013fa:	0f b6 c0             	movzbl %al,%eax
  1013fd:	83 e0 01             	and    $0x1,%eax
  101400:	85 c0                	test   %eax,%eax
  101402:	75 0a                	jne    10140e <kbd_proc_data+0x2d>
        return -1;
  101404:	b8 ff ff ff ff       	mov    $0xffffffff,%eax
  101409:	e9 56 01 00 00       	jmp    101564 <kbd_proc_data+0x183>
  10140e:	66 c7 45 f0 60 00    	movw   $0x60,-0x10(%ebp)
static inline void ltr(uint16_t sel) __attribute__((always_inline));

static inline uint8_t
inb(uint16_t port) {
    uint8_t data;
    asm volatile ("inb %1, %0" : "=a" (data) : "d" (port));
  101414:	8b 45 f0             	mov    -0x10(%ebp),%eax
  101417:	89 c2                	mov    %eax,%edx
  101419:	ec                   	in     (%dx),%al
  10141a:	88 45 ea             	mov    %al,-0x16(%ebp)
    return data;
  10141d:	0f b6 45 ea          	movzbl -0x16(%ebp),%eax
    }

    data = inb(KBDATAP);
  101421:	88 45 f3             	mov    %al,-0xd(%ebp)

    if (data == 0xE0) {
  101424:	80 7d f3 e0          	cmpb   $0xe0,-0xd(%ebp)
  101428:	75 17                	jne    101441 <kbd_proc_data+0x60>
        // E0 escape character
        shift |= E0ESC;
  10142a:	a1 88 f0 10 00       	mov    0x10f088,%eax
  10142f:	83 c8 40             	or     $0x40,%eax
  101432:	a3 88 f0 10 00       	mov    %eax,0x10f088
        return 0;
  101437:	b8 00 00 00 00       	mov    $0x0,%eax
  10143c:	e9 23 01 00 00       	jmp    101564 <kbd_proc_data+0x183>
    } else if (data & 0x80) {
  101441:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101445:	84 c0                	test   %al,%al
  101447:	79 45                	jns    10148e <kbd_proc_data+0xad>
        // Key released
        data = (shift & E0ESC ? data : data & 0x7F);
  101449:	a1 88 f0 10 00       	mov    0x10f088,%eax
  10144e:	83 e0 40             	and    $0x40,%eax
  101451:	85 c0                	test   %eax,%eax
  101453:	75 08                	jne    10145d <kbd_proc_data+0x7c>
  101455:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101459:	24 7f                	and    $0x7f,%al
  10145b:	eb 04                	jmp    101461 <kbd_proc_data+0x80>
  10145d:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101461:	88 45 f3             	mov    %al,-0xd(%ebp)
        shift &= ~(shiftcode[data] | E0ESC);
  101464:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  101468:	0f b6 80 40 e0 10 00 	movzbl 0x10e040(%eax),%eax
  10146f:	0c 40                	or     $0x40,%al
  101471:	0f b6 c0             	movzbl %al,%eax
  101474:	f7 d0                	not    %eax
  101476:	89 c2                	mov    %eax,%edx
  101478:	a1 88 f0 10 00       	mov    0x10f088,%eax
  10147d:	21 d0                	and    %edx,%eax
  10147f:	a3 88 f0 10 00       	mov    %eax,0x10f088
        return 0;
  101484:	b8 00 00 00 00       	mov    $0x0,%eax
  101489:	e9 d6 00 00 00       	jmp    101564 <kbd_proc_data+0x183>
    } else if (shift & E0ESC) {
  10148e:	a1 88 f0 10 00       	mov    0x10f088,%eax
  101493:	83 e0 40             	and    $0x40,%eax
  101496:	85 c0                	test   %eax,%eax
  101498:	74 11                	je     1014ab <kbd_proc_data+0xca>
        // Last character was an E0 escape; or with 0x80
        data |= 0x80;
  10149a:	80 4d f3 80          	orb    $0x80,-0xd(%ebp)
        shift &= ~E0ESC;
  10149e:	a1 88 f0 10 00       	mov    0x10f088,%eax
  1014a3:	83 e0 bf             	and    $0xffffffbf,%eax
  1014a6:	a3 88 f0 10 00       	mov    %eax,0x10f088
    }

    shift |= shiftcode[data];
  1014ab:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1014af:	0f b6 80 40 e0 10 00 	movzbl 0x10e040(%eax),%eax
  1014b6:	0f b6 d0             	movzbl %al,%edx
  1014b9:	a1 88 f0 10 00       	mov    0x10f088,%eax
  1014be:	09 d0                	or     %edx,%eax
  1014c0:	a3 88 f0 10 00       	mov    %eax,0x10f088
    shift ^= togglecode[data];
  1014c5:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1014c9:	0f b6 80 40 e1 10 00 	movzbl 0x10e140(%eax),%eax
  1014d0:	0f b6 d0             	movzbl %al,%edx
  1014d3:	a1 88 f0 10 00       	mov    0x10f088,%eax
  1014d8:	31 d0                	xor    %edx,%eax
  1014da:	a3 88 f0 10 00       	mov    %eax,0x10f088

    c = charcode[shift & (CTL | SHIFT)][data];
  1014df:	a1 88 f0 10 00       	mov    0x10f088,%eax
  1014e4:	83 e0 03             	and    $0x3,%eax
  1014e7:	8b 14 85 40 e5 10 00 	mov    0x10e540(,%eax,4),%edx
  1014ee:	0f b6 45 f3          	movzbl -0xd(%ebp),%eax
  1014f2:	01 d0                	add    %edx,%eax
  1014f4:	0f b6 00             	movzbl (%eax),%eax
  1014f7:	0f b6 c0             	movzbl %al,%eax
  1014fa:	89 45 f4             	mov    %eax,-0xc(%ebp)
    if (shift & CAPSLOCK) {
  1014fd:	a1 88 f0 10 00       	mov    0x10f088,%eax
  101502:	83 e0 08             	and    $0x8,%eax
  101505:	85 c0                	test   %eax,%eax
  101507:	74 22                	je     10152b <kbd_proc_data+0x14a>
        if ('a' <= c && c <= 'z')
  101509:	83 7d f4 60          	cmpl   $0x60,-0xc(%ebp)
  10150d:	7e 0c                	jle    10151b <kbd_proc_data+0x13a>
  10150f:	83 7d f4 7a          	cmpl   $0x7a,-0xc(%ebp)
  101513:	7f 06                	jg     10151b <kbd_proc_data+0x13a>
            c += 'A' - 'a';
  101515:	83 6d f4 20          	subl   $0x20,-0xc(%ebp)
  101519:	eb 10                	jmp    10152b <kbd_proc_data+0x14a>
        else if ('A' <= c && c <= 'Z')
  10151b:	83 7d f4 40          	cmpl   $0x40,-0xc(%ebp)
  10151f:	7e 0a                	jle    10152b <kbd_proc_data+0x14a>
  101521:	83 7d f4 5a          	cmpl   $0x5a,-0xc(%ebp)
  101525:	7f 04                	jg     10152b <kbd_proc_data+0x14a>
            c += 'a' - 'A';
  101527:	83 45 f4 20          	addl   $0x20,-0xc(%ebp)
    }

    // Process special keys
    // Ctrl-Alt-Del: reboot
    if (!(~shift & (CTL | ALT)) && c == KEY_DEL) {
  10152b:	a1 88 f0 10 00       	mov    0x10f088,%eax
  101530:	f7 d0                	not    %eax
  101532:	83 e0 06             	and    $0x6,%eax
  101535:	85 c0                	test   %eax,%eax
  101537:	75 28                	jne    101561 <kbd_proc_data+0x180>
  101539:	81 7d f4 e9 00 00 00 	cmpl   $0xe9,-0xc(%ebp)
  101540:	75 1f                	jne    101561 <kbd_proc_data+0x180>
        cprintf("Rebooting!\n");
  101542:	c7 04 24 51 39 10 00 	movl   $0x103951,(%esp)
  101549:	e8 1e ed ff ff       	call   10026c <cprintf>
  10154e:	66 c7 45 ee 92 00    	movw   $0x92,-0x12(%ebp)
  101554:	c6 45 e9 03          	movb   $0x3,-0x17(%ebp)
            : "memory", "cc");
}

static inline void
outb(uint16_t port, uint8_t data) {
    asm volatile ("outb %0, %1" :: "a" (data), "d" (port));
  101558:	0f b6 45 e9          	movzbl -0x17(%ebp),%eax
  10155c:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  101560:	ee                   	out    %al,(%dx)
        outb(0x92, 0x3); // courtesy of Chris Frost
    }
    return c;
  101561:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  101564:	c9                   	leave  
  101565:	c3                   	ret    

00101566 <kbd_intr>:

/* kbd_intr - try to feed input characters from keyboard */
static void
kbd_intr(void) {
  101566:	55                   	push   %ebp
  101567:	89 e5                	mov    %esp,%ebp
  101569:	83 ec 18             	sub    $0x18,%esp
    cons_intr(kbd_proc_data);
  10156c:	c7 04 24 e1 13 10 00 	movl   $0x1013e1,(%esp)
  101573:	e8 a9 fd ff ff       	call   101321 <cons_intr>
}
  101578:	90                   	nop
  101579:	c9                   	leave  
  10157a:	c3                   	ret    

0010157b <kbd_init>:

static void
kbd_init(void) {
  10157b:	55                   	push   %ebp
  10157c:	89 e5                	mov    %esp,%ebp
  10157e:	83 ec 18             	sub    $0x18,%esp
    // drain the kbd buffer
    kbd_intr();
  101581:	e8 e0 ff ff ff       	call   101566 <kbd_intr>
    pic_enable(IRQ_KBD);
  101586:	c7 04 24 01 00 00 00 	movl   $0x1,(%esp)
  10158d:	e8 0e 01 00 00       	call   1016a0 <pic_enable>
}
  101592:	90                   	nop
  101593:	c9                   	leave  
  101594:	c3                   	ret    

00101595 <cons_init>:

/* cons_init - initializes the console devices */
void
cons_init(void) {
  101595:	55                   	push   %ebp
  101596:	89 e5                	mov    %esp,%ebp
  101598:	83 ec 18             	sub    $0x18,%esp
    cga_init();
  10159b:	e8 90 f8 ff ff       	call   100e30 <cga_init>
    serial_init();
  1015a0:	e8 6d f9 ff ff       	call   100f12 <serial_init>
    kbd_init();
  1015a5:	e8 d1 ff ff ff       	call   10157b <kbd_init>
    if (!serial_exists) {
  1015aa:	a1 68 ee 10 00       	mov    0x10ee68,%eax
  1015af:	85 c0                	test   %eax,%eax
  1015b1:	75 0c                	jne    1015bf <cons_init+0x2a>
        cprintf("serial port does not exist!!\n");
  1015b3:	c7 04 24 5d 39 10 00 	movl   $0x10395d,(%esp)
  1015ba:	e8 ad ec ff ff       	call   10026c <cprintf>
    }
}
  1015bf:	90                   	nop
  1015c0:	c9                   	leave  
  1015c1:	c3                   	ret    

001015c2 <cons_putc>:

/* cons_putc - print a single character @c to console devices */
void
cons_putc(int c) {
  1015c2:	55                   	push   %ebp
  1015c3:	89 e5                	mov    %esp,%ebp
  1015c5:	83 ec 18             	sub    $0x18,%esp
    lpt_putc(c);
  1015c8:	8b 45 08             	mov    0x8(%ebp),%eax
  1015cb:	89 04 24             	mov    %eax,(%esp)
  1015ce:	e8 95 fa ff ff       	call   101068 <lpt_putc>
    cga_putc(c);
  1015d3:	8b 45 08             	mov    0x8(%ebp),%eax
  1015d6:	89 04 24             	mov    %eax,(%esp)
  1015d9:	e8 ca fa ff ff       	call   1010a8 <cga_putc>
    serial_putc(c);
  1015de:	8b 45 08             	mov    0x8(%ebp),%eax
  1015e1:	89 04 24             	mov    %eax,(%esp)
  1015e4:	e8 f8 fc ff ff       	call   1012e1 <serial_putc>
}
  1015e9:	90                   	nop
  1015ea:	c9                   	leave  
  1015eb:	c3                   	ret    

001015ec <cons_getc>:
/* *
 * cons_getc - return the next input character from console,
 * or 0 if none waiting.
 * */
int
cons_getc(void) {
  1015ec:	55                   	push   %ebp
  1015ed:	89 e5                	mov    %esp,%ebp
  1015ef:	83 ec 18             	sub    $0x18,%esp
    int c;

    // poll for any pending input characters,
    // so that this function works even when interrupts are disabled
    // (e.g., when called from the kernel monitor).
    serial_intr();
  1015f2:	e8 cc fd ff ff       	call   1013c3 <serial_intr>
    kbd_intr();
  1015f7:	e8 6a ff ff ff       	call   101566 <kbd_intr>

    // grab the next character from the input buffer.
    if (cons.rpos != cons.wpos) {
  1015fc:	8b 15 80 f0 10 00    	mov    0x10f080,%edx
  101602:	a1 84 f0 10 00       	mov    0x10f084,%eax
  101607:	39 c2                	cmp    %eax,%edx
  101609:	74 36                	je     101641 <cons_getc+0x55>
        c = cons.buf[cons.rpos ++];
  10160b:	a1 80 f0 10 00       	mov    0x10f080,%eax
  101610:	8d 50 01             	lea    0x1(%eax),%edx
  101613:	89 15 80 f0 10 00    	mov    %edx,0x10f080
  101619:	0f b6 80 80 ee 10 00 	movzbl 0x10ee80(%eax),%eax
  101620:	0f b6 c0             	movzbl %al,%eax
  101623:	89 45 f4             	mov    %eax,-0xc(%ebp)
        if (cons.rpos == CONSBUFSIZE) {
  101626:	a1 80 f0 10 00       	mov    0x10f080,%eax
  10162b:	3d 00 02 00 00       	cmp    $0x200,%eax
  101630:	75 0a                	jne    10163c <cons_getc+0x50>
            cons.rpos = 0;
  101632:	c7 05 80 f0 10 00 00 	movl   $0x0,0x10f080
  101639:	00 00 00 
        }
        return c;
  10163c:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10163f:	eb 05                	jmp    101646 <cons_getc+0x5a>
    }
    return 0;
  101641:	b8 00 00 00 00       	mov    $0x0,%eax
}
  101646:	c9                   	leave  
  101647:	c3                   	ret    

00101648 <pic_setmask>:
// Initial IRQ mask has interrupt 2 enabled (for slave 8259A).
static uint16_t irq_mask = 0xFFFF & ~(1 << IRQ_SLAVE);
static bool did_init = 0;

static void
pic_setmask(uint16_t mask) {
  101648:	55                   	push   %ebp
  101649:	89 e5                	mov    %esp,%ebp
  10164b:	83 ec 14             	sub    $0x14,%esp
  10164e:	8b 45 08             	mov    0x8(%ebp),%eax
  101651:	66 89 45 ec          	mov    %ax,-0x14(%ebp)
    irq_mask = mask;
  101655:	8b 45 ec             	mov    -0x14(%ebp),%eax
  101658:	66 a3 50 e5 10 00    	mov    %ax,0x10e550
    if (did_init) {
  10165e:	a1 8c f0 10 00       	mov    0x10f08c,%eax
  101663:	85 c0                	test   %eax,%eax
  101665:	74 36                	je     10169d <pic_setmask+0x55>
        outb(IO_PIC1 + 1, mask);
  101667:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10166a:	0f b6 c0             	movzbl %al,%eax
  10166d:	66 c7 45 fe 21 00    	movw   $0x21,-0x2(%ebp)
  101673:	88 45 fa             	mov    %al,-0x6(%ebp)
  101676:	0f b6 45 fa          	movzbl -0x6(%ebp),%eax
  10167a:	0f b7 55 fe          	movzwl -0x2(%ebp),%edx
  10167e:	ee                   	out    %al,(%dx)
        outb(IO_PIC2 + 1, mask >> 8);
  10167f:	0f b7 45 ec          	movzwl -0x14(%ebp),%eax
  101683:	c1 e8 08             	shr    $0x8,%eax
  101686:	0f b7 c0             	movzwl %ax,%eax
  101689:	0f b6 c0             	movzbl %al,%eax
  10168c:	66 c7 45 fc a1 00    	movw   $0xa1,-0x4(%ebp)
  101692:	88 45 fb             	mov    %al,-0x5(%ebp)
  101695:	0f b6 45 fb          	movzbl -0x5(%ebp),%eax
  101699:	8b 55 fc             	mov    -0x4(%ebp),%edx
  10169c:	ee                   	out    %al,(%dx)
    }
}
  10169d:	90                   	nop
  10169e:	c9                   	leave  
  10169f:	c3                   	ret    

001016a0 <pic_enable>:

void
pic_enable(unsigned int irq) {
  1016a0:	55                   	push   %ebp
  1016a1:	89 e5                	mov    %esp,%ebp
  1016a3:	83 ec 04             	sub    $0x4,%esp
    pic_setmask(irq_mask & ~(1 << irq));
  1016a6:	8b 45 08             	mov    0x8(%ebp),%eax
  1016a9:	ba 01 00 00 00       	mov    $0x1,%edx
  1016ae:	88 c1                	mov    %al,%cl
  1016b0:	d3 e2                	shl    %cl,%edx
  1016b2:	89 d0                	mov    %edx,%eax
  1016b4:	98                   	cwtl   
  1016b5:	f7 d0                	not    %eax
  1016b7:	0f bf d0             	movswl %ax,%edx
  1016ba:	0f b7 05 50 e5 10 00 	movzwl 0x10e550,%eax
  1016c1:	98                   	cwtl   
  1016c2:	21 d0                	and    %edx,%eax
  1016c4:	98                   	cwtl   
  1016c5:	0f b7 c0             	movzwl %ax,%eax
  1016c8:	89 04 24             	mov    %eax,(%esp)
  1016cb:	e8 78 ff ff ff       	call   101648 <pic_setmask>
}
  1016d0:	90                   	nop
  1016d1:	c9                   	leave  
  1016d2:	c3                   	ret    

001016d3 <pic_init>:

/* pic_init - initialize the 8259A interrupt controllers */
void
pic_init(void) {
  1016d3:	55                   	push   %ebp
  1016d4:	89 e5                	mov    %esp,%ebp
  1016d6:	83 ec 34             	sub    $0x34,%esp
    did_init = 1;
  1016d9:	c7 05 8c f0 10 00 01 	movl   $0x1,0x10f08c
  1016e0:	00 00 00 
  1016e3:	66 c7 45 fe 21 00    	movw   $0x21,-0x2(%ebp)
  1016e9:	c6 45 d6 ff          	movb   $0xff,-0x2a(%ebp)
  1016ed:	0f b6 45 d6          	movzbl -0x2a(%ebp),%eax
  1016f1:	0f b7 55 fe          	movzwl -0x2(%ebp),%edx
  1016f5:	ee                   	out    %al,(%dx)
  1016f6:	66 c7 45 fc a1 00    	movw   $0xa1,-0x4(%ebp)
  1016fc:	c6 45 d7 ff          	movb   $0xff,-0x29(%ebp)
  101700:	0f b6 45 d7          	movzbl -0x29(%ebp),%eax
  101704:	8b 55 fc             	mov    -0x4(%ebp),%edx
  101707:	ee                   	out    %al,(%dx)
  101708:	66 c7 45 fa 20 00    	movw   $0x20,-0x6(%ebp)
  10170e:	c6 45 d8 11          	movb   $0x11,-0x28(%ebp)
  101712:	0f b6 45 d8          	movzbl -0x28(%ebp),%eax
  101716:	0f b7 55 fa          	movzwl -0x6(%ebp),%edx
  10171a:	ee                   	out    %al,(%dx)
  10171b:	66 c7 45 f8 21 00    	movw   $0x21,-0x8(%ebp)
  101721:	c6 45 d9 20          	movb   $0x20,-0x27(%ebp)
  101725:	0f b6 45 d9          	movzbl -0x27(%ebp),%eax
  101729:	8b 55 f8             	mov    -0x8(%ebp),%edx
  10172c:	ee                   	out    %al,(%dx)
  10172d:	66 c7 45 f6 21 00    	movw   $0x21,-0xa(%ebp)
  101733:	c6 45 da 04          	movb   $0x4,-0x26(%ebp)
  101737:	0f b6 45 da          	movzbl -0x26(%ebp),%eax
  10173b:	0f b7 55 f6          	movzwl -0xa(%ebp),%edx
  10173f:	ee                   	out    %al,(%dx)
  101740:	66 c7 45 f4 21 00    	movw   $0x21,-0xc(%ebp)
  101746:	c6 45 db 03          	movb   $0x3,-0x25(%ebp)
  10174a:	0f b6 45 db          	movzbl -0x25(%ebp),%eax
  10174e:	8b 55 f4             	mov    -0xc(%ebp),%edx
  101751:	ee                   	out    %al,(%dx)
  101752:	66 c7 45 f2 a0 00    	movw   $0xa0,-0xe(%ebp)
  101758:	c6 45 dc 11          	movb   $0x11,-0x24(%ebp)
  10175c:	0f b6 45 dc          	movzbl -0x24(%ebp),%eax
  101760:	0f b7 55 f2          	movzwl -0xe(%ebp),%edx
  101764:	ee                   	out    %al,(%dx)
  101765:	66 c7 45 f0 a1 00    	movw   $0xa1,-0x10(%ebp)
  10176b:	c6 45 dd 28          	movb   $0x28,-0x23(%ebp)
  10176f:	0f b6 45 dd          	movzbl -0x23(%ebp),%eax
  101773:	8b 55 f0             	mov    -0x10(%ebp),%edx
  101776:	ee                   	out    %al,(%dx)
  101777:	66 c7 45 ee a1 00    	movw   $0xa1,-0x12(%ebp)
  10177d:	c6 45 de 02          	movb   $0x2,-0x22(%ebp)
  101781:	0f b6 45 de          	movzbl -0x22(%ebp),%eax
  101785:	0f b7 55 ee          	movzwl -0x12(%ebp),%edx
  101789:	ee                   	out    %al,(%dx)
  10178a:	66 c7 45 ec a1 00    	movw   $0xa1,-0x14(%ebp)
  101790:	c6 45 df 03          	movb   $0x3,-0x21(%ebp)
  101794:	0f b6 45 df          	movzbl -0x21(%ebp),%eax
  101798:	8b 55 ec             	mov    -0x14(%ebp),%edx
  10179b:	ee                   	out    %al,(%dx)
  10179c:	66 c7 45 ea 20 00    	movw   $0x20,-0x16(%ebp)
  1017a2:	c6 45 e0 68          	movb   $0x68,-0x20(%ebp)
  1017a6:	0f b6 45 e0          	movzbl -0x20(%ebp),%eax
  1017aa:	0f b7 55 ea          	movzwl -0x16(%ebp),%edx
  1017ae:	ee                   	out    %al,(%dx)
  1017af:	66 c7 45 e8 20 00    	movw   $0x20,-0x18(%ebp)
  1017b5:	c6 45 e1 0a          	movb   $0xa,-0x1f(%ebp)
  1017b9:	0f b6 45 e1          	movzbl -0x1f(%ebp),%eax
  1017bd:	8b 55 e8             	mov    -0x18(%ebp),%edx
  1017c0:	ee                   	out    %al,(%dx)
  1017c1:	66 c7 45 e6 a0 00    	movw   $0xa0,-0x1a(%ebp)
  1017c7:	c6 45 e2 68          	movb   $0x68,-0x1e(%ebp)
  1017cb:	0f b6 45 e2          	movzbl -0x1e(%ebp),%eax
  1017cf:	0f b7 55 e6          	movzwl -0x1a(%ebp),%edx
  1017d3:	ee                   	out    %al,(%dx)
  1017d4:	66 c7 45 e4 a0 00    	movw   $0xa0,-0x1c(%ebp)
  1017da:	c6 45 e3 0a          	movb   $0xa,-0x1d(%ebp)
  1017de:	0f b6 45 e3          	movzbl -0x1d(%ebp),%eax
  1017e2:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  1017e5:	ee                   	out    %al,(%dx)
    outb(IO_PIC1, 0x0a);    // read IRR by default

    outb(IO_PIC2, 0x68);    // OCW3
    outb(IO_PIC2, 0x0a);    // OCW3

    if (irq_mask != 0xFFFF) {
  1017e6:	0f b7 05 50 e5 10 00 	movzwl 0x10e550,%eax
  1017ed:	3d ff ff 00 00       	cmp    $0xffff,%eax
  1017f2:	74 0f                	je     101803 <pic_init+0x130>
        pic_setmask(irq_mask);
  1017f4:	0f b7 05 50 e5 10 00 	movzwl 0x10e550,%eax
  1017fb:	89 04 24             	mov    %eax,(%esp)
  1017fe:	e8 45 fe ff ff       	call   101648 <pic_setmask>
    }
}
  101803:	90                   	nop
  101804:	c9                   	leave  
  101805:	c3                   	ret    

00101806 <intr_enable>:
#include <x86.h>
#include <intr.h>

/* intr_enable - enable irq interrupt */
void
intr_enable(void) {
  101806:	55                   	push   %ebp
  101807:	89 e5                	mov    %esp,%ebp
    asm volatile ("lidt (%0)" :: "r" (pd));
}

static inline void
sti(void) {
    asm volatile ("sti");
  101809:	fb                   	sti    
    sti();
}
  10180a:	90                   	nop
  10180b:	5d                   	pop    %ebp
  10180c:	c3                   	ret    

0010180d <intr_disable>:

/* intr_disable - disable irq interrupt */
void
intr_disable(void) {
  10180d:	55                   	push   %ebp
  10180e:	89 e5                	mov    %esp,%ebp
}

static inline void
cli(void) {
    asm volatile ("cli");
  101810:	fa                   	cli    
    cli();
}
  101811:	90                   	nop
  101812:	5d                   	pop    %ebp
  101813:	c3                   	ret    

00101814 <print_ticks>:
#include <console.h>
#include <kdebug.h>

#define TICK_NUM 100

static void print_ticks() {
  101814:	55                   	push   %ebp
  101815:	89 e5                	mov    %esp,%ebp
  101817:	83 ec 18             	sub    $0x18,%esp
    cprintf("%d ticks\n",TICK_NUM);
  10181a:	c7 44 24 04 64 00 00 	movl   $0x64,0x4(%esp)
  101821:	00 
  101822:	c7 04 24 80 39 10 00 	movl   $0x103980,(%esp)
  101829:	e8 3e ea ff ff       	call   10026c <cprintf>
#ifdef DEBUG_GRADE
    cprintf("End of Test.\n");
    panic("EOT: kernel seems ok.");
#endif
}
  10182e:	90                   	nop
  10182f:	c9                   	leave  
  101830:	c3                   	ret    

00101831 <idt_init>:
    sizeof(idt) - 1, (uintptr_t)idt
};

/* idt_init - initialize IDT to each of the entry points in kern/trap/vectors.S */
void
idt_init(void) {
  101831:	55                   	push   %ebp
  101832:	89 e5                	mov    %esp,%ebp
  101834:	83 ec 10             	sub    $0x10,%esp
      */
    // LAB1 2013743 Roslin
    //声明__vertors[]
    extern uintptr_t __vectors[];
    // 对idt数组进行初始化
    for(int i = 0; i < 256; i++) {
  101837:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
  10183e:	e9 c4 00 00 00       	jmp    101907 <idt_init+0xd6>
        SETGATE(idt[i], 0, GD_KTEXT, __vectors[i], DPL_KERNEL);
  101843:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101846:	8b 04 85 e0 e5 10 00 	mov    0x10e5e0(,%eax,4),%eax
  10184d:	0f b7 d0             	movzwl %ax,%edx
  101850:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101853:	66 89 14 c5 a0 f0 10 	mov    %dx,0x10f0a0(,%eax,8)
  10185a:	00 
  10185b:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10185e:	66 c7 04 c5 a2 f0 10 	movw   $0x8,0x10f0a2(,%eax,8)
  101865:	00 08 00 
  101868:	8b 45 fc             	mov    -0x4(%ebp),%eax
  10186b:	0f b6 14 c5 a4 f0 10 	movzbl 0x10f0a4(,%eax,8),%edx
  101872:	00 
  101873:	80 e2 e0             	and    $0xe0,%dl
  101876:	88 14 c5 a4 f0 10 00 	mov    %dl,0x10f0a4(,%eax,8)
  10187d:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101880:	0f b6 14 c5 a4 f0 10 	movzbl 0x10f0a4(,%eax,8),%edx
  101887:	00 
  101888:	80 e2 1f             	and    $0x1f,%dl
  10188b:	88 14 c5 a4 f0 10 00 	mov    %dl,0x10f0a4(,%eax,8)
  101892:	8b 45 fc             	mov    -0x4(%ebp),%eax
  101895:	0f b6 14 c5 a5 f0 10 	movzbl 0x10f0a5(,%eax,8),%edx
  10189c:	00 
  10189d:	80 e2 f0             	and    $0xf0,%dl
  1018a0:	80 ca 0e             	or     $0xe,%dl
  1018a3:	88 14 c5 a5 f0 10 00 	mov    %dl,0x10f0a5(,%eax,8)
  1018aa:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018ad:	0f b6 14 c5 a5 f0 10 	movzbl 0x10f0a5(,%eax,8),%edx
  1018b4:	00 
  1018b5:	80 e2 ef             	and    $0xef,%dl
  1018b8:	88 14 c5 a5 f0 10 00 	mov    %dl,0x10f0a5(,%eax,8)
  1018bf:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018c2:	0f b6 14 c5 a5 f0 10 	movzbl 0x10f0a5(,%eax,8),%edx
  1018c9:	00 
  1018ca:	80 e2 9f             	and    $0x9f,%dl
  1018cd:	88 14 c5 a5 f0 10 00 	mov    %dl,0x10f0a5(,%eax,8)
  1018d4:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018d7:	0f b6 14 c5 a5 f0 10 	movzbl 0x10f0a5(,%eax,8),%edx
  1018de:	00 
  1018df:	80 ca 80             	or     $0x80,%dl
  1018e2:	88 14 c5 a5 f0 10 00 	mov    %dl,0x10f0a5(,%eax,8)
  1018e9:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018ec:	8b 04 85 e0 e5 10 00 	mov    0x10e5e0(,%eax,4),%eax
  1018f3:	c1 e8 10             	shr    $0x10,%eax
  1018f6:	0f b7 d0             	movzwl %ax,%edx
  1018f9:	8b 45 fc             	mov    -0x4(%ebp),%eax
  1018fc:	66 89 14 c5 a6 f0 10 	mov    %dx,0x10f0a6(,%eax,8)
  101903:	00 
      */
    // LAB1 2013743 Roslin
    //声明__vertors[]
    extern uintptr_t __vectors[];
    // 对idt数组进行初始化
    for(int i = 0; i < 256; i++) {
  101904:	ff 45 fc             	incl   -0x4(%ebp)
  101907:	81 7d fc ff 00 00 00 	cmpl   $0xff,-0x4(%ebp)
  10190e:	0f 8e 2f ff ff ff    	jle    101843 <idt_init+0x12>
        SETGATE(idt[i], 0, GD_KTEXT, __vectors[i], DPL_KERNEL);
    }
    // 设置从用户态切换到内核态
    SETGATE(idt[T_SWITCH_TOK], 0, GD_KTEXT, __vectors[T_SWITCH_TOK], DPL_USER);
  101914:	a1 c4 e7 10 00       	mov    0x10e7c4,%eax
  101919:	0f b7 c0             	movzwl %ax,%eax
  10191c:	66 a3 68 f4 10 00    	mov    %ax,0x10f468
  101922:	66 c7 05 6a f4 10 00 	movw   $0x8,0x10f46a
  101929:	08 00 
  10192b:	0f b6 05 6c f4 10 00 	movzbl 0x10f46c,%eax
  101932:	24 e0                	and    $0xe0,%al
  101934:	a2 6c f4 10 00       	mov    %al,0x10f46c
  101939:	0f b6 05 6c f4 10 00 	movzbl 0x10f46c,%eax
  101940:	24 1f                	and    $0x1f,%al
  101942:	a2 6c f4 10 00       	mov    %al,0x10f46c
  101947:	0f b6 05 6d f4 10 00 	movzbl 0x10f46d,%eax
  10194e:	24 f0                	and    $0xf0,%al
  101950:	0c 0e                	or     $0xe,%al
  101952:	a2 6d f4 10 00       	mov    %al,0x10f46d
  101957:	0f b6 05 6d f4 10 00 	movzbl 0x10f46d,%eax
  10195e:	24 ef                	and    $0xef,%al
  101960:	a2 6d f4 10 00       	mov    %al,0x10f46d
  101965:	0f b6 05 6d f4 10 00 	movzbl 0x10f46d,%eax
  10196c:	0c 60                	or     $0x60,%al
  10196e:	a2 6d f4 10 00       	mov    %al,0x10f46d
  101973:	0f b6 05 6d f4 10 00 	movzbl 0x10f46d,%eax
  10197a:	0c 80                	or     $0x80,%al
  10197c:	a2 6d f4 10 00       	mov    %al,0x10f46d
  101981:	a1 c4 e7 10 00       	mov    0x10e7c4,%eax
  101986:	c1 e8 10             	shr    $0x10,%eax
  101989:	0f b7 c0             	movzwl %ax,%eax
  10198c:	66 a3 6e f4 10 00    	mov    %ax,0x10f46e
  101992:	c7 45 f8 60 e5 10 00 	movl   $0x10e560,-0x8(%ebp)
    return ebp;
}

static inline void
lidt(struct pseudodesc *pd) {
    asm volatile ("lidt (%0)" :: "r" (pd));
  101999:	8b 45 f8             	mov    -0x8(%ebp),%eax
  10199c:	0f 01 18             	lidtl  (%eax)
    // 使用lidt指令加载中断描述符表
    lidt(&idt_pd);
}
  10199f:	90                   	nop
  1019a0:	c9                   	leave  
  1019a1:	c3                   	ret    

001019a2 <trapname>:

static const char *
trapname(int trapno) {
  1019a2:	55                   	push   %ebp
  1019a3:	89 e5                	mov    %esp,%ebp
        "Alignment Check",
        "Machine-Check",
        "SIMD Floating-Point Exception"
    };

    if (trapno < sizeof(excnames)/sizeof(const char * const)) {
  1019a5:	8b 45 08             	mov    0x8(%ebp),%eax
  1019a8:	83 f8 13             	cmp    $0x13,%eax
  1019ab:	77 0c                	ja     1019b9 <trapname+0x17>
        return excnames[trapno];
  1019ad:	8b 45 08             	mov    0x8(%ebp),%eax
  1019b0:	8b 04 85 20 3d 10 00 	mov    0x103d20(,%eax,4),%eax
  1019b7:	eb 18                	jmp    1019d1 <trapname+0x2f>
    }
    if (trapno >= IRQ_OFFSET && trapno < IRQ_OFFSET + 16) {
  1019b9:	83 7d 08 1f          	cmpl   $0x1f,0x8(%ebp)
  1019bd:	7e 0d                	jle    1019cc <trapname+0x2a>
  1019bf:	83 7d 08 2f          	cmpl   $0x2f,0x8(%ebp)
  1019c3:	7f 07                	jg     1019cc <trapname+0x2a>
        return "Hardware Interrupt";
  1019c5:	b8 8a 39 10 00       	mov    $0x10398a,%eax
  1019ca:	eb 05                	jmp    1019d1 <trapname+0x2f>
    }
    return "(unknown trap)";
  1019cc:	b8 9d 39 10 00       	mov    $0x10399d,%eax
}
  1019d1:	5d                   	pop    %ebp
  1019d2:	c3                   	ret    

001019d3 <trap_in_kernel>:

/* trap_in_kernel - test if trap happened in kernel */
bool
trap_in_kernel(struct trapframe *tf) {
  1019d3:	55                   	push   %ebp
  1019d4:	89 e5                	mov    %esp,%ebp
    return (tf->tf_cs == (uint16_t)KERNEL_CS);
  1019d6:	8b 45 08             	mov    0x8(%ebp),%eax
  1019d9:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  1019dd:	83 f8 08             	cmp    $0x8,%eax
  1019e0:	0f 94 c0             	sete   %al
  1019e3:	0f b6 c0             	movzbl %al,%eax
}
  1019e6:	5d                   	pop    %ebp
  1019e7:	c3                   	ret    

001019e8 <print_trapframe>:
    "TF", "IF", "DF", "OF", NULL, NULL, "NT", NULL,
    "RF", "VM", "AC", "VIF", "VIP", "ID", NULL, NULL,
};

void
print_trapframe(struct trapframe *tf) {
  1019e8:	55                   	push   %ebp
  1019e9:	89 e5                	mov    %esp,%ebp
  1019eb:	83 ec 28             	sub    $0x28,%esp
    cprintf("trapframe at %p\n", tf);
  1019ee:	8b 45 08             	mov    0x8(%ebp),%eax
  1019f1:	89 44 24 04          	mov    %eax,0x4(%esp)
  1019f5:	c7 04 24 de 39 10 00 	movl   $0x1039de,(%esp)
  1019fc:	e8 6b e8 ff ff       	call   10026c <cprintf>
    print_regs(&tf->tf_regs);
  101a01:	8b 45 08             	mov    0x8(%ebp),%eax
  101a04:	89 04 24             	mov    %eax,(%esp)
  101a07:	e8 91 01 00 00       	call   101b9d <print_regs>
    cprintf("  ds   0x----%04x\n", tf->tf_ds);
  101a0c:	8b 45 08             	mov    0x8(%ebp),%eax
  101a0f:	0f b7 40 2c          	movzwl 0x2c(%eax),%eax
  101a13:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a17:	c7 04 24 ef 39 10 00 	movl   $0x1039ef,(%esp)
  101a1e:	e8 49 e8 ff ff       	call   10026c <cprintf>
    cprintf("  es   0x----%04x\n", tf->tf_es);
  101a23:	8b 45 08             	mov    0x8(%ebp),%eax
  101a26:	0f b7 40 28          	movzwl 0x28(%eax),%eax
  101a2a:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a2e:	c7 04 24 02 3a 10 00 	movl   $0x103a02,(%esp)
  101a35:	e8 32 e8 ff ff       	call   10026c <cprintf>
    cprintf("  fs   0x----%04x\n", tf->tf_fs);
  101a3a:	8b 45 08             	mov    0x8(%ebp),%eax
  101a3d:	0f b7 40 24          	movzwl 0x24(%eax),%eax
  101a41:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a45:	c7 04 24 15 3a 10 00 	movl   $0x103a15,(%esp)
  101a4c:	e8 1b e8 ff ff       	call   10026c <cprintf>
    cprintf("  gs   0x----%04x\n", tf->tf_gs);
  101a51:	8b 45 08             	mov    0x8(%ebp),%eax
  101a54:	0f b7 40 20          	movzwl 0x20(%eax),%eax
  101a58:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a5c:	c7 04 24 28 3a 10 00 	movl   $0x103a28,(%esp)
  101a63:	e8 04 e8 ff ff       	call   10026c <cprintf>
    cprintf("  trap 0x%08x %s\n", tf->tf_trapno, trapname(tf->tf_trapno));
  101a68:	8b 45 08             	mov    0x8(%ebp),%eax
  101a6b:	8b 40 30             	mov    0x30(%eax),%eax
  101a6e:	89 04 24             	mov    %eax,(%esp)
  101a71:	e8 2c ff ff ff       	call   1019a2 <trapname>
  101a76:	89 c2                	mov    %eax,%edx
  101a78:	8b 45 08             	mov    0x8(%ebp),%eax
  101a7b:	8b 40 30             	mov    0x30(%eax),%eax
  101a7e:	89 54 24 08          	mov    %edx,0x8(%esp)
  101a82:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a86:	c7 04 24 3b 3a 10 00 	movl   $0x103a3b,(%esp)
  101a8d:	e8 da e7 ff ff       	call   10026c <cprintf>
    cprintf("  err  0x%08x\n", tf->tf_err);
  101a92:	8b 45 08             	mov    0x8(%ebp),%eax
  101a95:	8b 40 34             	mov    0x34(%eax),%eax
  101a98:	89 44 24 04          	mov    %eax,0x4(%esp)
  101a9c:	c7 04 24 4d 3a 10 00 	movl   $0x103a4d,(%esp)
  101aa3:	e8 c4 e7 ff ff       	call   10026c <cprintf>
    cprintf("  eip  0x%08x\n", tf->tf_eip);
  101aa8:	8b 45 08             	mov    0x8(%ebp),%eax
  101aab:	8b 40 38             	mov    0x38(%eax),%eax
  101aae:	89 44 24 04          	mov    %eax,0x4(%esp)
  101ab2:	c7 04 24 5c 3a 10 00 	movl   $0x103a5c,(%esp)
  101ab9:	e8 ae e7 ff ff       	call   10026c <cprintf>
    cprintf("  cs   0x----%04x\n", tf->tf_cs);
  101abe:	8b 45 08             	mov    0x8(%ebp),%eax
  101ac1:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101ac5:	89 44 24 04          	mov    %eax,0x4(%esp)
  101ac9:	c7 04 24 6b 3a 10 00 	movl   $0x103a6b,(%esp)
  101ad0:	e8 97 e7 ff ff       	call   10026c <cprintf>
    cprintf("  flag 0x%08x ", tf->tf_eflags);
  101ad5:	8b 45 08             	mov    0x8(%ebp),%eax
  101ad8:	8b 40 40             	mov    0x40(%eax),%eax
  101adb:	89 44 24 04          	mov    %eax,0x4(%esp)
  101adf:	c7 04 24 7e 3a 10 00 	movl   $0x103a7e,(%esp)
  101ae6:	e8 81 e7 ff ff       	call   10026c <cprintf>

    int i, j;
    for (i = 0, j = 1; i < sizeof(IA32flags) / sizeof(IA32flags[0]); i ++, j <<= 1) {
  101aeb:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
  101af2:	c7 45 f0 01 00 00 00 	movl   $0x1,-0x10(%ebp)
  101af9:	eb 3d                	jmp    101b38 <print_trapframe+0x150>
        if ((tf->tf_eflags & j) && IA32flags[i] != NULL) {
  101afb:	8b 45 08             	mov    0x8(%ebp),%eax
  101afe:	8b 50 40             	mov    0x40(%eax),%edx
  101b01:	8b 45 f0             	mov    -0x10(%ebp),%eax
  101b04:	21 d0                	and    %edx,%eax
  101b06:	85 c0                	test   %eax,%eax
  101b08:	74 28                	je     101b32 <print_trapframe+0x14a>
  101b0a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101b0d:	8b 04 85 80 e5 10 00 	mov    0x10e580(,%eax,4),%eax
  101b14:	85 c0                	test   %eax,%eax
  101b16:	74 1a                	je     101b32 <print_trapframe+0x14a>
            cprintf("%s,", IA32flags[i]);
  101b18:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101b1b:	8b 04 85 80 e5 10 00 	mov    0x10e580(,%eax,4),%eax
  101b22:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b26:	c7 04 24 8d 3a 10 00 	movl   $0x103a8d,(%esp)
  101b2d:	e8 3a e7 ff ff       	call   10026c <cprintf>
    cprintf("  eip  0x%08x\n", tf->tf_eip);
    cprintf("  cs   0x----%04x\n", tf->tf_cs);
    cprintf("  flag 0x%08x ", tf->tf_eflags);

    int i, j;
    for (i = 0, j = 1; i < sizeof(IA32flags) / sizeof(IA32flags[0]); i ++, j <<= 1) {
  101b32:	ff 45 f4             	incl   -0xc(%ebp)
  101b35:	d1 65 f0             	shll   -0x10(%ebp)
  101b38:	8b 45 f4             	mov    -0xc(%ebp),%eax
  101b3b:	83 f8 17             	cmp    $0x17,%eax
  101b3e:	76 bb                	jbe    101afb <print_trapframe+0x113>
        if ((tf->tf_eflags & j) && IA32flags[i] != NULL) {
            cprintf("%s,", IA32flags[i]);
        }
    }
    cprintf("IOPL=%d\n", (tf->tf_eflags & FL_IOPL_MASK) >> 12);
  101b40:	8b 45 08             	mov    0x8(%ebp),%eax
  101b43:	8b 40 40             	mov    0x40(%eax),%eax
  101b46:	25 00 30 00 00       	and    $0x3000,%eax
  101b4b:	c1 e8 0c             	shr    $0xc,%eax
  101b4e:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b52:	c7 04 24 91 3a 10 00 	movl   $0x103a91,(%esp)
  101b59:	e8 0e e7 ff ff       	call   10026c <cprintf>

    if (!trap_in_kernel(tf)) {
  101b5e:	8b 45 08             	mov    0x8(%ebp),%eax
  101b61:	89 04 24             	mov    %eax,(%esp)
  101b64:	e8 6a fe ff ff       	call   1019d3 <trap_in_kernel>
  101b69:	85 c0                	test   %eax,%eax
  101b6b:	75 2d                	jne    101b9a <print_trapframe+0x1b2>
        cprintf("  esp  0x%08x\n", tf->tf_esp);
  101b6d:	8b 45 08             	mov    0x8(%ebp),%eax
  101b70:	8b 40 44             	mov    0x44(%eax),%eax
  101b73:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b77:	c7 04 24 9a 3a 10 00 	movl   $0x103a9a,(%esp)
  101b7e:	e8 e9 e6 ff ff       	call   10026c <cprintf>
        cprintf("  ss   0x----%04x\n", tf->tf_ss);
  101b83:	8b 45 08             	mov    0x8(%ebp),%eax
  101b86:	0f b7 40 48          	movzwl 0x48(%eax),%eax
  101b8a:	89 44 24 04          	mov    %eax,0x4(%esp)
  101b8e:	c7 04 24 a9 3a 10 00 	movl   $0x103aa9,(%esp)
  101b95:	e8 d2 e6 ff ff       	call   10026c <cprintf>
    }
}
  101b9a:	90                   	nop
  101b9b:	c9                   	leave  
  101b9c:	c3                   	ret    

00101b9d <print_regs>:

void
print_regs(struct pushregs *regs) {
  101b9d:	55                   	push   %ebp
  101b9e:	89 e5                	mov    %esp,%ebp
  101ba0:	83 ec 18             	sub    $0x18,%esp
    cprintf("  edi  0x%08x\n", regs->reg_edi);
  101ba3:	8b 45 08             	mov    0x8(%ebp),%eax
  101ba6:	8b 00                	mov    (%eax),%eax
  101ba8:	89 44 24 04          	mov    %eax,0x4(%esp)
  101bac:	c7 04 24 bc 3a 10 00 	movl   $0x103abc,(%esp)
  101bb3:	e8 b4 e6 ff ff       	call   10026c <cprintf>
    cprintf("  esi  0x%08x\n", regs->reg_esi);
  101bb8:	8b 45 08             	mov    0x8(%ebp),%eax
  101bbb:	8b 40 04             	mov    0x4(%eax),%eax
  101bbe:	89 44 24 04          	mov    %eax,0x4(%esp)
  101bc2:	c7 04 24 cb 3a 10 00 	movl   $0x103acb,(%esp)
  101bc9:	e8 9e e6 ff ff       	call   10026c <cprintf>
    cprintf("  ebp  0x%08x\n", regs->reg_ebp);
  101bce:	8b 45 08             	mov    0x8(%ebp),%eax
  101bd1:	8b 40 08             	mov    0x8(%eax),%eax
  101bd4:	89 44 24 04          	mov    %eax,0x4(%esp)
  101bd8:	c7 04 24 da 3a 10 00 	movl   $0x103ada,(%esp)
  101bdf:	e8 88 e6 ff ff       	call   10026c <cprintf>
    cprintf("  oesp 0x%08x\n", regs->reg_oesp);
  101be4:	8b 45 08             	mov    0x8(%ebp),%eax
  101be7:	8b 40 0c             	mov    0xc(%eax),%eax
  101bea:	89 44 24 04          	mov    %eax,0x4(%esp)
  101bee:	c7 04 24 e9 3a 10 00 	movl   $0x103ae9,(%esp)
  101bf5:	e8 72 e6 ff ff       	call   10026c <cprintf>
    cprintf("  ebx  0x%08x\n", regs->reg_ebx);
  101bfa:	8b 45 08             	mov    0x8(%ebp),%eax
  101bfd:	8b 40 10             	mov    0x10(%eax),%eax
  101c00:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c04:	c7 04 24 f8 3a 10 00 	movl   $0x103af8,(%esp)
  101c0b:	e8 5c e6 ff ff       	call   10026c <cprintf>
    cprintf("  edx  0x%08x\n", regs->reg_edx);
  101c10:	8b 45 08             	mov    0x8(%ebp),%eax
  101c13:	8b 40 14             	mov    0x14(%eax),%eax
  101c16:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c1a:	c7 04 24 07 3b 10 00 	movl   $0x103b07,(%esp)
  101c21:	e8 46 e6 ff ff       	call   10026c <cprintf>
    cprintf("  ecx  0x%08x\n", regs->reg_ecx);
  101c26:	8b 45 08             	mov    0x8(%ebp),%eax
  101c29:	8b 40 18             	mov    0x18(%eax),%eax
  101c2c:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c30:	c7 04 24 16 3b 10 00 	movl   $0x103b16,(%esp)
  101c37:	e8 30 e6 ff ff       	call   10026c <cprintf>
    cprintf("  eax  0x%08x\n", regs->reg_eax);
  101c3c:	8b 45 08             	mov    0x8(%ebp),%eax
  101c3f:	8b 40 1c             	mov    0x1c(%eax),%eax
  101c42:	89 44 24 04          	mov    %eax,0x4(%esp)
  101c46:	c7 04 24 25 3b 10 00 	movl   $0x103b25,(%esp)
  101c4d:	e8 1a e6 ff ff       	call   10026c <cprintf>
}
  101c52:	90                   	nop
  101c53:	c9                   	leave  
  101c54:	c3                   	ret    

00101c55 <trap_dispatch>:

/* trap_dispatch - dispatch based on what type of trap occurred */
static void
trap_dispatch(struct trapframe *tf) {
  101c55:	55                   	push   %ebp
  101c56:	89 e5                	mov    %esp,%ebp
  101c58:	83 ec 28             	sub    $0x28,%esp
    char c;

    switch (tf->tf_trapno) {
  101c5b:	8b 45 08             	mov    0x8(%ebp),%eax
  101c5e:	8b 40 30             	mov    0x30(%eax),%eax
  101c61:	83 f8 2f             	cmp    $0x2f,%eax
  101c64:	77 21                	ja     101c87 <trap_dispatch+0x32>
  101c66:	83 f8 2e             	cmp    $0x2e,%eax
  101c69:	0f 83 99 02 00 00    	jae    101f08 <trap_dispatch+0x2b3>
  101c6f:	83 f8 21             	cmp    $0x21,%eax
  101c72:	0f 84 95 00 00 00    	je     101d0d <trap_dispatch+0xb8>
  101c78:	83 f8 24             	cmp    $0x24,%eax
  101c7b:	74 67                	je     101ce4 <trap_dispatch+0x8f>
  101c7d:	83 f8 20             	cmp    $0x20,%eax
  101c80:	74 1c                	je     101c9e <trap_dispatch+0x49>
  101c82:	e9 4c 02 00 00       	jmp    101ed3 <trap_dispatch+0x27e>
  101c87:	83 f8 78             	cmp    $0x78,%eax
  101c8a:	0f 84 68 01 00 00    	je     101df8 <trap_dispatch+0x1a3>
  101c90:	83 f8 79             	cmp    $0x79,%eax
  101c93:	0f 84 e9 01 00 00    	je     101e82 <trap_dispatch+0x22d>
  101c99:	e9 35 02 00 00       	jmp    101ed3 <trap_dispatch+0x27e>
        /* (1) After a timer interrupt, you should record this event using a global variable (increase it), such as ticks in kern/driver/clock.c
         * (2) Every TICK_NUM cycle, you can print some info using a funciton, such as print_ticks().
         * (3) Too Simple? Yes, I think so!
         */
	    // LAB1 2013743 Roslin
        ticks++;		        // 每次时钟中断之后ticks就会加一
  101c9e:	a1 08 f9 10 00       	mov    0x10f908,%eax
  101ca3:	40                   	inc    %eax
  101ca4:	a3 08 f9 10 00       	mov    %eax,0x10f908
    	if(ticks%TICK_NUM == 0) // 当加到TICK_NUM次数时,打印并重新开始
  101ca9:	8b 0d 08 f9 10 00    	mov    0x10f908,%ecx
  101caf:	ba 1f 85 eb 51       	mov    $0x51eb851f,%edx
  101cb4:	89 c8                	mov    %ecx,%eax
  101cb6:	f7 e2                	mul    %edx
  101cb8:	c1 ea 05             	shr    $0x5,%edx
  101cbb:	89 d0                	mov    %edx,%eax
  101cbd:	c1 e0 02             	shl    $0x2,%eax
  101cc0:	01 d0                	add    %edx,%eax
  101cc2:	8d 14 85 00 00 00 00 	lea    0x0(,%eax,4),%edx
  101cc9:	01 d0                	add    %edx,%eax
  101ccb:	c1 e0 02             	shl    $0x2,%eax
  101cce:	29 c1                	sub    %eax,%ecx
  101cd0:	89 ca                	mov    %ecx,%edx
  101cd2:	85 d2                	test   %edx,%edx
  101cd4:	0f 85 31 02 00 00    	jne    101f0b <trap_dispatch+0x2b6>
    		print_ticks();
  101cda:	e8 35 fb ff ff       	call   101814 <print_ticks>
        break;
  101cdf:	e9 27 02 00 00       	jmp    101f0b <trap_dispatch+0x2b6>
    case IRQ_OFFSET + IRQ_COM1:
        c = cons_getc();
  101ce4:	e8 03 f9 ff ff       	call   1015ec <cons_getc>
  101ce9:	88 45 f7             	mov    %al,-0x9(%ebp)
        cprintf("serial [%03d] %c\n", c, c);
  101cec:	0f be 55 f7          	movsbl -0x9(%ebp),%edx
  101cf0:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  101cf4:	89 54 24 08          	mov    %edx,0x8(%esp)
  101cf8:	89 44 24 04          	mov    %eax,0x4(%esp)
  101cfc:	c7 04 24 34 3b 10 00 	movl   $0x103b34,(%esp)
  101d03:	e8 64 e5 ff ff       	call   10026c <cprintf>
        break;
  101d08:	e9 08 02 00 00       	jmp    101f15 <trap_dispatch+0x2c0>
    case IRQ_OFFSET + IRQ_KBD:
        c = cons_getc();
  101d0d:	e8 da f8 ff ff       	call   1015ec <cons_getc>
  101d12:	88 45 f7             	mov    %al,-0x9(%ebp)
        cprintf("kbd [%03d] %c\n", c, c);
  101d15:	0f be 55 f7          	movsbl -0x9(%ebp),%edx
  101d19:	0f be 45 f7          	movsbl -0x9(%ebp),%eax
  101d1d:	89 54 24 08          	mov    %edx,0x8(%esp)
  101d21:	89 44 24 04          	mov    %eax,0x4(%esp)
  101d25:	c7 04 24 46 3b 10 00 	movl   $0x103b46,(%esp)
  101d2c:	e8 3b e5 ff ff       	call   10026c <cprintf>
        if(c == '0' && (tf->tf_cs & 3) != 0) {
  101d31:	80 7d f7 30          	cmpb   $0x30,-0x9(%ebp)
  101d35:	75 52                	jne    101d89 <trap_dispatch+0x134>
  101d37:	8b 45 08             	mov    0x8(%ebp),%eax
  101d3a:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101d3e:	83 e0 03             	and    $0x3,%eax
  101d41:	85 c0                	test   %eax,%eax
  101d43:	74 44                	je     101d89 <trap_dispatch+0x134>
                cprintf("SWITCH TO KERNEL\n");
  101d45:	c7 04 24 55 3b 10 00 	movl   $0x103b55,(%esp)
  101d4c:	e8 1b e5 ff ff       	call   10026c <cprintf>
                tf->tf_cs = KERNEL_CS;
  101d51:	8b 45 08             	mov    0x8(%ebp),%eax
  101d54:	66 c7 40 3c 08 00    	movw   $0x8,0x3c(%eax)
                tf->tf_ds = tf->tf_es = KERNEL_DS;
  101d5a:	8b 45 08             	mov    0x8(%ebp),%eax
  101d5d:	66 c7 40 28 10 00    	movw   $0x10,0x28(%eax)
  101d63:	8b 45 08             	mov    0x8(%ebp),%eax
  101d66:	0f b7 50 28          	movzwl 0x28(%eax),%edx
  101d6a:	8b 45 08             	mov    0x8(%ebp),%eax
  101d6d:	66 89 50 2c          	mov    %dx,0x2c(%eax)
                tf->tf_eflags &= ~FL_IOPL_MASK;
  101d71:	8b 45 08             	mov    0x8(%ebp),%eax
  101d74:	8b 40 40             	mov    0x40(%eax),%eax
  101d77:	25 ff cf ff ff       	and    $0xffffcfff,%eax
  101d7c:	89 c2                	mov    %eax,%edx
  101d7e:	8b 45 08             	mov    0x8(%ebp),%eax
  101d81:	89 50 40             	mov    %edx,0x40(%eax)
                cprintf("SWITCH TO USER\n");
                tf->tf_cs = USER_CS;
                tf->tf_ds = tf->tf_es = tf->tf_ss = USER_DS;
                tf->tf_eflags |= FL_IOPL_MASK;
        }
        break;
  101d84:	e9 85 01 00 00       	jmp    101f0e <trap_dispatch+0x2b9>
                cprintf("SWITCH TO KERNEL\n");
                tf->tf_cs = KERNEL_CS;
                tf->tf_ds = tf->tf_es = KERNEL_DS;
                tf->tf_eflags &= ~FL_IOPL_MASK;
        }
        else if (c == '3' && (tf->tf_cs & 3) != 3) {
  101d89:	80 7d f7 33          	cmpb   $0x33,-0x9(%ebp)
  101d8d:	0f 85 7b 01 00 00    	jne    101f0e <trap_dispatch+0x2b9>
  101d93:	8b 45 08             	mov    0x8(%ebp),%eax
  101d96:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101d9a:	83 e0 03             	and    $0x3,%eax
  101d9d:	83 f8 03             	cmp    $0x3,%eax
  101da0:	0f 84 68 01 00 00    	je     101f0e <trap_dispatch+0x2b9>
                cprintf("SWITCH TO USER\n");
  101da6:	c7 04 24 67 3b 10 00 	movl   $0x103b67,(%esp)
  101dad:	e8 ba e4 ff ff       	call   10026c <cprintf>
                tf->tf_cs = USER_CS;
  101db2:	8b 45 08             	mov    0x8(%ebp),%eax
  101db5:	66 c7 40 3c 1b 00    	movw   $0x1b,0x3c(%eax)
                tf->tf_ds = tf->tf_es = tf->tf_ss = USER_DS;
  101dbb:	8b 45 08             	mov    0x8(%ebp),%eax
  101dbe:	66 c7 40 48 23 00    	movw   $0x23,0x48(%eax)
  101dc4:	8b 45 08             	mov    0x8(%ebp),%eax
  101dc7:	0f b7 50 48          	movzwl 0x48(%eax),%edx
  101dcb:	8b 45 08             	mov    0x8(%ebp),%eax
  101dce:	66 89 50 28          	mov    %dx,0x28(%eax)
  101dd2:	8b 45 08             	mov    0x8(%ebp),%eax
  101dd5:	0f b7 50 28          	movzwl 0x28(%eax),%edx
  101dd9:	8b 45 08             	mov    0x8(%ebp),%eax
  101ddc:	66 89 50 2c          	mov    %dx,0x2c(%eax)
                tf->tf_eflags |= FL_IOPL_MASK;
  101de0:	8b 45 08             	mov    0x8(%ebp),%eax
  101de3:	8b 40 40             	mov    0x40(%eax),%eax
  101de6:	0d 00 30 00 00       	or     $0x3000,%eax
  101deb:	89 c2                	mov    %eax,%edx
  101ded:	8b 45 08             	mov    0x8(%ebp),%eax
  101df0:	89 50 40             	mov    %edx,0x40(%eax)
        }
        break;
  101df3:	e9 16 01 00 00       	jmp    101f0e <trap_dispatch+0x2b9>
    // LAB1 CHALLENGE 1 : YOUR CODE you should modify below codes.
    // LAB1 2013743 Roslin
    case T_SWITCH_TOU:
        // 如果不是用户态
        if(tf->tf_cs != USER_CS) {
  101df8:	8b 45 08             	mov    0x8(%ebp),%eax
  101dfb:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101dff:	83 f8 1b             	cmp    $0x1b,%eax
  101e02:	0f 84 09 01 00 00    	je     101f11 <trap_dispatch+0x2bc>
            cprintf("SWITCH TO USER!\n");
  101e08:	c7 04 24 77 3b 10 00 	movl   $0x103b77,(%esp)
  101e0f:	e8 58 e4 ff ff       	call   10026c <cprintf>
            // 设置用户态对应的cs,ds,es,ss四个寄存器
            tf->tf_cs = USER_CS;
  101e14:	8b 45 08             	mov    0x8(%ebp),%eax
  101e17:	66 c7 40 3c 1b 00    	movw   $0x1b,0x3c(%eax)
            tf->tf_ss = tf->tf_ds = tf->tf_es = tf->tf_gs = tf->tf_fs = USER_DS;
  101e1d:	8b 45 08             	mov    0x8(%ebp),%eax
  101e20:	66 c7 40 24 23 00    	movw   $0x23,0x24(%eax)
  101e26:	8b 45 08             	mov    0x8(%ebp),%eax
  101e29:	0f b7 50 24          	movzwl 0x24(%eax),%edx
  101e2d:	8b 45 08             	mov    0x8(%ebp),%eax
  101e30:	66 89 50 20          	mov    %dx,0x20(%eax)
  101e34:	8b 45 08             	mov    0x8(%ebp),%eax
  101e37:	0f b7 50 20          	movzwl 0x20(%eax),%edx
  101e3b:	8b 45 08             	mov    0x8(%ebp),%eax
  101e3e:	66 89 50 28          	mov    %dx,0x28(%eax)
  101e42:	8b 45 08             	mov    0x8(%ebp),%eax
  101e45:	0f b7 50 28          	movzwl 0x28(%eax),%edx
  101e49:	8b 45 08             	mov    0x8(%ebp),%eax
  101e4c:	66 89 50 2c          	mov    %dx,0x2c(%eax)
  101e50:	8b 45 08             	mov    0x8(%ebp),%eax
  101e53:	0f b7 50 2c          	movzwl 0x2c(%eax),%edx
  101e57:	8b 45 08             	mov    0x8(%ebp),%eax
  101e5a:	66 89 50 48          	mov    %dx,0x48(%eax)
            tf->tf_esp = (uint32_t)tf + sizeof(struct trapframe);
  101e5e:	8b 45 08             	mov    0x8(%ebp),%eax
  101e61:	8d 50 4c             	lea    0x4c(%eax),%edx
  101e64:	8b 45 08             	mov    0x8(%ebp),%eax
  101e67:	89 50 44             	mov    %edx,0x44(%eax)
            // 用户态使用I/O
            tf->tf_eflags |= FL_IOPL_MASK;
  101e6a:	8b 45 08             	mov    0x8(%ebp),%eax
  101e6d:	8b 40 40             	mov    0x40(%eax),%eax
  101e70:	0d 00 30 00 00       	or     $0x3000,%eax
  101e75:	89 c2                	mov    %eax,%edx
  101e77:	8b 45 08             	mov    0x8(%ebp),%eax
  101e7a:	89 50 40             	mov    %edx,0x40(%eax)
        }
        break;
  101e7d:	e9 8f 00 00 00       	jmp    101f11 <trap_dispatch+0x2bc>

	case T_SWITCH_TOK:
        // 如果不是内核态
        if(tf->tf_cs != KERNEL_CS) {
  101e82:	8b 45 08             	mov    0x8(%ebp),%eax
  101e85:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101e89:	83 f8 08             	cmp    $0x8,%eax
  101e8c:	0f 84 82 00 00 00    	je     101f14 <trap_dispatch+0x2bf>
            cprintf("SWITCH TO KERNEL!\n");
  101e92:	c7 04 24 88 3b 10 00 	movl   $0x103b88,(%esp)
  101e99:	e8 ce e3 ff ff       	call   10026c <cprintf>
            // 设置内核态对应的cs,ds,es三个寄存器
            tf->tf_cs = KERNEL_CS;
  101e9e:	8b 45 08             	mov    0x8(%ebp),%eax
  101ea1:	66 c7 40 3c 08 00    	movw   $0x8,0x3c(%eax)
            tf->tf_ds = tf->tf_es = KERNEL_DS;
  101ea7:	8b 45 08             	mov    0x8(%ebp),%eax
  101eaa:	66 c7 40 28 10 00    	movw   $0x10,0x28(%eax)
  101eb0:	8b 45 08             	mov    0x8(%ebp),%eax
  101eb3:	0f b7 50 28          	movzwl 0x28(%eax),%edx
  101eb7:	8b 45 08             	mov    0x8(%ebp),%eax
  101eba:	66 89 50 2c          	mov    %dx,0x2c(%eax)
            // 内核态不使用I/O
            tf->tf_eflags &= ~FL_IOPL_MASK;
  101ebe:	8b 45 08             	mov    0x8(%ebp),%eax
  101ec1:	8b 40 40             	mov    0x40(%eax),%eax
  101ec4:	25 ff cf ff ff       	and    $0xffffcfff,%eax
  101ec9:	89 c2                	mov    %eax,%edx
  101ecb:	8b 45 08             	mov    0x8(%ebp),%eax
  101ece:	89 50 40             	mov    %edx,0x40(%eax)
        }
        break;
  101ed1:	eb 41                	jmp    101f14 <trap_dispatch+0x2bf>
    case IRQ_OFFSET + IRQ_IDE2:
        /* do nothing */
        break;
    default:
        // in kernel, it must be a mistake
        if ((tf->tf_cs & 3) == 0) {
  101ed3:	8b 45 08             	mov    0x8(%ebp),%eax
  101ed6:	0f b7 40 3c          	movzwl 0x3c(%eax),%eax
  101eda:	83 e0 03             	and    $0x3,%eax
  101edd:	85 c0                	test   %eax,%eax
  101edf:	75 34                	jne    101f15 <trap_dispatch+0x2c0>
            print_trapframe(tf);
  101ee1:	8b 45 08             	mov    0x8(%ebp),%eax
  101ee4:	89 04 24             	mov    %eax,(%esp)
  101ee7:	e8 fc fa ff ff       	call   1019e8 <print_trapframe>
            panic("unexpected trap in kernel.\n");
  101eec:	c7 44 24 08 9b 3b 10 	movl   $0x103b9b,0x8(%esp)
  101ef3:	00 
  101ef4:	c7 44 24 04 e2 00 00 	movl   $0xe2,0x4(%esp)
  101efb:	00 
  101efc:	c7 04 24 b7 3b 10 00 	movl   $0x103bb7,(%esp)
  101f03:	e8 bb e4 ff ff       	call   1003c3 <__panic>
        break;
    */
    case IRQ_OFFSET + IRQ_IDE1:
    case IRQ_OFFSET + IRQ_IDE2:
        /* do nothing */
        break;
  101f08:	90                   	nop
  101f09:	eb 0a                	jmp    101f15 <trap_dispatch+0x2c0>
         */
	    // LAB1 2013743 Roslin
        ticks++;		        // 每次时钟中断之后ticks就会加一
    	if(ticks%TICK_NUM == 0) // 当加到TICK_NUM次数时,打印并重新开始
    		print_ticks();
        break;
  101f0b:	90                   	nop
  101f0c:	eb 07                	jmp    101f15 <trap_dispatch+0x2c0>
                cprintf("SWITCH TO USER\n");
                tf->tf_cs = USER_CS;
                tf->tf_ds = tf->tf_es = tf->tf_ss = USER_DS;
                tf->tf_eflags |= FL_IOPL_MASK;
        }
        break;
  101f0e:	90                   	nop
  101f0f:	eb 04                	jmp    101f15 <trap_dispatch+0x2c0>
            tf->tf_ss = tf->tf_ds = tf->tf_es = tf->tf_gs = tf->tf_fs = USER_DS;
            tf->tf_esp = (uint32_t)tf + sizeof(struct trapframe);
            // 用户态使用I/O
            tf->tf_eflags |= FL_IOPL_MASK;
        }
        break;
  101f11:	90                   	nop
  101f12:	eb 01                	jmp    101f15 <trap_dispatch+0x2c0>
            tf->tf_cs = KERNEL_CS;
            tf->tf_ds = tf->tf_es = KERNEL_DS;
            // 内核态不使用I/O
            tf->tf_eflags &= ~FL_IOPL_MASK;
        }
        break;
  101f14:	90                   	nop
        if ((tf->tf_cs & 3) == 0) {
            print_trapframe(tf);
            panic("unexpected trap in kernel.\n");
        }
    }
}
  101f15:	90                   	nop
  101f16:	c9                   	leave  
  101f17:	c3                   	ret    

00101f18 <trap>:
 * trap - handles or dispatches an exception/interrupt. if and when trap() returns,
 * the code in kern/trap/trapentry.S restores the old CPU state saved in the
 * trapframe and then uses the iret instruction to return from the exception.
 * */
void
trap(struct trapframe *tf) {
  101f18:	55                   	push   %ebp
  101f19:	89 e5                	mov    %esp,%ebp
  101f1b:	83 ec 18             	sub    $0x18,%esp
    // dispatch based on what type of trap occurred
    trap_dispatch(tf);
  101f1e:	8b 45 08             	mov    0x8(%ebp),%eax
  101f21:	89 04 24             	mov    %eax,(%esp)
  101f24:	e8 2c fd ff ff       	call   101c55 <trap_dispatch>
}
  101f29:	90                   	nop
  101f2a:	c9                   	leave  
  101f2b:	c3                   	ret    

00101f2c <vector0>:
# handler
.text
.globl __alltraps
.globl vector0
vector0:
  pushl $0
  101f2c:	6a 00                	push   $0x0
  pushl $0
  101f2e:	6a 00                	push   $0x0
  jmp __alltraps
  101f30:	e9 69 0a 00 00       	jmp    10299e <__alltraps>

00101f35 <vector1>:
.globl vector1
vector1:
  pushl $0
  101f35:	6a 00                	push   $0x0
  pushl $1
  101f37:	6a 01                	push   $0x1
  jmp __alltraps
  101f39:	e9 60 0a 00 00       	jmp    10299e <__alltraps>

00101f3e <vector2>:
.globl vector2
vector2:
  pushl $0
  101f3e:	6a 00                	push   $0x0
  pushl $2
  101f40:	6a 02                	push   $0x2
  jmp __alltraps
  101f42:	e9 57 0a 00 00       	jmp    10299e <__alltraps>

00101f47 <vector3>:
.globl vector3
vector3:
  pushl $0
  101f47:	6a 00                	push   $0x0
  pushl $3
  101f49:	6a 03                	push   $0x3
  jmp __alltraps
  101f4b:	e9 4e 0a 00 00       	jmp    10299e <__alltraps>

00101f50 <vector4>:
.globl vector4
vector4:
  pushl $0
  101f50:	6a 00                	push   $0x0
  pushl $4
  101f52:	6a 04                	push   $0x4
  jmp __alltraps
  101f54:	e9 45 0a 00 00       	jmp    10299e <__alltraps>

00101f59 <vector5>:
.globl vector5
vector5:
  pushl $0
  101f59:	6a 00                	push   $0x0
  pushl $5
  101f5b:	6a 05                	push   $0x5
  jmp __alltraps
  101f5d:	e9 3c 0a 00 00       	jmp    10299e <__alltraps>

00101f62 <vector6>:
.globl vector6
vector6:
  pushl $0
  101f62:	6a 00                	push   $0x0
  pushl $6
  101f64:	6a 06                	push   $0x6
  jmp __alltraps
  101f66:	e9 33 0a 00 00       	jmp    10299e <__alltraps>

00101f6b <vector7>:
.globl vector7
vector7:
  pushl $0
  101f6b:	6a 00                	push   $0x0
  pushl $7
  101f6d:	6a 07                	push   $0x7
  jmp __alltraps
  101f6f:	e9 2a 0a 00 00       	jmp    10299e <__alltraps>

00101f74 <vector8>:
.globl vector8
vector8:
  pushl $8
  101f74:	6a 08                	push   $0x8
  jmp __alltraps
  101f76:	e9 23 0a 00 00       	jmp    10299e <__alltraps>

00101f7b <vector9>:
.globl vector9
vector9:
  pushl $0
  101f7b:	6a 00                	push   $0x0
  pushl $9
  101f7d:	6a 09                	push   $0x9
  jmp __alltraps
  101f7f:	e9 1a 0a 00 00       	jmp    10299e <__alltraps>

00101f84 <vector10>:
.globl vector10
vector10:
  pushl $10
  101f84:	6a 0a                	push   $0xa
  jmp __alltraps
  101f86:	e9 13 0a 00 00       	jmp    10299e <__alltraps>

00101f8b <vector11>:
.globl vector11
vector11:
  pushl $11
  101f8b:	6a 0b                	push   $0xb
  jmp __alltraps
  101f8d:	e9 0c 0a 00 00       	jmp    10299e <__alltraps>

00101f92 <vector12>:
.globl vector12
vector12:
  pushl $12
  101f92:	6a 0c                	push   $0xc
  jmp __alltraps
  101f94:	e9 05 0a 00 00       	jmp    10299e <__alltraps>

00101f99 <vector13>:
.globl vector13
vector13:
  pushl $13
  101f99:	6a 0d                	push   $0xd
  jmp __alltraps
  101f9b:	e9 fe 09 00 00       	jmp    10299e <__alltraps>

00101fa0 <vector14>:
.globl vector14
vector14:
  pushl $14
  101fa0:	6a 0e                	push   $0xe
  jmp __alltraps
  101fa2:	e9 f7 09 00 00       	jmp    10299e <__alltraps>

00101fa7 <vector15>:
.globl vector15
vector15:
  pushl $0
  101fa7:	6a 00                	push   $0x0
  pushl $15
  101fa9:	6a 0f                	push   $0xf
  jmp __alltraps
  101fab:	e9 ee 09 00 00       	jmp    10299e <__alltraps>

00101fb0 <vector16>:
.globl vector16
vector16:
  pushl $0
  101fb0:	6a 00                	push   $0x0
  pushl $16
  101fb2:	6a 10                	push   $0x10
  jmp __alltraps
  101fb4:	e9 e5 09 00 00       	jmp    10299e <__alltraps>

00101fb9 <vector17>:
.globl vector17
vector17:
  pushl $17
  101fb9:	6a 11                	push   $0x11
  jmp __alltraps
  101fbb:	e9 de 09 00 00       	jmp    10299e <__alltraps>

00101fc0 <vector18>:
.globl vector18
vector18:
  pushl $0
  101fc0:	6a 00                	push   $0x0
  pushl $18
  101fc2:	6a 12                	push   $0x12
  jmp __alltraps
  101fc4:	e9 d5 09 00 00       	jmp    10299e <__alltraps>

00101fc9 <vector19>:
.globl vector19
vector19:
  pushl $0
  101fc9:	6a 00                	push   $0x0
  pushl $19
  101fcb:	6a 13                	push   $0x13
  jmp __alltraps
  101fcd:	e9 cc 09 00 00       	jmp    10299e <__alltraps>

00101fd2 <vector20>:
.globl vector20
vector20:
  pushl $0
  101fd2:	6a 00                	push   $0x0
  pushl $20
  101fd4:	6a 14                	push   $0x14
  jmp __alltraps
  101fd6:	e9 c3 09 00 00       	jmp    10299e <__alltraps>

00101fdb <vector21>:
.globl vector21
vector21:
  pushl $0
  101fdb:	6a 00                	push   $0x0
  pushl $21
  101fdd:	6a 15                	push   $0x15
  jmp __alltraps
  101fdf:	e9 ba 09 00 00       	jmp    10299e <__alltraps>

00101fe4 <vector22>:
.globl vector22
vector22:
  pushl $0
  101fe4:	6a 00                	push   $0x0
  pushl $22
  101fe6:	6a 16                	push   $0x16
  jmp __alltraps
  101fe8:	e9 b1 09 00 00       	jmp    10299e <__alltraps>

00101fed <vector23>:
.globl vector23
vector23:
  pushl $0
  101fed:	6a 00                	push   $0x0
  pushl $23
  101fef:	6a 17                	push   $0x17
  jmp __alltraps
  101ff1:	e9 a8 09 00 00       	jmp    10299e <__alltraps>

00101ff6 <vector24>:
.globl vector24
vector24:
  pushl $0
  101ff6:	6a 00                	push   $0x0
  pushl $24
  101ff8:	6a 18                	push   $0x18
  jmp __alltraps
  101ffa:	e9 9f 09 00 00       	jmp    10299e <__alltraps>

00101fff <vector25>:
.globl vector25
vector25:
  pushl $0
  101fff:	6a 00                	push   $0x0
  pushl $25
  102001:	6a 19                	push   $0x19
  jmp __alltraps
  102003:	e9 96 09 00 00       	jmp    10299e <__alltraps>

00102008 <vector26>:
.globl vector26
vector26:
  pushl $0
  102008:	6a 00                	push   $0x0
  pushl $26
  10200a:	6a 1a                	push   $0x1a
  jmp __alltraps
  10200c:	e9 8d 09 00 00       	jmp    10299e <__alltraps>

00102011 <vector27>:
.globl vector27
vector27:
  pushl $0
  102011:	6a 00                	push   $0x0
  pushl $27
  102013:	6a 1b                	push   $0x1b
  jmp __alltraps
  102015:	e9 84 09 00 00       	jmp    10299e <__alltraps>

0010201a <vector28>:
.globl vector28
vector28:
  pushl $0
  10201a:	6a 00                	push   $0x0
  pushl $28
  10201c:	6a 1c                	push   $0x1c
  jmp __alltraps
  10201e:	e9 7b 09 00 00       	jmp    10299e <__alltraps>

00102023 <vector29>:
.globl vector29
vector29:
  pushl $0
  102023:	6a 00                	push   $0x0
  pushl $29
  102025:	6a 1d                	push   $0x1d
  jmp __alltraps
  102027:	e9 72 09 00 00       	jmp    10299e <__alltraps>

0010202c <vector30>:
.globl vector30
vector30:
  pushl $0
  10202c:	6a 00                	push   $0x0
  pushl $30
  10202e:	6a 1e                	push   $0x1e
  jmp __alltraps
  102030:	e9 69 09 00 00       	jmp    10299e <__alltraps>

00102035 <vector31>:
.globl vector31
vector31:
  pushl $0
  102035:	6a 00                	push   $0x0
  pushl $31
  102037:	6a 1f                	push   $0x1f
  jmp __alltraps
  102039:	e9 60 09 00 00       	jmp    10299e <__alltraps>

0010203e <vector32>:
.globl vector32
vector32:
  pushl $0
  10203e:	6a 00                	push   $0x0
  pushl $32
  102040:	6a 20                	push   $0x20
  jmp __alltraps
  102042:	e9 57 09 00 00       	jmp    10299e <__alltraps>

00102047 <vector33>:
.globl vector33
vector33:
  pushl $0
  102047:	6a 00                	push   $0x0
  pushl $33
  102049:	6a 21                	push   $0x21
  jmp __alltraps
  10204b:	e9 4e 09 00 00       	jmp    10299e <__alltraps>

00102050 <vector34>:
.globl vector34
vector34:
  pushl $0
  102050:	6a 00                	push   $0x0
  pushl $34
  102052:	6a 22                	push   $0x22
  jmp __alltraps
  102054:	e9 45 09 00 00       	jmp    10299e <__alltraps>

00102059 <vector35>:
.globl vector35
vector35:
  pushl $0
  102059:	6a 00                	push   $0x0
  pushl $35
  10205b:	6a 23                	push   $0x23
  jmp __alltraps
  10205d:	e9 3c 09 00 00       	jmp    10299e <__alltraps>

00102062 <vector36>:
.globl vector36
vector36:
  pushl $0
  102062:	6a 00                	push   $0x0
  pushl $36
  102064:	6a 24                	push   $0x24
  jmp __alltraps
  102066:	e9 33 09 00 00       	jmp    10299e <__alltraps>

0010206b <vector37>:
.globl vector37
vector37:
  pushl $0
  10206b:	6a 00                	push   $0x0
  pushl $37
  10206d:	6a 25                	push   $0x25
  jmp __alltraps
  10206f:	e9 2a 09 00 00       	jmp    10299e <__alltraps>

00102074 <vector38>:
.globl vector38
vector38:
  pushl $0
  102074:	6a 00                	push   $0x0
  pushl $38
  102076:	6a 26                	push   $0x26
  jmp __alltraps
  102078:	e9 21 09 00 00       	jmp    10299e <__alltraps>

0010207d <vector39>:
.globl vector39
vector39:
  pushl $0
  10207d:	6a 00                	push   $0x0
  pushl $39
  10207f:	6a 27                	push   $0x27
  jmp __alltraps
  102081:	e9 18 09 00 00       	jmp    10299e <__alltraps>

00102086 <vector40>:
.globl vector40
vector40:
  pushl $0
  102086:	6a 00                	push   $0x0
  pushl $40
  102088:	6a 28                	push   $0x28
  jmp __alltraps
  10208a:	e9 0f 09 00 00       	jmp    10299e <__alltraps>

0010208f <vector41>:
.globl vector41
vector41:
  pushl $0
  10208f:	6a 00                	push   $0x0
  pushl $41
  102091:	6a 29                	push   $0x29
  jmp __alltraps
  102093:	e9 06 09 00 00       	jmp    10299e <__alltraps>

00102098 <vector42>:
.globl vector42
vector42:
  pushl $0
  102098:	6a 00                	push   $0x0
  pushl $42
  10209a:	6a 2a                	push   $0x2a
  jmp __alltraps
  10209c:	e9 fd 08 00 00       	jmp    10299e <__alltraps>

001020a1 <vector43>:
.globl vector43
vector43:
  pushl $0
  1020a1:	6a 00                	push   $0x0
  pushl $43
  1020a3:	6a 2b                	push   $0x2b
  jmp __alltraps
  1020a5:	e9 f4 08 00 00       	jmp    10299e <__alltraps>

001020aa <vector44>:
.globl vector44
vector44:
  pushl $0
  1020aa:	6a 00                	push   $0x0
  pushl $44
  1020ac:	6a 2c                	push   $0x2c
  jmp __alltraps
  1020ae:	e9 eb 08 00 00       	jmp    10299e <__alltraps>

001020b3 <vector45>:
.globl vector45
vector45:
  pushl $0
  1020b3:	6a 00                	push   $0x0
  pushl $45
  1020b5:	6a 2d                	push   $0x2d
  jmp __alltraps
  1020b7:	e9 e2 08 00 00       	jmp    10299e <__alltraps>

001020bc <vector46>:
.globl vector46
vector46:
  pushl $0
  1020bc:	6a 00                	push   $0x0
  pushl $46
  1020be:	6a 2e                	push   $0x2e
  jmp __alltraps
  1020c0:	e9 d9 08 00 00       	jmp    10299e <__alltraps>

001020c5 <vector47>:
.globl vector47
vector47:
  pushl $0
  1020c5:	6a 00                	push   $0x0
  pushl $47
  1020c7:	6a 2f                	push   $0x2f
  jmp __alltraps
  1020c9:	e9 d0 08 00 00       	jmp    10299e <__alltraps>

001020ce <vector48>:
.globl vector48
vector48:
  pushl $0
  1020ce:	6a 00                	push   $0x0
  pushl $48
  1020d0:	6a 30                	push   $0x30
  jmp __alltraps
  1020d2:	e9 c7 08 00 00       	jmp    10299e <__alltraps>

001020d7 <vector49>:
.globl vector49
vector49:
  pushl $0
  1020d7:	6a 00                	push   $0x0
  pushl $49
  1020d9:	6a 31                	push   $0x31
  jmp __alltraps
  1020db:	e9 be 08 00 00       	jmp    10299e <__alltraps>

001020e0 <vector50>:
.globl vector50
vector50:
  pushl $0
  1020e0:	6a 00                	push   $0x0
  pushl $50
  1020e2:	6a 32                	push   $0x32
  jmp __alltraps
  1020e4:	e9 b5 08 00 00       	jmp    10299e <__alltraps>

001020e9 <vector51>:
.globl vector51
vector51:
  pushl $0
  1020e9:	6a 00                	push   $0x0
  pushl $51
  1020eb:	6a 33                	push   $0x33
  jmp __alltraps
  1020ed:	e9 ac 08 00 00       	jmp    10299e <__alltraps>

001020f2 <vector52>:
.globl vector52
vector52:
  pushl $0
  1020f2:	6a 00                	push   $0x0
  pushl $52
  1020f4:	6a 34                	push   $0x34
  jmp __alltraps
  1020f6:	e9 a3 08 00 00       	jmp    10299e <__alltraps>

001020fb <vector53>:
.globl vector53
vector53:
  pushl $0
  1020fb:	6a 00                	push   $0x0
  pushl $53
  1020fd:	6a 35                	push   $0x35
  jmp __alltraps
  1020ff:	e9 9a 08 00 00       	jmp    10299e <__alltraps>

00102104 <vector54>:
.globl vector54
vector54:
  pushl $0
  102104:	6a 00                	push   $0x0
  pushl $54
  102106:	6a 36                	push   $0x36
  jmp __alltraps
  102108:	e9 91 08 00 00       	jmp    10299e <__alltraps>

0010210d <vector55>:
.globl vector55
vector55:
  pushl $0
  10210d:	6a 00                	push   $0x0
  pushl $55
  10210f:	6a 37                	push   $0x37
  jmp __alltraps
  102111:	e9 88 08 00 00       	jmp    10299e <__alltraps>

00102116 <vector56>:
.globl vector56
vector56:
  pushl $0
  102116:	6a 00                	push   $0x0
  pushl $56
  102118:	6a 38                	push   $0x38
  jmp __alltraps
  10211a:	e9 7f 08 00 00       	jmp    10299e <__alltraps>

0010211f <vector57>:
.globl vector57
vector57:
  pushl $0
  10211f:	6a 00                	push   $0x0
  pushl $57
  102121:	6a 39                	push   $0x39
  jmp __alltraps
  102123:	e9 76 08 00 00       	jmp    10299e <__alltraps>

00102128 <vector58>:
.globl vector58
vector58:
  pushl $0
  102128:	6a 00                	push   $0x0
  pushl $58
  10212a:	6a 3a                	push   $0x3a
  jmp __alltraps
  10212c:	e9 6d 08 00 00       	jmp    10299e <__alltraps>

00102131 <vector59>:
.globl vector59
vector59:
  pushl $0
  102131:	6a 00                	push   $0x0
  pushl $59
  102133:	6a 3b                	push   $0x3b
  jmp __alltraps
  102135:	e9 64 08 00 00       	jmp    10299e <__alltraps>

0010213a <vector60>:
.globl vector60
vector60:
  pushl $0
  10213a:	6a 00                	push   $0x0
  pushl $60
  10213c:	6a 3c                	push   $0x3c
  jmp __alltraps
  10213e:	e9 5b 08 00 00       	jmp    10299e <__alltraps>

00102143 <vector61>:
.globl vector61
vector61:
  pushl $0
  102143:	6a 00                	push   $0x0
  pushl $61
  102145:	6a 3d                	push   $0x3d
  jmp __alltraps
  102147:	e9 52 08 00 00       	jmp    10299e <__alltraps>

0010214c <vector62>:
.globl vector62
vector62:
  pushl $0
  10214c:	6a 00                	push   $0x0
  pushl $62
  10214e:	6a 3e                	push   $0x3e
  jmp __alltraps
  102150:	e9 49 08 00 00       	jmp    10299e <__alltraps>

00102155 <vector63>:
.globl vector63
vector63:
  pushl $0
  102155:	6a 00                	push   $0x0
  pushl $63
  102157:	6a 3f                	push   $0x3f
  jmp __alltraps
  102159:	e9 40 08 00 00       	jmp    10299e <__alltraps>

0010215e <vector64>:
.globl vector64
vector64:
  pushl $0
  10215e:	6a 00                	push   $0x0
  pushl $64
  102160:	6a 40                	push   $0x40
  jmp __alltraps
  102162:	e9 37 08 00 00       	jmp    10299e <__alltraps>

00102167 <vector65>:
.globl vector65
vector65:
  pushl $0
  102167:	6a 00                	push   $0x0
  pushl $65
  102169:	6a 41                	push   $0x41
  jmp __alltraps
  10216b:	e9 2e 08 00 00       	jmp    10299e <__alltraps>

00102170 <vector66>:
.globl vector66
vector66:
  pushl $0
  102170:	6a 00                	push   $0x0
  pushl $66
  102172:	6a 42                	push   $0x42
  jmp __alltraps
  102174:	e9 25 08 00 00       	jmp    10299e <__alltraps>

00102179 <vector67>:
.globl vector67
vector67:
  pushl $0
  102179:	6a 00                	push   $0x0
  pushl $67
  10217b:	6a 43                	push   $0x43
  jmp __alltraps
  10217d:	e9 1c 08 00 00       	jmp    10299e <__alltraps>

00102182 <vector68>:
.globl vector68
vector68:
  pushl $0
  102182:	6a 00                	push   $0x0
  pushl $68
  102184:	6a 44                	push   $0x44
  jmp __alltraps
  102186:	e9 13 08 00 00       	jmp    10299e <__alltraps>

0010218b <vector69>:
.globl vector69
vector69:
  pushl $0
  10218b:	6a 00                	push   $0x0
  pushl $69
  10218d:	6a 45                	push   $0x45
  jmp __alltraps
  10218f:	e9 0a 08 00 00       	jmp    10299e <__alltraps>

00102194 <vector70>:
.globl vector70
vector70:
  pushl $0
  102194:	6a 00                	push   $0x0
  pushl $70
  102196:	6a 46                	push   $0x46
  jmp __alltraps
  102198:	e9 01 08 00 00       	jmp    10299e <__alltraps>

0010219d <vector71>:
.globl vector71
vector71:
  pushl $0
  10219d:	6a 00                	push   $0x0
  pushl $71
  10219f:	6a 47                	push   $0x47
  jmp __alltraps
  1021a1:	e9 f8 07 00 00       	jmp    10299e <__alltraps>

001021a6 <vector72>:
.globl vector72
vector72:
  pushl $0
  1021a6:	6a 00                	push   $0x0
  pushl $72
  1021a8:	6a 48                	push   $0x48
  jmp __alltraps
  1021aa:	e9 ef 07 00 00       	jmp    10299e <__alltraps>

001021af <vector73>:
.globl vector73
vector73:
  pushl $0
  1021af:	6a 00                	push   $0x0
  pushl $73
  1021b1:	6a 49                	push   $0x49
  jmp __alltraps
  1021b3:	e9 e6 07 00 00       	jmp    10299e <__alltraps>

001021b8 <vector74>:
.globl vector74
vector74:
  pushl $0
  1021b8:	6a 00                	push   $0x0
  pushl $74
  1021ba:	6a 4a                	push   $0x4a
  jmp __alltraps
  1021bc:	e9 dd 07 00 00       	jmp    10299e <__alltraps>

001021c1 <vector75>:
.globl vector75
vector75:
  pushl $0
  1021c1:	6a 00                	push   $0x0
  pushl $75
  1021c3:	6a 4b                	push   $0x4b
  jmp __alltraps
  1021c5:	e9 d4 07 00 00       	jmp    10299e <__alltraps>

001021ca <vector76>:
.globl vector76
vector76:
  pushl $0
  1021ca:	6a 00                	push   $0x0
  pushl $76
  1021cc:	6a 4c                	push   $0x4c
  jmp __alltraps
  1021ce:	e9 cb 07 00 00       	jmp    10299e <__alltraps>

001021d3 <vector77>:
.globl vector77
vector77:
  pushl $0
  1021d3:	6a 00                	push   $0x0
  pushl $77
  1021d5:	6a 4d                	push   $0x4d
  jmp __alltraps
  1021d7:	e9 c2 07 00 00       	jmp    10299e <__alltraps>

001021dc <vector78>:
.globl vector78
vector78:
  pushl $0
  1021dc:	6a 00                	push   $0x0
  pushl $78
  1021de:	6a 4e                	push   $0x4e
  jmp __alltraps
  1021e0:	e9 b9 07 00 00       	jmp    10299e <__alltraps>

001021e5 <vector79>:
.globl vector79
vector79:
  pushl $0
  1021e5:	6a 00                	push   $0x0
  pushl $79
  1021e7:	6a 4f                	push   $0x4f
  jmp __alltraps
  1021e9:	e9 b0 07 00 00       	jmp    10299e <__alltraps>

001021ee <vector80>:
.globl vector80
vector80:
  pushl $0
  1021ee:	6a 00                	push   $0x0
  pushl $80
  1021f0:	6a 50                	push   $0x50
  jmp __alltraps
  1021f2:	e9 a7 07 00 00       	jmp    10299e <__alltraps>

001021f7 <vector81>:
.globl vector81
vector81:
  pushl $0
  1021f7:	6a 00                	push   $0x0
  pushl $81
  1021f9:	6a 51                	push   $0x51
  jmp __alltraps
  1021fb:	e9 9e 07 00 00       	jmp    10299e <__alltraps>

00102200 <vector82>:
.globl vector82
vector82:
  pushl $0
  102200:	6a 00                	push   $0x0
  pushl $82
  102202:	6a 52                	push   $0x52
  jmp __alltraps
  102204:	e9 95 07 00 00       	jmp    10299e <__alltraps>

00102209 <vector83>:
.globl vector83
vector83:
  pushl $0
  102209:	6a 00                	push   $0x0
  pushl $83
  10220b:	6a 53                	push   $0x53
  jmp __alltraps
  10220d:	e9 8c 07 00 00       	jmp    10299e <__alltraps>

00102212 <vector84>:
.globl vector84
vector84:
  pushl $0
  102212:	6a 00                	push   $0x0
  pushl $84
  102214:	6a 54                	push   $0x54
  jmp __alltraps
  102216:	e9 83 07 00 00       	jmp    10299e <__alltraps>

0010221b <vector85>:
.globl vector85
vector85:
  pushl $0
  10221b:	6a 00                	push   $0x0
  pushl $85
  10221d:	6a 55                	push   $0x55
  jmp __alltraps
  10221f:	e9 7a 07 00 00       	jmp    10299e <__alltraps>

00102224 <vector86>:
.globl vector86
vector86:
  pushl $0
  102224:	6a 00                	push   $0x0
  pushl $86
  102226:	6a 56                	push   $0x56
  jmp __alltraps
  102228:	e9 71 07 00 00       	jmp    10299e <__alltraps>

0010222d <vector87>:
.globl vector87
vector87:
  pushl $0
  10222d:	6a 00                	push   $0x0
  pushl $87
  10222f:	6a 57                	push   $0x57
  jmp __alltraps
  102231:	e9 68 07 00 00       	jmp    10299e <__alltraps>

00102236 <vector88>:
.globl vector88
vector88:
  pushl $0
  102236:	6a 00                	push   $0x0
  pushl $88
  102238:	6a 58                	push   $0x58
  jmp __alltraps
  10223a:	e9 5f 07 00 00       	jmp    10299e <__alltraps>

0010223f <vector89>:
.globl vector89
vector89:
  pushl $0
  10223f:	6a 00                	push   $0x0
  pushl $89
  102241:	6a 59                	push   $0x59
  jmp __alltraps
  102243:	e9 56 07 00 00       	jmp    10299e <__alltraps>

00102248 <vector90>:
.globl vector90
vector90:
  pushl $0
  102248:	6a 00                	push   $0x0
  pushl $90
  10224a:	6a 5a                	push   $0x5a
  jmp __alltraps
  10224c:	e9 4d 07 00 00       	jmp    10299e <__alltraps>

00102251 <vector91>:
.globl vector91
vector91:
  pushl $0
  102251:	6a 00                	push   $0x0
  pushl $91
  102253:	6a 5b                	push   $0x5b
  jmp __alltraps
  102255:	e9 44 07 00 00       	jmp    10299e <__alltraps>

0010225a <vector92>:
.globl vector92
vector92:
  pushl $0
  10225a:	6a 00                	push   $0x0
  pushl $92
  10225c:	6a 5c                	push   $0x5c
  jmp __alltraps
  10225e:	e9 3b 07 00 00       	jmp    10299e <__alltraps>

00102263 <vector93>:
.globl vector93
vector93:
  pushl $0
  102263:	6a 00                	push   $0x0
  pushl $93
  102265:	6a 5d                	push   $0x5d
  jmp __alltraps
  102267:	e9 32 07 00 00       	jmp    10299e <__alltraps>

0010226c <vector94>:
.globl vector94
vector94:
  pushl $0
  10226c:	6a 00                	push   $0x0
  pushl $94
  10226e:	6a 5e                	push   $0x5e
  jmp __alltraps
  102270:	e9 29 07 00 00       	jmp    10299e <__alltraps>

00102275 <vector95>:
.globl vector95
vector95:
  pushl $0
  102275:	6a 00                	push   $0x0
  pushl $95
  102277:	6a 5f                	push   $0x5f
  jmp __alltraps
  102279:	e9 20 07 00 00       	jmp    10299e <__alltraps>

0010227e <vector96>:
.globl vector96
vector96:
  pushl $0
  10227e:	6a 00                	push   $0x0
  pushl $96
  102280:	6a 60                	push   $0x60
  jmp __alltraps
  102282:	e9 17 07 00 00       	jmp    10299e <__alltraps>

00102287 <vector97>:
.globl vector97
vector97:
  pushl $0
  102287:	6a 00                	push   $0x0
  pushl $97
  102289:	6a 61                	push   $0x61
  jmp __alltraps
  10228b:	e9 0e 07 00 00       	jmp    10299e <__alltraps>

00102290 <vector98>:
.globl vector98
vector98:
  pushl $0
  102290:	6a 00                	push   $0x0
  pushl $98
  102292:	6a 62                	push   $0x62
  jmp __alltraps
  102294:	e9 05 07 00 00       	jmp    10299e <__alltraps>

00102299 <vector99>:
.globl vector99
vector99:
  pushl $0
  102299:	6a 00                	push   $0x0
  pushl $99
  10229b:	6a 63                	push   $0x63
  jmp __alltraps
  10229d:	e9 fc 06 00 00       	jmp    10299e <__alltraps>

001022a2 <vector100>:
.globl vector100
vector100:
  pushl $0
  1022a2:	6a 00                	push   $0x0
  pushl $100
  1022a4:	6a 64                	push   $0x64
  jmp __alltraps
  1022a6:	e9 f3 06 00 00       	jmp    10299e <__alltraps>

001022ab <vector101>:
.globl vector101
vector101:
  pushl $0
  1022ab:	6a 00                	push   $0x0
  pushl $101
  1022ad:	6a 65                	push   $0x65
  jmp __alltraps
  1022af:	e9 ea 06 00 00       	jmp    10299e <__alltraps>

001022b4 <vector102>:
.globl vector102
vector102:
  pushl $0
  1022b4:	6a 00                	push   $0x0
  pushl $102
  1022b6:	6a 66                	push   $0x66
  jmp __alltraps
  1022b8:	e9 e1 06 00 00       	jmp    10299e <__alltraps>

001022bd <vector103>:
.globl vector103
vector103:
  pushl $0
  1022bd:	6a 00                	push   $0x0
  pushl $103
  1022bf:	6a 67                	push   $0x67
  jmp __alltraps
  1022c1:	e9 d8 06 00 00       	jmp    10299e <__alltraps>

001022c6 <vector104>:
.globl vector104
vector104:
  pushl $0
  1022c6:	6a 00                	push   $0x0
  pushl $104
  1022c8:	6a 68                	push   $0x68
  jmp __alltraps
  1022ca:	e9 cf 06 00 00       	jmp    10299e <__alltraps>

001022cf <vector105>:
.globl vector105
vector105:
  pushl $0
  1022cf:	6a 00                	push   $0x0
  pushl $105
  1022d1:	6a 69                	push   $0x69
  jmp __alltraps
  1022d3:	e9 c6 06 00 00       	jmp    10299e <__alltraps>

001022d8 <vector106>:
.globl vector106
vector106:
  pushl $0
  1022d8:	6a 00                	push   $0x0
  pushl $106
  1022da:	6a 6a                	push   $0x6a
  jmp __alltraps
  1022dc:	e9 bd 06 00 00       	jmp    10299e <__alltraps>

001022e1 <vector107>:
.globl vector107
vector107:
  pushl $0
  1022e1:	6a 00                	push   $0x0
  pushl $107
  1022e3:	6a 6b                	push   $0x6b
  jmp __alltraps
  1022e5:	e9 b4 06 00 00       	jmp    10299e <__alltraps>

001022ea <vector108>:
.globl vector108
vector108:
  pushl $0
  1022ea:	6a 00                	push   $0x0
  pushl $108
  1022ec:	6a 6c                	push   $0x6c
  jmp __alltraps
  1022ee:	e9 ab 06 00 00       	jmp    10299e <__alltraps>

001022f3 <vector109>:
.globl vector109
vector109:
  pushl $0
  1022f3:	6a 00                	push   $0x0
  pushl $109
  1022f5:	6a 6d                	push   $0x6d
  jmp __alltraps
  1022f7:	e9 a2 06 00 00       	jmp    10299e <__alltraps>

001022fc <vector110>:
.globl vector110
vector110:
  pushl $0
  1022fc:	6a 00                	push   $0x0
  pushl $110
  1022fe:	6a 6e                	push   $0x6e
  jmp __alltraps
  102300:	e9 99 06 00 00       	jmp    10299e <__alltraps>

00102305 <vector111>:
.globl vector111
vector111:
  pushl $0
  102305:	6a 00                	push   $0x0
  pushl $111
  102307:	6a 6f                	push   $0x6f
  jmp __alltraps
  102309:	e9 90 06 00 00       	jmp    10299e <__alltraps>

0010230e <vector112>:
.globl vector112
vector112:
  pushl $0
  10230e:	6a 00                	push   $0x0
  pushl $112
  102310:	6a 70                	push   $0x70
  jmp __alltraps
  102312:	e9 87 06 00 00       	jmp    10299e <__alltraps>

00102317 <vector113>:
.globl vector113
vector113:
  pushl $0
  102317:	6a 00                	push   $0x0
  pushl $113
  102319:	6a 71                	push   $0x71
  jmp __alltraps
  10231b:	e9 7e 06 00 00       	jmp    10299e <__alltraps>

00102320 <vector114>:
.globl vector114
vector114:
  pushl $0
  102320:	6a 00                	push   $0x0
  pushl $114
  102322:	6a 72                	push   $0x72
  jmp __alltraps
  102324:	e9 75 06 00 00       	jmp    10299e <__alltraps>

00102329 <vector115>:
.globl vector115
vector115:
  pushl $0
  102329:	6a 00                	push   $0x0
  pushl $115
  10232b:	6a 73                	push   $0x73
  jmp __alltraps
  10232d:	e9 6c 06 00 00       	jmp    10299e <__alltraps>

00102332 <vector116>:
.globl vector116
vector116:
  pushl $0
  102332:	6a 00                	push   $0x0
  pushl $116
  102334:	6a 74                	push   $0x74
  jmp __alltraps
  102336:	e9 63 06 00 00       	jmp    10299e <__alltraps>

0010233b <vector117>:
.globl vector117
vector117:
  pushl $0
  10233b:	6a 00                	push   $0x0
  pushl $117
  10233d:	6a 75                	push   $0x75
  jmp __alltraps
  10233f:	e9 5a 06 00 00       	jmp    10299e <__alltraps>

00102344 <vector118>:
.globl vector118
vector118:
  pushl $0
  102344:	6a 00                	push   $0x0
  pushl $118
  102346:	6a 76                	push   $0x76
  jmp __alltraps
  102348:	e9 51 06 00 00       	jmp    10299e <__alltraps>

0010234d <vector119>:
.globl vector119
vector119:
  pushl $0
  10234d:	6a 00                	push   $0x0
  pushl $119
  10234f:	6a 77                	push   $0x77
  jmp __alltraps
  102351:	e9 48 06 00 00       	jmp    10299e <__alltraps>

00102356 <vector120>:
.globl vector120
vector120:
  pushl $0
  102356:	6a 00                	push   $0x0
  pushl $120
  102358:	6a 78                	push   $0x78
  jmp __alltraps
  10235a:	e9 3f 06 00 00       	jmp    10299e <__alltraps>

0010235f <vector121>:
.globl vector121
vector121:
  pushl $0
  10235f:	6a 00                	push   $0x0
  pushl $121
  102361:	6a 79                	push   $0x79
  jmp __alltraps
  102363:	e9 36 06 00 00       	jmp    10299e <__alltraps>

00102368 <vector122>:
.globl vector122
vector122:
  pushl $0
  102368:	6a 00                	push   $0x0
  pushl $122
  10236a:	6a 7a                	push   $0x7a
  jmp __alltraps
  10236c:	e9 2d 06 00 00       	jmp    10299e <__alltraps>

00102371 <vector123>:
.globl vector123
vector123:
  pushl $0
  102371:	6a 00                	push   $0x0
  pushl $123
  102373:	6a 7b                	push   $0x7b
  jmp __alltraps
  102375:	e9 24 06 00 00       	jmp    10299e <__alltraps>

0010237a <vector124>:
.globl vector124
vector124:
  pushl $0
  10237a:	6a 00                	push   $0x0
  pushl $124
  10237c:	6a 7c                	push   $0x7c
  jmp __alltraps
  10237e:	e9 1b 06 00 00       	jmp    10299e <__alltraps>

00102383 <vector125>:
.globl vector125
vector125:
  pushl $0
  102383:	6a 00                	push   $0x0
  pushl $125
  102385:	6a 7d                	push   $0x7d
  jmp __alltraps
  102387:	e9 12 06 00 00       	jmp    10299e <__alltraps>

0010238c <vector126>:
.globl vector126
vector126:
  pushl $0
  10238c:	6a 00                	push   $0x0
  pushl $126
  10238e:	6a 7e                	push   $0x7e
  jmp __alltraps
  102390:	e9 09 06 00 00       	jmp    10299e <__alltraps>

00102395 <vector127>:
.globl vector127
vector127:
  pushl $0
  102395:	6a 00                	push   $0x0
  pushl $127
  102397:	6a 7f                	push   $0x7f
  jmp __alltraps
  102399:	e9 00 06 00 00       	jmp    10299e <__alltraps>

0010239e <vector128>:
.globl vector128
vector128:
  pushl $0
  10239e:	6a 00                	push   $0x0
  pushl $128
  1023a0:	68 80 00 00 00       	push   $0x80
  jmp __alltraps
  1023a5:	e9 f4 05 00 00       	jmp    10299e <__alltraps>

001023aa <vector129>:
.globl vector129
vector129:
  pushl $0
  1023aa:	6a 00                	push   $0x0
  pushl $129
  1023ac:	68 81 00 00 00       	push   $0x81
  jmp __alltraps
  1023b1:	e9 e8 05 00 00       	jmp    10299e <__alltraps>

001023b6 <vector130>:
.globl vector130
vector130:
  pushl $0
  1023b6:	6a 00                	push   $0x0
  pushl $130
  1023b8:	68 82 00 00 00       	push   $0x82
  jmp __alltraps
  1023bd:	e9 dc 05 00 00       	jmp    10299e <__alltraps>

001023c2 <vector131>:
.globl vector131
vector131:
  pushl $0
  1023c2:	6a 00                	push   $0x0
  pushl $131
  1023c4:	68 83 00 00 00       	push   $0x83
  jmp __alltraps
  1023c9:	e9 d0 05 00 00       	jmp    10299e <__alltraps>

001023ce <vector132>:
.globl vector132
vector132:
  pushl $0
  1023ce:	6a 00                	push   $0x0
  pushl $132
  1023d0:	68 84 00 00 00       	push   $0x84
  jmp __alltraps
  1023d5:	e9 c4 05 00 00       	jmp    10299e <__alltraps>

001023da <vector133>:
.globl vector133
vector133:
  pushl $0
  1023da:	6a 00                	push   $0x0
  pushl $133
  1023dc:	68 85 00 00 00       	push   $0x85
  jmp __alltraps
  1023e1:	e9 b8 05 00 00       	jmp    10299e <__alltraps>

001023e6 <vector134>:
.globl vector134
vector134:
  pushl $0
  1023e6:	6a 00                	push   $0x0
  pushl $134
  1023e8:	68 86 00 00 00       	push   $0x86
  jmp __alltraps
  1023ed:	e9 ac 05 00 00       	jmp    10299e <__alltraps>

001023f2 <vector135>:
.globl vector135
vector135:
  pushl $0
  1023f2:	6a 00                	push   $0x0
  pushl $135
  1023f4:	68 87 00 00 00       	push   $0x87
  jmp __alltraps
  1023f9:	e9 a0 05 00 00       	jmp    10299e <__alltraps>

001023fe <vector136>:
.globl vector136
vector136:
  pushl $0
  1023fe:	6a 00                	push   $0x0
  pushl $136
  102400:	68 88 00 00 00       	push   $0x88
  jmp __alltraps
  102405:	e9 94 05 00 00       	jmp    10299e <__alltraps>

0010240a <vector137>:
.globl vector137
vector137:
  pushl $0
  10240a:	6a 00                	push   $0x0
  pushl $137
  10240c:	68 89 00 00 00       	push   $0x89
  jmp __alltraps
  102411:	e9 88 05 00 00       	jmp    10299e <__alltraps>

00102416 <vector138>:
.globl vector138
vector138:
  pushl $0
  102416:	6a 00                	push   $0x0
  pushl $138
  102418:	68 8a 00 00 00       	push   $0x8a
  jmp __alltraps
  10241d:	e9 7c 05 00 00       	jmp    10299e <__alltraps>

00102422 <vector139>:
.globl vector139
vector139:
  pushl $0
  102422:	6a 00                	push   $0x0
  pushl $139
  102424:	68 8b 00 00 00       	push   $0x8b
  jmp __alltraps
  102429:	e9 70 05 00 00       	jmp    10299e <__alltraps>

0010242e <vector140>:
.globl vector140
vector140:
  pushl $0
  10242e:	6a 00                	push   $0x0
  pushl $140
  102430:	68 8c 00 00 00       	push   $0x8c
  jmp __alltraps
  102435:	e9 64 05 00 00       	jmp    10299e <__alltraps>

0010243a <vector141>:
.globl vector141
vector141:
  pushl $0
  10243a:	6a 00                	push   $0x0
  pushl $141
  10243c:	68 8d 00 00 00       	push   $0x8d
  jmp __alltraps
  102441:	e9 58 05 00 00       	jmp    10299e <__alltraps>

00102446 <vector142>:
.globl vector142
vector142:
  pushl $0
  102446:	6a 00                	push   $0x0
  pushl $142
  102448:	68 8e 00 00 00       	push   $0x8e
  jmp __alltraps
  10244d:	e9 4c 05 00 00       	jmp    10299e <__alltraps>

00102452 <vector143>:
.globl vector143
vector143:
  pushl $0
  102452:	6a 00                	push   $0x0
  pushl $143
  102454:	68 8f 00 00 00       	push   $0x8f
  jmp __alltraps
  102459:	e9 40 05 00 00       	jmp    10299e <__alltraps>

0010245e <vector144>:
.globl vector144
vector144:
  pushl $0
  10245e:	6a 00                	push   $0x0
  pushl $144
  102460:	68 90 00 00 00       	push   $0x90
  jmp __alltraps
  102465:	e9 34 05 00 00       	jmp    10299e <__alltraps>

0010246a <vector145>:
.globl vector145
vector145:
  pushl $0
  10246a:	6a 00                	push   $0x0
  pushl $145
  10246c:	68 91 00 00 00       	push   $0x91
  jmp __alltraps
  102471:	e9 28 05 00 00       	jmp    10299e <__alltraps>

00102476 <vector146>:
.globl vector146
vector146:
  pushl $0
  102476:	6a 00                	push   $0x0
  pushl $146
  102478:	68 92 00 00 00       	push   $0x92
  jmp __alltraps
  10247d:	e9 1c 05 00 00       	jmp    10299e <__alltraps>

00102482 <vector147>:
.globl vector147
vector147:
  pushl $0
  102482:	6a 00                	push   $0x0
  pushl $147
  102484:	68 93 00 00 00       	push   $0x93
  jmp __alltraps
  102489:	e9 10 05 00 00       	jmp    10299e <__alltraps>

0010248e <vector148>:
.globl vector148
vector148:
  pushl $0
  10248e:	6a 00                	push   $0x0
  pushl $148
  102490:	68 94 00 00 00       	push   $0x94
  jmp __alltraps
  102495:	e9 04 05 00 00       	jmp    10299e <__alltraps>

0010249a <vector149>:
.globl vector149
vector149:
  pushl $0
  10249a:	6a 00                	push   $0x0
  pushl $149
  10249c:	68 95 00 00 00       	push   $0x95
  jmp __alltraps
  1024a1:	e9 f8 04 00 00       	jmp    10299e <__alltraps>

001024a6 <vector150>:
.globl vector150
vector150:
  pushl $0
  1024a6:	6a 00                	push   $0x0
  pushl $150
  1024a8:	68 96 00 00 00       	push   $0x96
  jmp __alltraps
  1024ad:	e9 ec 04 00 00       	jmp    10299e <__alltraps>

001024b2 <vector151>:
.globl vector151
vector151:
  pushl $0
  1024b2:	6a 00                	push   $0x0
  pushl $151
  1024b4:	68 97 00 00 00       	push   $0x97
  jmp __alltraps
  1024b9:	e9 e0 04 00 00       	jmp    10299e <__alltraps>

001024be <vector152>:
.globl vector152
vector152:
  pushl $0
  1024be:	6a 00                	push   $0x0
  pushl $152
  1024c0:	68 98 00 00 00       	push   $0x98
  jmp __alltraps
  1024c5:	e9 d4 04 00 00       	jmp    10299e <__alltraps>

001024ca <vector153>:
.globl vector153
vector153:
  pushl $0
  1024ca:	6a 00                	push   $0x0
  pushl $153
  1024cc:	68 99 00 00 00       	push   $0x99
  jmp __alltraps
  1024d1:	e9 c8 04 00 00       	jmp    10299e <__alltraps>

001024d6 <vector154>:
.globl vector154
vector154:
  pushl $0
  1024d6:	6a 00                	push   $0x0
  pushl $154
  1024d8:	68 9a 00 00 00       	push   $0x9a
  jmp __alltraps
  1024dd:	e9 bc 04 00 00       	jmp    10299e <__alltraps>

001024e2 <vector155>:
.globl vector155
vector155:
  pushl $0
  1024e2:	6a 00                	push   $0x0
  pushl $155
  1024e4:	68 9b 00 00 00       	push   $0x9b
  jmp __alltraps
  1024e9:	e9 b0 04 00 00       	jmp    10299e <__alltraps>

001024ee <vector156>:
.globl vector156
vector156:
  pushl $0
  1024ee:	6a 00                	push   $0x0
  pushl $156
  1024f0:	68 9c 00 00 00       	push   $0x9c
  jmp __alltraps
  1024f5:	e9 a4 04 00 00       	jmp    10299e <__alltraps>

001024fa <vector157>:
.globl vector157
vector157:
  pushl $0
  1024fa:	6a 00                	push   $0x0
  pushl $157
  1024fc:	68 9d 00 00 00       	push   $0x9d
  jmp __alltraps
  102501:	e9 98 04 00 00       	jmp    10299e <__alltraps>

00102506 <vector158>:
.globl vector158
vector158:
  pushl $0
  102506:	6a 00                	push   $0x0
  pushl $158
  102508:	68 9e 00 00 00       	push   $0x9e
  jmp __alltraps
  10250d:	e9 8c 04 00 00       	jmp    10299e <__alltraps>

00102512 <vector159>:
.globl vector159
vector159:
  pushl $0
  102512:	6a 00                	push   $0x0
  pushl $159
  102514:	68 9f 00 00 00       	push   $0x9f
  jmp __alltraps
  102519:	e9 80 04 00 00       	jmp    10299e <__alltraps>

0010251e <vector160>:
.globl vector160
vector160:
  pushl $0
  10251e:	6a 00                	push   $0x0
  pushl $160
  102520:	68 a0 00 00 00       	push   $0xa0
  jmp __alltraps
  102525:	e9 74 04 00 00       	jmp    10299e <__alltraps>

0010252a <vector161>:
.globl vector161
vector161:
  pushl $0
  10252a:	6a 00                	push   $0x0
  pushl $161
  10252c:	68 a1 00 00 00       	push   $0xa1
  jmp __alltraps
  102531:	e9 68 04 00 00       	jmp    10299e <__alltraps>

00102536 <vector162>:
.globl vector162
vector162:
  pushl $0
  102536:	6a 00                	push   $0x0
  pushl $162
  102538:	68 a2 00 00 00       	push   $0xa2
  jmp __alltraps
  10253d:	e9 5c 04 00 00       	jmp    10299e <__alltraps>

00102542 <vector163>:
.globl vector163
vector163:
  pushl $0
  102542:	6a 00                	push   $0x0
  pushl $163
  102544:	68 a3 00 00 00       	push   $0xa3
  jmp __alltraps
  102549:	e9 50 04 00 00       	jmp    10299e <__alltraps>

0010254e <vector164>:
.globl vector164
vector164:
  pushl $0
  10254e:	6a 00                	push   $0x0
  pushl $164
  102550:	68 a4 00 00 00       	push   $0xa4
  jmp __alltraps
  102555:	e9 44 04 00 00       	jmp    10299e <__alltraps>

0010255a <vector165>:
.globl vector165
vector165:
  pushl $0
  10255a:	6a 00                	push   $0x0
  pushl $165
  10255c:	68 a5 00 00 00       	push   $0xa5
  jmp __alltraps
  102561:	e9 38 04 00 00       	jmp    10299e <__alltraps>

00102566 <vector166>:
.globl vector166
vector166:
  pushl $0
  102566:	6a 00                	push   $0x0
  pushl $166
  102568:	68 a6 00 00 00       	push   $0xa6
  jmp __alltraps
  10256d:	e9 2c 04 00 00       	jmp    10299e <__alltraps>

00102572 <vector167>:
.globl vector167
vector167:
  pushl $0
  102572:	6a 00                	push   $0x0
  pushl $167
  102574:	68 a7 00 00 00       	push   $0xa7
  jmp __alltraps
  102579:	e9 20 04 00 00       	jmp    10299e <__alltraps>

0010257e <vector168>:
.globl vector168
vector168:
  pushl $0
  10257e:	6a 00                	push   $0x0
  pushl $168
  102580:	68 a8 00 00 00       	push   $0xa8
  jmp __alltraps
  102585:	e9 14 04 00 00       	jmp    10299e <__alltraps>

0010258a <vector169>:
.globl vector169
vector169:
  pushl $0
  10258a:	6a 00                	push   $0x0
  pushl $169
  10258c:	68 a9 00 00 00       	push   $0xa9
  jmp __alltraps
  102591:	e9 08 04 00 00       	jmp    10299e <__alltraps>

00102596 <vector170>:
.globl vector170
vector170:
  pushl $0
  102596:	6a 00                	push   $0x0
  pushl $170
  102598:	68 aa 00 00 00       	push   $0xaa
  jmp __alltraps
  10259d:	e9 fc 03 00 00       	jmp    10299e <__alltraps>

001025a2 <vector171>:
.globl vector171
vector171:
  pushl $0
  1025a2:	6a 00                	push   $0x0
  pushl $171
  1025a4:	68 ab 00 00 00       	push   $0xab
  jmp __alltraps
  1025a9:	e9 f0 03 00 00       	jmp    10299e <__alltraps>

001025ae <vector172>:
.globl vector172
vector172:
  pushl $0
  1025ae:	6a 00                	push   $0x0
  pushl $172
  1025b0:	68 ac 00 00 00       	push   $0xac
  jmp __alltraps
  1025b5:	e9 e4 03 00 00       	jmp    10299e <__alltraps>

001025ba <vector173>:
.globl vector173
vector173:
  pushl $0
  1025ba:	6a 00                	push   $0x0
  pushl $173
  1025bc:	68 ad 00 00 00       	push   $0xad
  jmp __alltraps
  1025c1:	e9 d8 03 00 00       	jmp    10299e <__alltraps>

001025c6 <vector174>:
.globl vector174
vector174:
  pushl $0
  1025c6:	6a 00                	push   $0x0
  pushl $174
  1025c8:	68 ae 00 00 00       	push   $0xae
  jmp __alltraps
  1025cd:	e9 cc 03 00 00       	jmp    10299e <__alltraps>

001025d2 <vector175>:
.globl vector175
vector175:
  pushl $0
  1025d2:	6a 00                	push   $0x0
  pushl $175
  1025d4:	68 af 00 00 00       	push   $0xaf
  jmp __alltraps
  1025d9:	e9 c0 03 00 00       	jmp    10299e <__alltraps>

001025de <vector176>:
.globl vector176
vector176:
  pushl $0
  1025de:	6a 00                	push   $0x0
  pushl $176
  1025e0:	68 b0 00 00 00       	push   $0xb0
  jmp __alltraps
  1025e5:	e9 b4 03 00 00       	jmp    10299e <__alltraps>

001025ea <vector177>:
.globl vector177
vector177:
  pushl $0
  1025ea:	6a 00                	push   $0x0
  pushl $177
  1025ec:	68 b1 00 00 00       	push   $0xb1
  jmp __alltraps
  1025f1:	e9 a8 03 00 00       	jmp    10299e <__alltraps>

001025f6 <vector178>:
.globl vector178
vector178:
  pushl $0
  1025f6:	6a 00                	push   $0x0
  pushl $178
  1025f8:	68 b2 00 00 00       	push   $0xb2
  jmp __alltraps
  1025fd:	e9 9c 03 00 00       	jmp    10299e <__alltraps>

00102602 <vector179>:
.globl vector179
vector179:
  pushl $0
  102602:	6a 00                	push   $0x0
  pushl $179
  102604:	68 b3 00 00 00       	push   $0xb3
  jmp __alltraps
  102609:	e9 90 03 00 00       	jmp    10299e <__alltraps>

0010260e <vector180>:
.globl vector180
vector180:
  pushl $0
  10260e:	6a 00                	push   $0x0
  pushl $180
  102610:	68 b4 00 00 00       	push   $0xb4
  jmp __alltraps
  102615:	e9 84 03 00 00       	jmp    10299e <__alltraps>

0010261a <vector181>:
.globl vector181
vector181:
  pushl $0
  10261a:	6a 00                	push   $0x0
  pushl $181
  10261c:	68 b5 00 00 00       	push   $0xb5
  jmp __alltraps
  102621:	e9 78 03 00 00       	jmp    10299e <__alltraps>

00102626 <vector182>:
.globl vector182
vector182:
  pushl $0
  102626:	6a 00                	push   $0x0
  pushl $182
  102628:	68 b6 00 00 00       	push   $0xb6
  jmp __alltraps
  10262d:	e9 6c 03 00 00       	jmp    10299e <__alltraps>

00102632 <vector183>:
.globl vector183
vector183:
  pushl $0
  102632:	6a 00                	push   $0x0
  pushl $183
  102634:	68 b7 00 00 00       	push   $0xb7
  jmp __alltraps
  102639:	e9 60 03 00 00       	jmp    10299e <__alltraps>

0010263e <vector184>:
.globl vector184
vector184:
  pushl $0
  10263e:	6a 00                	push   $0x0
  pushl $184
  102640:	68 b8 00 00 00       	push   $0xb8
  jmp __alltraps
  102645:	e9 54 03 00 00       	jmp    10299e <__alltraps>

0010264a <vector185>:
.globl vector185
vector185:
  pushl $0
  10264a:	6a 00                	push   $0x0
  pushl $185
  10264c:	68 b9 00 00 00       	push   $0xb9
  jmp __alltraps
  102651:	e9 48 03 00 00       	jmp    10299e <__alltraps>

00102656 <vector186>:
.globl vector186
vector186:
  pushl $0
  102656:	6a 00                	push   $0x0
  pushl $186
  102658:	68 ba 00 00 00       	push   $0xba
  jmp __alltraps
  10265d:	e9 3c 03 00 00       	jmp    10299e <__alltraps>

00102662 <vector187>:
.globl vector187
vector187:
  pushl $0
  102662:	6a 00                	push   $0x0
  pushl $187
  102664:	68 bb 00 00 00       	push   $0xbb
  jmp __alltraps
  102669:	e9 30 03 00 00       	jmp    10299e <__alltraps>

0010266e <vector188>:
.globl vector188
vector188:
  pushl $0
  10266e:	6a 00                	push   $0x0
  pushl $188
  102670:	68 bc 00 00 00       	push   $0xbc
  jmp __alltraps
  102675:	e9 24 03 00 00       	jmp    10299e <__alltraps>

0010267a <vector189>:
.globl vector189
vector189:
  pushl $0
  10267a:	6a 00                	push   $0x0
  pushl $189
  10267c:	68 bd 00 00 00       	push   $0xbd
  jmp __alltraps
  102681:	e9 18 03 00 00       	jmp    10299e <__alltraps>

00102686 <vector190>:
.globl vector190
vector190:
  pushl $0
  102686:	6a 00                	push   $0x0
  pushl $190
  102688:	68 be 00 00 00       	push   $0xbe
  jmp __alltraps
  10268d:	e9 0c 03 00 00       	jmp    10299e <__alltraps>

00102692 <vector191>:
.globl vector191
vector191:
  pushl $0
  102692:	6a 00                	push   $0x0
  pushl $191
  102694:	68 bf 00 00 00       	push   $0xbf
  jmp __alltraps
  102699:	e9 00 03 00 00       	jmp    10299e <__alltraps>

0010269e <vector192>:
.globl vector192
vector192:
  pushl $0
  10269e:	6a 00                	push   $0x0
  pushl $192
  1026a0:	68 c0 00 00 00       	push   $0xc0
  jmp __alltraps
  1026a5:	e9 f4 02 00 00       	jmp    10299e <__alltraps>

001026aa <vector193>:
.globl vector193
vector193:
  pushl $0
  1026aa:	6a 00                	push   $0x0
  pushl $193
  1026ac:	68 c1 00 00 00       	push   $0xc1
  jmp __alltraps
  1026b1:	e9 e8 02 00 00       	jmp    10299e <__alltraps>

001026b6 <vector194>:
.globl vector194
vector194:
  pushl $0
  1026b6:	6a 00                	push   $0x0
  pushl $194
  1026b8:	68 c2 00 00 00       	push   $0xc2
  jmp __alltraps
  1026bd:	e9 dc 02 00 00       	jmp    10299e <__alltraps>

001026c2 <vector195>:
.globl vector195
vector195:
  pushl $0
  1026c2:	6a 00                	push   $0x0
  pushl $195
  1026c4:	68 c3 00 00 00       	push   $0xc3
  jmp __alltraps
  1026c9:	e9 d0 02 00 00       	jmp    10299e <__alltraps>

001026ce <vector196>:
.globl vector196
vector196:
  pushl $0
  1026ce:	6a 00                	push   $0x0
  pushl $196
  1026d0:	68 c4 00 00 00       	push   $0xc4
  jmp __alltraps
  1026d5:	e9 c4 02 00 00       	jmp    10299e <__alltraps>

001026da <vector197>:
.globl vector197
vector197:
  pushl $0
  1026da:	6a 00                	push   $0x0
  pushl $197
  1026dc:	68 c5 00 00 00       	push   $0xc5
  jmp __alltraps
  1026e1:	e9 b8 02 00 00       	jmp    10299e <__alltraps>

001026e6 <vector198>:
.globl vector198
vector198:
  pushl $0
  1026e6:	6a 00                	push   $0x0
  pushl $198
  1026e8:	68 c6 00 00 00       	push   $0xc6
  jmp __alltraps
  1026ed:	e9 ac 02 00 00       	jmp    10299e <__alltraps>

001026f2 <vector199>:
.globl vector199
vector199:
  pushl $0
  1026f2:	6a 00                	push   $0x0
  pushl $199
  1026f4:	68 c7 00 00 00       	push   $0xc7
  jmp __alltraps
  1026f9:	e9 a0 02 00 00       	jmp    10299e <__alltraps>

001026fe <vector200>:
.globl vector200
vector200:
  pushl $0
  1026fe:	6a 00                	push   $0x0
  pushl $200
  102700:	68 c8 00 00 00       	push   $0xc8
  jmp __alltraps
  102705:	e9 94 02 00 00       	jmp    10299e <__alltraps>

0010270a <vector201>:
.globl vector201
vector201:
  pushl $0
  10270a:	6a 00                	push   $0x0
  pushl $201
  10270c:	68 c9 00 00 00       	push   $0xc9
  jmp __alltraps
  102711:	e9 88 02 00 00       	jmp    10299e <__alltraps>

00102716 <vector202>:
.globl vector202
vector202:
  pushl $0
  102716:	6a 00                	push   $0x0
  pushl $202
  102718:	68 ca 00 00 00       	push   $0xca
  jmp __alltraps
  10271d:	e9 7c 02 00 00       	jmp    10299e <__alltraps>

00102722 <vector203>:
.globl vector203
vector203:
  pushl $0
  102722:	6a 00                	push   $0x0
  pushl $203
  102724:	68 cb 00 00 00       	push   $0xcb
  jmp __alltraps
  102729:	e9 70 02 00 00       	jmp    10299e <__alltraps>

0010272e <vector204>:
.globl vector204
vector204:
  pushl $0
  10272e:	6a 00                	push   $0x0
  pushl $204
  102730:	68 cc 00 00 00       	push   $0xcc
  jmp __alltraps
  102735:	e9 64 02 00 00       	jmp    10299e <__alltraps>

0010273a <vector205>:
.globl vector205
vector205:
  pushl $0
  10273a:	6a 00                	push   $0x0
  pushl $205
  10273c:	68 cd 00 00 00       	push   $0xcd
  jmp __alltraps
  102741:	e9 58 02 00 00       	jmp    10299e <__alltraps>

00102746 <vector206>:
.globl vector206
vector206:
  pushl $0
  102746:	6a 00                	push   $0x0
  pushl $206
  102748:	68 ce 00 00 00       	push   $0xce
  jmp __alltraps
  10274d:	e9 4c 02 00 00       	jmp    10299e <__alltraps>

00102752 <vector207>:
.globl vector207
vector207:
  pushl $0
  102752:	6a 00                	push   $0x0
  pushl $207
  102754:	68 cf 00 00 00       	push   $0xcf
  jmp __alltraps
  102759:	e9 40 02 00 00       	jmp    10299e <__alltraps>

0010275e <vector208>:
.globl vector208
vector208:
  pushl $0
  10275e:	6a 00                	push   $0x0
  pushl $208
  102760:	68 d0 00 00 00       	push   $0xd0
  jmp __alltraps
  102765:	e9 34 02 00 00       	jmp    10299e <__alltraps>

0010276a <vector209>:
.globl vector209
vector209:
  pushl $0
  10276a:	6a 00                	push   $0x0
  pushl $209
  10276c:	68 d1 00 00 00       	push   $0xd1
  jmp __alltraps
  102771:	e9 28 02 00 00       	jmp    10299e <__alltraps>

00102776 <vector210>:
.globl vector210
vector210:
  pushl $0
  102776:	6a 00                	push   $0x0
  pushl $210
  102778:	68 d2 00 00 00       	push   $0xd2
  jmp __alltraps
  10277d:	e9 1c 02 00 00       	jmp    10299e <__alltraps>

00102782 <vector211>:
.globl vector211
vector211:
  pushl $0
  102782:	6a 00                	push   $0x0
  pushl $211
  102784:	68 d3 00 00 00       	push   $0xd3
  jmp __alltraps
  102789:	e9 10 02 00 00       	jmp    10299e <__alltraps>

0010278e <vector212>:
.globl vector212
vector212:
  pushl $0
  10278e:	6a 00                	push   $0x0
  pushl $212
  102790:	68 d4 00 00 00       	push   $0xd4
  jmp __alltraps
  102795:	e9 04 02 00 00       	jmp    10299e <__alltraps>

0010279a <vector213>:
.globl vector213
vector213:
  pushl $0
  10279a:	6a 00                	push   $0x0
  pushl $213
  10279c:	68 d5 00 00 00       	push   $0xd5
  jmp __alltraps
  1027a1:	e9 f8 01 00 00       	jmp    10299e <__alltraps>

001027a6 <vector214>:
.globl vector214
vector214:
  pushl $0
  1027a6:	6a 00                	push   $0x0
  pushl $214
  1027a8:	68 d6 00 00 00       	push   $0xd6
  jmp __alltraps
  1027ad:	e9 ec 01 00 00       	jmp    10299e <__alltraps>

001027b2 <vector215>:
.globl vector215
vector215:
  pushl $0
  1027b2:	6a 00                	push   $0x0
  pushl $215
  1027b4:	68 d7 00 00 00       	push   $0xd7
  jmp __alltraps
  1027b9:	e9 e0 01 00 00       	jmp    10299e <__alltraps>

001027be <vector216>:
.globl vector216
vector216:
  pushl $0
  1027be:	6a 00                	push   $0x0
  pushl $216
  1027c0:	68 d8 00 00 00       	push   $0xd8
  jmp __alltraps
  1027c5:	e9 d4 01 00 00       	jmp    10299e <__alltraps>

001027ca <vector217>:
.globl vector217
vector217:
  pushl $0
  1027ca:	6a 00                	push   $0x0
  pushl $217
  1027cc:	68 d9 00 00 00       	push   $0xd9
  jmp __alltraps
  1027d1:	e9 c8 01 00 00       	jmp    10299e <__alltraps>

001027d6 <vector218>:
.globl vector218
vector218:
  pushl $0
  1027d6:	6a 00                	push   $0x0
  pushl $218
  1027d8:	68 da 00 00 00       	push   $0xda
  jmp __alltraps
  1027dd:	e9 bc 01 00 00       	jmp    10299e <__alltraps>

001027e2 <vector219>:
.globl vector219
vector219:
  pushl $0
  1027e2:	6a 00                	push   $0x0
  pushl $219
  1027e4:	68 db 00 00 00       	push   $0xdb
  jmp __alltraps
  1027e9:	e9 b0 01 00 00       	jmp    10299e <__alltraps>

001027ee <vector220>:
.globl vector220
vector220:
  pushl $0
  1027ee:	6a 00                	push   $0x0
  pushl $220
  1027f0:	68 dc 00 00 00       	push   $0xdc
  jmp __alltraps
  1027f5:	e9 a4 01 00 00       	jmp    10299e <__alltraps>

001027fa <vector221>:
.globl vector221
vector221:
  pushl $0
  1027fa:	6a 00                	push   $0x0
  pushl $221
  1027fc:	68 dd 00 00 00       	push   $0xdd
  jmp __alltraps
  102801:	e9 98 01 00 00       	jmp    10299e <__alltraps>

00102806 <vector222>:
.globl vector222
vector222:
  pushl $0
  102806:	6a 00                	push   $0x0
  pushl $222
  102808:	68 de 00 00 00       	push   $0xde
  jmp __alltraps
  10280d:	e9 8c 01 00 00       	jmp    10299e <__alltraps>

00102812 <vector223>:
.globl vector223
vector223:
  pushl $0
  102812:	6a 00                	push   $0x0
  pushl $223
  102814:	68 df 00 00 00       	push   $0xdf
  jmp __alltraps
  102819:	e9 80 01 00 00       	jmp    10299e <__alltraps>

0010281e <vector224>:
.globl vector224
vector224:
  pushl $0
  10281e:	6a 00                	push   $0x0
  pushl $224
  102820:	68 e0 00 00 00       	push   $0xe0
  jmp __alltraps
  102825:	e9 74 01 00 00       	jmp    10299e <__alltraps>

0010282a <vector225>:
.globl vector225
vector225:
  pushl $0
  10282a:	6a 00                	push   $0x0
  pushl $225
  10282c:	68 e1 00 00 00       	push   $0xe1
  jmp __alltraps
  102831:	e9 68 01 00 00       	jmp    10299e <__alltraps>

00102836 <vector226>:
.globl vector226
vector226:
  pushl $0
  102836:	6a 00                	push   $0x0
  pushl $226
  102838:	68 e2 00 00 00       	push   $0xe2
  jmp __alltraps
  10283d:	e9 5c 01 00 00       	jmp    10299e <__alltraps>

00102842 <vector227>:
.globl vector227
vector227:
  pushl $0
  102842:	6a 00                	push   $0x0
  pushl $227
  102844:	68 e3 00 00 00       	push   $0xe3
  jmp __alltraps
  102849:	e9 50 01 00 00       	jmp    10299e <__alltraps>

0010284e <vector228>:
.globl vector228
vector228:
  pushl $0
  10284e:	6a 00                	push   $0x0
  pushl $228
  102850:	68 e4 00 00 00       	push   $0xe4
  jmp __alltraps
  102855:	e9 44 01 00 00       	jmp    10299e <__alltraps>

0010285a <vector229>:
.globl vector229
vector229:
  pushl $0
  10285a:	6a 00                	push   $0x0
  pushl $229
  10285c:	68 e5 00 00 00       	push   $0xe5
  jmp __alltraps
  102861:	e9 38 01 00 00       	jmp    10299e <__alltraps>

00102866 <vector230>:
.globl vector230
vector230:
  pushl $0
  102866:	6a 00                	push   $0x0
  pushl $230
  102868:	68 e6 00 00 00       	push   $0xe6
  jmp __alltraps
  10286d:	e9 2c 01 00 00       	jmp    10299e <__alltraps>

00102872 <vector231>:
.globl vector231
vector231:
  pushl $0
  102872:	6a 00                	push   $0x0
  pushl $231
  102874:	68 e7 00 00 00       	push   $0xe7
  jmp __alltraps
  102879:	e9 20 01 00 00       	jmp    10299e <__alltraps>

0010287e <vector232>:
.globl vector232
vector232:
  pushl $0
  10287e:	6a 00                	push   $0x0
  pushl $232
  102880:	68 e8 00 00 00       	push   $0xe8
  jmp __alltraps
  102885:	e9 14 01 00 00       	jmp    10299e <__alltraps>

0010288a <vector233>:
.globl vector233
vector233:
  pushl $0
  10288a:	6a 00                	push   $0x0
  pushl $233
  10288c:	68 e9 00 00 00       	push   $0xe9
  jmp __alltraps
  102891:	e9 08 01 00 00       	jmp    10299e <__alltraps>

00102896 <vector234>:
.globl vector234
vector234:
  pushl $0
  102896:	6a 00                	push   $0x0
  pushl $234
  102898:	68 ea 00 00 00       	push   $0xea
  jmp __alltraps
  10289d:	e9 fc 00 00 00       	jmp    10299e <__alltraps>

001028a2 <vector235>:
.globl vector235
vector235:
  pushl $0
  1028a2:	6a 00                	push   $0x0
  pushl $235
  1028a4:	68 eb 00 00 00       	push   $0xeb
  jmp __alltraps
  1028a9:	e9 f0 00 00 00       	jmp    10299e <__alltraps>

001028ae <vector236>:
.globl vector236
vector236:
  pushl $0
  1028ae:	6a 00                	push   $0x0
  pushl $236
  1028b0:	68 ec 00 00 00       	push   $0xec
  jmp __alltraps
  1028b5:	e9 e4 00 00 00       	jmp    10299e <__alltraps>

001028ba <vector237>:
.globl vector237
vector237:
  pushl $0
  1028ba:	6a 00                	push   $0x0
  pushl $237
  1028bc:	68 ed 00 00 00       	push   $0xed
  jmp __alltraps
  1028c1:	e9 d8 00 00 00       	jmp    10299e <__alltraps>

001028c6 <vector238>:
.globl vector238
vector238:
  pushl $0
  1028c6:	6a 00                	push   $0x0
  pushl $238
  1028c8:	68 ee 00 00 00       	push   $0xee
  jmp __alltraps
  1028cd:	e9 cc 00 00 00       	jmp    10299e <__alltraps>

001028d2 <vector239>:
.globl vector239
vector239:
  pushl $0
  1028d2:	6a 00                	push   $0x0
  pushl $239
  1028d4:	68 ef 00 00 00       	push   $0xef
  jmp __alltraps
  1028d9:	e9 c0 00 00 00       	jmp    10299e <__alltraps>

001028de <vector240>:
.globl vector240
vector240:
  pushl $0
  1028de:	6a 00                	push   $0x0
  pushl $240
  1028e0:	68 f0 00 00 00       	push   $0xf0
  jmp __alltraps
  1028e5:	e9 b4 00 00 00       	jmp    10299e <__alltraps>

001028ea <vector241>:
.globl vector241
vector241:
  pushl $0
  1028ea:	6a 00                	push   $0x0
  pushl $241
  1028ec:	68 f1 00 00 00       	push   $0xf1
  jmp __alltraps
  1028f1:	e9 a8 00 00 00       	jmp    10299e <__alltraps>

001028f6 <vector242>:
.globl vector242
vector242:
  pushl $0
  1028f6:	6a 00                	push   $0x0
  pushl $242
  1028f8:	68 f2 00 00 00       	push   $0xf2
  jmp __alltraps
  1028fd:	e9 9c 00 00 00       	jmp    10299e <__alltraps>

00102902 <vector243>:
.globl vector243
vector243:
  pushl $0
  102902:	6a 00                	push   $0x0
  pushl $243
  102904:	68 f3 00 00 00       	push   $0xf3
  jmp __alltraps
  102909:	e9 90 00 00 00       	jmp    10299e <__alltraps>

0010290e <vector244>:
.globl vector244
vector244:
  pushl $0
  10290e:	6a 00                	push   $0x0
  pushl $244
  102910:	68 f4 00 00 00       	push   $0xf4
  jmp __alltraps
  102915:	e9 84 00 00 00       	jmp    10299e <__alltraps>

0010291a <vector245>:
.globl vector245
vector245:
  pushl $0
  10291a:	6a 00                	push   $0x0
  pushl $245
  10291c:	68 f5 00 00 00       	push   $0xf5
  jmp __alltraps
  102921:	e9 78 00 00 00       	jmp    10299e <__alltraps>

00102926 <vector246>:
.globl vector246
vector246:
  pushl $0
  102926:	6a 00                	push   $0x0
  pushl $246
  102928:	68 f6 00 00 00       	push   $0xf6
  jmp __alltraps
  10292d:	e9 6c 00 00 00       	jmp    10299e <__alltraps>

00102932 <vector247>:
.globl vector247
vector247:
  pushl $0
  102932:	6a 00                	push   $0x0
  pushl $247
  102934:	68 f7 00 00 00       	push   $0xf7
  jmp __alltraps
  102939:	e9 60 00 00 00       	jmp    10299e <__alltraps>

0010293e <vector248>:
.globl vector248
vector248:
  pushl $0
  10293e:	6a 00                	push   $0x0
  pushl $248
  102940:	68 f8 00 00 00       	push   $0xf8
  jmp __alltraps
  102945:	e9 54 00 00 00       	jmp    10299e <__alltraps>

0010294a <vector249>:
.globl vector249
vector249:
  pushl $0
  10294a:	6a 00                	push   $0x0
  pushl $249
  10294c:	68 f9 00 00 00       	push   $0xf9
  jmp __alltraps
  102951:	e9 48 00 00 00       	jmp    10299e <__alltraps>

00102956 <vector250>:
.globl vector250
vector250:
  pushl $0
  102956:	6a 00                	push   $0x0
  pushl $250
  102958:	68 fa 00 00 00       	push   $0xfa
  jmp __alltraps
  10295d:	e9 3c 00 00 00       	jmp    10299e <__alltraps>

00102962 <vector251>:
.globl vector251
vector251:
  pushl $0
  102962:	6a 00                	push   $0x0
  pushl $251
  102964:	68 fb 00 00 00       	push   $0xfb
  jmp __alltraps
  102969:	e9 30 00 00 00       	jmp    10299e <__alltraps>

0010296e <vector252>:
.globl vector252
vector252:
  pushl $0
  10296e:	6a 00                	push   $0x0
  pushl $252
  102970:	68 fc 00 00 00       	push   $0xfc
  jmp __alltraps
  102975:	e9 24 00 00 00       	jmp    10299e <__alltraps>

0010297a <vector253>:
.globl vector253
vector253:
  pushl $0
  10297a:	6a 00                	push   $0x0
  pushl $253
  10297c:	68 fd 00 00 00       	push   $0xfd
  jmp __alltraps
  102981:	e9 18 00 00 00       	jmp    10299e <__alltraps>

00102986 <vector254>:
.globl vector254
vector254:
  pushl $0
  102986:	6a 00                	push   $0x0
  pushl $254
  102988:	68 fe 00 00 00       	push   $0xfe
  jmp __alltraps
  10298d:	e9 0c 00 00 00       	jmp    10299e <__alltraps>

00102992 <vector255>:
.globl vector255
vector255:
  pushl $0
  102992:	6a 00                	push   $0x0
  pushl $255
  102994:	68 ff 00 00 00       	push   $0xff
  jmp __alltraps
  102999:	e9 00 00 00 00       	jmp    10299e <__alltraps>

0010299e <__alltraps>:
.text
.globl __alltraps
__alltraps:
    # push registers to build a trap frame
    # therefore make the stack look like a struct trapframe
    pushl %ds
  10299e:	1e                   	push   %ds
    pushl %es
  10299f:	06                   	push   %es
    pushl %fs
  1029a0:	0f a0                	push   %fs
    pushl %gs
  1029a2:	0f a8                	push   %gs
    pushal
  1029a4:	60                   	pusha  

    # load GD_KDATA into %ds and %es to set up data segments for kernel
    movl $GD_KDATA, %eax
  1029a5:	b8 10 00 00 00       	mov    $0x10,%eax
    movw %ax, %ds
  1029aa:	8e d8                	mov    %eax,%ds
    movw %ax, %es
  1029ac:	8e c0                	mov    %eax,%es

    # push %esp to pass a pointer to the trapframe as an argument to trap()
    pushl %esp
  1029ae:	54                   	push   %esp

    # call trap(tf), where tf=%esp
    call trap
  1029af:	e8 64 f5 ff ff       	call   101f18 <trap>

    # pop the pushed stack pointer
    popl %esp
  1029b4:	5c                   	pop    %esp

001029b5 <__trapret>:

    # return falls through to trapret...
.globl __trapret
__trapret:
    # restore registers from stack
    popal
  1029b5:	61                   	popa   

    # restore %ds, %es, %fs and %gs
    popl %gs
  1029b6:	0f a9                	pop    %gs
    popl %fs
  1029b8:	0f a1                	pop    %fs
    popl %es
  1029ba:	07                   	pop    %es
    popl %ds
  1029bb:	1f                   	pop    %ds

    # get rid of the trap number and error code
    addl $0x8, %esp
  1029bc:	83 c4 08             	add    $0x8,%esp
    iret
  1029bf:	cf                   	iret   

001029c0 <lgdt>:
/* *
 * lgdt - load the global descriptor table register and reset the
 * data/code segement registers for kernel.
 * */
static inline void
lgdt(struct pseudodesc *pd) {
  1029c0:	55                   	push   %ebp
  1029c1:	89 e5                	mov    %esp,%ebp
    asm volatile ("lgdt (%0)" :: "r" (pd));
  1029c3:	8b 45 08             	mov    0x8(%ebp),%eax
  1029c6:	0f 01 10             	lgdtl  (%eax)
    asm volatile ("movw %%ax, %%gs" :: "a" (USER_DS));
  1029c9:	b8 23 00 00 00       	mov    $0x23,%eax
  1029ce:	8e e8                	mov    %eax,%gs
    asm volatile ("movw %%ax, %%fs" :: "a" (USER_DS));
  1029d0:	b8 23 00 00 00       	mov    $0x23,%eax
  1029d5:	8e e0                	mov    %eax,%fs
    asm volatile ("movw %%ax, %%es" :: "a" (KERNEL_DS));
  1029d7:	b8 10 00 00 00       	mov    $0x10,%eax
  1029dc:	8e c0                	mov    %eax,%es
    asm volatile ("movw %%ax, %%ds" :: "a" (KERNEL_DS));
  1029de:	b8 10 00 00 00       	mov    $0x10,%eax
  1029e3:	8e d8                	mov    %eax,%ds
    asm volatile ("movw %%ax, %%ss" :: "a" (KERNEL_DS));
  1029e5:	b8 10 00 00 00       	mov    $0x10,%eax
  1029ea:	8e d0                	mov    %eax,%ss
    // reload cs
    asm volatile ("ljmp %0, $1f\n 1:\n" :: "i" (KERNEL_CS));
  1029ec:	ea f3 29 10 00 08 00 	ljmp   $0x8,$0x1029f3
}
  1029f3:	90                   	nop
  1029f4:	5d                   	pop    %ebp
  1029f5:	c3                   	ret    

001029f6 <gdt_init>:
/* temporary kernel stack */
uint8_t stack0[1024];

/* gdt_init - initialize the default GDT and TSS */
static void
gdt_init(void) {
  1029f6:	55                   	push   %ebp
  1029f7:	89 e5                	mov    %esp,%ebp
  1029f9:	83 ec 14             	sub    $0x14,%esp
    // Setup a TSS so that we can get the right stack when we trap from
    // user to the kernel. But not safe here, it's only a temporary value,
    // it will be set to KSTACKTOP in lab2.
    ts.ts_esp0 = (uint32_t)&stack0 + sizeof(stack0);
  1029fc:	b8 20 f9 10 00       	mov    $0x10f920,%eax
  102a01:	05 00 04 00 00       	add    $0x400,%eax
  102a06:	a3 a4 f8 10 00       	mov    %eax,0x10f8a4
    ts.ts_ss0 = KERNEL_DS;
  102a0b:	66 c7 05 a8 f8 10 00 	movw   $0x10,0x10f8a8
  102a12:	10 00 

    // initialize the TSS filed of the gdt
    gdt[SEG_TSS] = SEG16(STS_T32A, (uint32_t)&ts, sizeof(ts), DPL_KERNEL);
  102a14:	66 c7 05 08 ea 10 00 	movw   $0x68,0x10ea08
  102a1b:	68 00 
  102a1d:	b8 a0 f8 10 00       	mov    $0x10f8a0,%eax
  102a22:	0f b7 c0             	movzwl %ax,%eax
  102a25:	66 a3 0a ea 10 00    	mov    %ax,0x10ea0a
  102a2b:	b8 a0 f8 10 00       	mov    $0x10f8a0,%eax
  102a30:	c1 e8 10             	shr    $0x10,%eax
  102a33:	a2 0c ea 10 00       	mov    %al,0x10ea0c
  102a38:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  102a3f:	24 f0                	and    $0xf0,%al
  102a41:	0c 09                	or     $0x9,%al
  102a43:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  102a48:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  102a4f:	0c 10                	or     $0x10,%al
  102a51:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  102a56:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  102a5d:	24 9f                	and    $0x9f,%al
  102a5f:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  102a64:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  102a6b:	0c 80                	or     $0x80,%al
  102a6d:	a2 0d ea 10 00       	mov    %al,0x10ea0d
  102a72:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  102a79:	24 f0                	and    $0xf0,%al
  102a7b:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  102a80:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  102a87:	24 ef                	and    $0xef,%al
  102a89:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  102a8e:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  102a95:	24 df                	and    $0xdf,%al
  102a97:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  102a9c:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  102aa3:	0c 40                	or     $0x40,%al
  102aa5:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  102aaa:	0f b6 05 0e ea 10 00 	movzbl 0x10ea0e,%eax
  102ab1:	24 7f                	and    $0x7f,%al
  102ab3:	a2 0e ea 10 00       	mov    %al,0x10ea0e
  102ab8:	b8 a0 f8 10 00       	mov    $0x10f8a0,%eax
  102abd:	c1 e8 18             	shr    $0x18,%eax
  102ac0:	a2 0f ea 10 00       	mov    %al,0x10ea0f
    gdt[SEG_TSS].sd_s = 0;
  102ac5:	0f b6 05 0d ea 10 00 	movzbl 0x10ea0d,%eax
  102acc:	24 ef                	and    $0xef,%al
  102ace:	a2 0d ea 10 00       	mov    %al,0x10ea0d

    // reload all segment registers
    lgdt(&gdt_pd);
  102ad3:	c7 04 24 10 ea 10 00 	movl   $0x10ea10,(%esp)
  102ada:	e8 e1 fe ff ff       	call   1029c0 <lgdt>
  102adf:	66 c7 45 fe 28 00    	movw   $0x28,-0x2(%ebp)
    asm volatile ("cli");
}

static inline void
ltr(uint16_t sel) {
    asm volatile ("ltr %0" :: "r" (sel));
  102ae5:	0f b7 45 fe          	movzwl -0x2(%ebp),%eax
  102ae9:	0f 00 d8             	ltr    %ax

    // load the TSS
    ltr(GD_TSS);
}
  102aec:	90                   	nop
  102aed:	c9                   	leave  
  102aee:	c3                   	ret    

00102aef <pmm_init>:

/* pmm_init - initialize the physical memory management */
void
pmm_init(void) {
  102aef:	55                   	push   %ebp
  102af0:	89 e5                	mov    %esp,%ebp
    gdt_init();
  102af2:	e8 ff fe ff ff       	call   1029f6 <gdt_init>
}
  102af7:	90                   	nop
  102af8:	5d                   	pop    %ebp
  102af9:	c3                   	ret    

00102afa <strlen>:
 * @s:        the input string
 *
 * The strlen() function returns the length of string @s.
 * */
size_t
strlen(const char *s) {
  102afa:	55                   	push   %ebp
  102afb:	89 e5                	mov    %esp,%ebp
  102afd:	83 ec 10             	sub    $0x10,%esp
    size_t cnt = 0;
  102b00:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    while (*s ++ != '\0') {
  102b07:	eb 03                	jmp    102b0c <strlen+0x12>
        cnt ++;
  102b09:	ff 45 fc             	incl   -0x4(%ebp)
 * The strlen() function returns the length of string @s.
 * */
size_t
strlen(const char *s) {
    size_t cnt = 0;
    while (*s ++ != '\0') {
  102b0c:	8b 45 08             	mov    0x8(%ebp),%eax
  102b0f:	8d 50 01             	lea    0x1(%eax),%edx
  102b12:	89 55 08             	mov    %edx,0x8(%ebp)
  102b15:	0f b6 00             	movzbl (%eax),%eax
  102b18:	84 c0                	test   %al,%al
  102b1a:	75 ed                	jne    102b09 <strlen+0xf>
        cnt ++;
    }
    return cnt;
  102b1c:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  102b1f:	c9                   	leave  
  102b20:	c3                   	ret    

00102b21 <strnlen>:
 * The return value is strlen(s), if that is less than @len, or
 * @len if there is no '\0' character among the first @len characters
 * pointed by @s.
 * */
size_t
strnlen(const char *s, size_t len) {
  102b21:	55                   	push   %ebp
  102b22:	89 e5                	mov    %esp,%ebp
  102b24:	83 ec 10             	sub    $0x10,%esp
    size_t cnt = 0;
  102b27:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    while (cnt < len && *s ++ != '\0') {
  102b2e:	eb 03                	jmp    102b33 <strnlen+0x12>
        cnt ++;
  102b30:	ff 45 fc             	incl   -0x4(%ebp)
 * pointed by @s.
 * */
size_t
strnlen(const char *s, size_t len) {
    size_t cnt = 0;
    while (cnt < len && *s ++ != '\0') {
  102b33:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102b36:	3b 45 0c             	cmp    0xc(%ebp),%eax
  102b39:	73 10                	jae    102b4b <strnlen+0x2a>
  102b3b:	8b 45 08             	mov    0x8(%ebp),%eax
  102b3e:	8d 50 01             	lea    0x1(%eax),%edx
  102b41:	89 55 08             	mov    %edx,0x8(%ebp)
  102b44:	0f b6 00             	movzbl (%eax),%eax
  102b47:	84 c0                	test   %al,%al
  102b49:	75 e5                	jne    102b30 <strnlen+0xf>
        cnt ++;
    }
    return cnt;
  102b4b:	8b 45 fc             	mov    -0x4(%ebp),%eax
}
  102b4e:	c9                   	leave  
  102b4f:	c3                   	ret    

00102b50 <strcpy>:
 * To avoid overflows, the size of array pointed by @dst should be long enough to
 * contain the same string as @src (including the terminating null character), and
 * should not overlap in memory with @src.
 * */
char *
strcpy(char *dst, const char *src) {
  102b50:	55                   	push   %ebp
  102b51:	89 e5                	mov    %esp,%ebp
  102b53:	57                   	push   %edi
  102b54:	56                   	push   %esi
  102b55:	83 ec 20             	sub    $0x20,%esp
  102b58:	8b 45 08             	mov    0x8(%ebp),%eax
  102b5b:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102b5e:	8b 45 0c             	mov    0xc(%ebp),%eax
  102b61:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_STRCPY
#define __HAVE_ARCH_STRCPY
static inline char *
__strcpy(char *dst, const char *src) {
    int d0, d1, d2;
    asm volatile (
  102b64:	8b 55 f0             	mov    -0x10(%ebp),%edx
  102b67:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102b6a:	89 d1                	mov    %edx,%ecx
  102b6c:	89 c2                	mov    %eax,%edx
  102b6e:	89 ce                	mov    %ecx,%esi
  102b70:	89 d7                	mov    %edx,%edi
  102b72:	ac                   	lods   %ds:(%esi),%al
  102b73:	aa                   	stos   %al,%es:(%edi)
  102b74:	84 c0                	test   %al,%al
  102b76:	75 fa                	jne    102b72 <strcpy+0x22>
  102b78:	89 fa                	mov    %edi,%edx
  102b7a:	89 f1                	mov    %esi,%ecx
  102b7c:	89 4d ec             	mov    %ecx,-0x14(%ebp)
  102b7f:	89 55 e8             	mov    %edx,-0x18(%ebp)
  102b82:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            "stosb;"
            "testb %%al, %%al;"
            "jne 1b;"
            : "=&S" (d0), "=&D" (d1), "=&a" (d2)
            : "0" (src), "1" (dst) : "memory");
    return dst;
  102b85:	8b 45 f4             	mov    -0xc(%ebp),%eax
#ifdef __HAVE_ARCH_STRCPY
    return __strcpy(dst, src);
  102b88:	90                   	nop
    char *p = dst;
    while ((*p ++ = *src ++) != '\0')
        /* nothing */;
    return dst;
#endif /* __HAVE_ARCH_STRCPY */
}
  102b89:	83 c4 20             	add    $0x20,%esp
  102b8c:	5e                   	pop    %esi
  102b8d:	5f                   	pop    %edi
  102b8e:	5d                   	pop    %ebp
  102b8f:	c3                   	ret    

00102b90 <strncpy>:
 * @len:    maximum number of characters to be copied from @src
 *
 * The return value is @dst
 * */
char *
strncpy(char *dst, const char *src, size_t len) {
  102b90:	55                   	push   %ebp
  102b91:	89 e5                	mov    %esp,%ebp
  102b93:	83 ec 10             	sub    $0x10,%esp
    char *p = dst;
  102b96:	8b 45 08             	mov    0x8(%ebp),%eax
  102b99:	89 45 fc             	mov    %eax,-0x4(%ebp)
    while (len > 0) {
  102b9c:	eb 1e                	jmp    102bbc <strncpy+0x2c>
        if ((*p = *src) != '\0') {
  102b9e:	8b 45 0c             	mov    0xc(%ebp),%eax
  102ba1:	0f b6 10             	movzbl (%eax),%edx
  102ba4:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102ba7:	88 10                	mov    %dl,(%eax)
  102ba9:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102bac:	0f b6 00             	movzbl (%eax),%eax
  102baf:	84 c0                	test   %al,%al
  102bb1:	74 03                	je     102bb6 <strncpy+0x26>
            src ++;
  102bb3:	ff 45 0c             	incl   0xc(%ebp)
        }
        p ++, len --;
  102bb6:	ff 45 fc             	incl   -0x4(%ebp)
  102bb9:	ff 4d 10             	decl   0x10(%ebp)
 * The return value is @dst
 * */
char *
strncpy(char *dst, const char *src, size_t len) {
    char *p = dst;
    while (len > 0) {
  102bbc:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102bc0:	75 dc                	jne    102b9e <strncpy+0xe>
        if ((*p = *src) != '\0') {
            src ++;
        }
        p ++, len --;
    }
    return dst;
  102bc2:	8b 45 08             	mov    0x8(%ebp),%eax
}
  102bc5:	c9                   	leave  
  102bc6:	c3                   	ret    

00102bc7 <strcmp>:
 * - A value greater than zero indicates that the first character that does
 *   not match has a greater value in @s1 than in @s2;
 * - And a value less than zero indicates the opposite.
 * */
int
strcmp(const char *s1, const char *s2) {
  102bc7:	55                   	push   %ebp
  102bc8:	89 e5                	mov    %esp,%ebp
  102bca:	57                   	push   %edi
  102bcb:	56                   	push   %esi
  102bcc:	83 ec 20             	sub    $0x20,%esp
  102bcf:	8b 45 08             	mov    0x8(%ebp),%eax
  102bd2:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102bd5:	8b 45 0c             	mov    0xc(%ebp),%eax
  102bd8:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_STRCMP
#define __HAVE_ARCH_STRCMP
static inline int
__strcmp(const char *s1, const char *s2) {
    int d0, d1, ret;
    asm volatile (
  102bdb:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102bde:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102be1:	89 d1                	mov    %edx,%ecx
  102be3:	89 c2                	mov    %eax,%edx
  102be5:	89 ce                	mov    %ecx,%esi
  102be7:	89 d7                	mov    %edx,%edi
  102be9:	ac                   	lods   %ds:(%esi),%al
  102bea:	ae                   	scas   %es:(%edi),%al
  102beb:	75 08                	jne    102bf5 <strcmp+0x2e>
  102bed:	84 c0                	test   %al,%al
  102bef:	75 f8                	jne    102be9 <strcmp+0x22>
  102bf1:	31 c0                	xor    %eax,%eax
  102bf3:	eb 04                	jmp    102bf9 <strcmp+0x32>
  102bf5:	19 c0                	sbb    %eax,%eax
  102bf7:	0c 01                	or     $0x1,%al
  102bf9:	89 fa                	mov    %edi,%edx
  102bfb:	89 f1                	mov    %esi,%ecx
  102bfd:	89 45 ec             	mov    %eax,-0x14(%ebp)
  102c00:	89 4d e8             	mov    %ecx,-0x18(%ebp)
  102c03:	89 55 e4             	mov    %edx,-0x1c(%ebp)
            "orb $1, %%al;"
            "3:"
            : "=a" (ret), "=&S" (d0), "=&D" (d1)
            : "1" (s1), "2" (s2)
            : "memory");
    return ret;
  102c06:	8b 45 ec             	mov    -0x14(%ebp),%eax
#ifdef __HAVE_ARCH_STRCMP
    return __strcmp(s1, s2);
  102c09:	90                   	nop
    while (*s1 != '\0' && *s1 == *s2) {
        s1 ++, s2 ++;
    }
    return (int)((unsigned char)*s1 - (unsigned char)*s2);
#endif /* __HAVE_ARCH_STRCMP */
}
  102c0a:	83 c4 20             	add    $0x20,%esp
  102c0d:	5e                   	pop    %esi
  102c0e:	5f                   	pop    %edi
  102c0f:	5d                   	pop    %ebp
  102c10:	c3                   	ret    

00102c11 <strncmp>:
 * they are equal to each other, it continues with the following pairs until
 * the characters differ, until a terminating null-character is reached, or
 * until @n characters match in both strings, whichever happens first.
 * */
int
strncmp(const char *s1, const char *s2, size_t n) {
  102c11:	55                   	push   %ebp
  102c12:	89 e5                	mov    %esp,%ebp
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
  102c14:	eb 09                	jmp    102c1f <strncmp+0xe>
        n --, s1 ++, s2 ++;
  102c16:	ff 4d 10             	decl   0x10(%ebp)
  102c19:	ff 45 08             	incl   0x8(%ebp)
  102c1c:	ff 45 0c             	incl   0xc(%ebp)
 * the characters differ, until a terminating null-character is reached, or
 * until @n characters match in both strings, whichever happens first.
 * */
int
strncmp(const char *s1, const char *s2, size_t n) {
    while (n > 0 && *s1 != '\0' && *s1 == *s2) {
  102c1f:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102c23:	74 1a                	je     102c3f <strncmp+0x2e>
  102c25:	8b 45 08             	mov    0x8(%ebp),%eax
  102c28:	0f b6 00             	movzbl (%eax),%eax
  102c2b:	84 c0                	test   %al,%al
  102c2d:	74 10                	je     102c3f <strncmp+0x2e>
  102c2f:	8b 45 08             	mov    0x8(%ebp),%eax
  102c32:	0f b6 10             	movzbl (%eax),%edx
  102c35:	8b 45 0c             	mov    0xc(%ebp),%eax
  102c38:	0f b6 00             	movzbl (%eax),%eax
  102c3b:	38 c2                	cmp    %al,%dl
  102c3d:	74 d7                	je     102c16 <strncmp+0x5>
        n --, s1 ++, s2 ++;
    }
    return (n == 0) ? 0 : (int)((unsigned char)*s1 - (unsigned char)*s2);
  102c3f:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102c43:	74 18                	je     102c5d <strncmp+0x4c>
  102c45:	8b 45 08             	mov    0x8(%ebp),%eax
  102c48:	0f b6 00             	movzbl (%eax),%eax
  102c4b:	0f b6 d0             	movzbl %al,%edx
  102c4e:	8b 45 0c             	mov    0xc(%ebp),%eax
  102c51:	0f b6 00             	movzbl (%eax),%eax
  102c54:	0f b6 c0             	movzbl %al,%eax
  102c57:	29 c2                	sub    %eax,%edx
  102c59:	89 d0                	mov    %edx,%eax
  102c5b:	eb 05                	jmp    102c62 <strncmp+0x51>
  102c5d:	b8 00 00 00 00       	mov    $0x0,%eax
}
  102c62:	5d                   	pop    %ebp
  102c63:	c3                   	ret    

00102c64 <strchr>:
 *
 * The strchr() function returns a pointer to the first occurrence of
 * character in @s. If the value is not found, the function returns 'NULL'.
 * */
char *
strchr(const char *s, char c) {
  102c64:	55                   	push   %ebp
  102c65:	89 e5                	mov    %esp,%ebp
  102c67:	83 ec 04             	sub    $0x4,%esp
  102c6a:	8b 45 0c             	mov    0xc(%ebp),%eax
  102c6d:	88 45 fc             	mov    %al,-0x4(%ebp)
    while (*s != '\0') {
  102c70:	eb 13                	jmp    102c85 <strchr+0x21>
        if (*s == c) {
  102c72:	8b 45 08             	mov    0x8(%ebp),%eax
  102c75:	0f b6 00             	movzbl (%eax),%eax
  102c78:	3a 45 fc             	cmp    -0x4(%ebp),%al
  102c7b:	75 05                	jne    102c82 <strchr+0x1e>
            return (char *)s;
  102c7d:	8b 45 08             	mov    0x8(%ebp),%eax
  102c80:	eb 12                	jmp    102c94 <strchr+0x30>
        }
        s ++;
  102c82:	ff 45 08             	incl   0x8(%ebp)
 * The strchr() function returns a pointer to the first occurrence of
 * character in @s. If the value is not found, the function returns 'NULL'.
 * */
char *
strchr(const char *s, char c) {
    while (*s != '\0') {
  102c85:	8b 45 08             	mov    0x8(%ebp),%eax
  102c88:	0f b6 00             	movzbl (%eax),%eax
  102c8b:	84 c0                	test   %al,%al
  102c8d:	75 e3                	jne    102c72 <strchr+0xe>
        if (*s == c) {
            return (char *)s;
        }
        s ++;
    }
    return NULL;
  102c8f:	b8 00 00 00 00       	mov    $0x0,%eax
}
  102c94:	c9                   	leave  
  102c95:	c3                   	ret    

00102c96 <strfind>:
 * The strfind() function is like strchr() except that if @c is
 * not found in @s, then it returns a pointer to the null byte at the
 * end of @s, rather than 'NULL'.
 * */
char *
strfind(const char *s, char c) {
  102c96:	55                   	push   %ebp
  102c97:	89 e5                	mov    %esp,%ebp
  102c99:	83 ec 04             	sub    $0x4,%esp
  102c9c:	8b 45 0c             	mov    0xc(%ebp),%eax
  102c9f:	88 45 fc             	mov    %al,-0x4(%ebp)
    while (*s != '\0') {
  102ca2:	eb 0e                	jmp    102cb2 <strfind+0x1c>
        if (*s == c) {
  102ca4:	8b 45 08             	mov    0x8(%ebp),%eax
  102ca7:	0f b6 00             	movzbl (%eax),%eax
  102caa:	3a 45 fc             	cmp    -0x4(%ebp),%al
  102cad:	74 0f                	je     102cbe <strfind+0x28>
            break;
        }
        s ++;
  102caf:	ff 45 08             	incl   0x8(%ebp)
 * not found in @s, then it returns a pointer to the null byte at the
 * end of @s, rather than 'NULL'.
 * */
char *
strfind(const char *s, char c) {
    while (*s != '\0') {
  102cb2:	8b 45 08             	mov    0x8(%ebp),%eax
  102cb5:	0f b6 00             	movzbl (%eax),%eax
  102cb8:	84 c0                	test   %al,%al
  102cba:	75 e8                	jne    102ca4 <strfind+0xe>
  102cbc:	eb 01                	jmp    102cbf <strfind+0x29>
        if (*s == c) {
            break;
  102cbe:	90                   	nop
        }
        s ++;
    }
    return (char *)s;
  102cbf:	8b 45 08             	mov    0x8(%ebp),%eax
}
  102cc2:	c9                   	leave  
  102cc3:	c3                   	ret    

00102cc4 <strtol>:
 * an optional "0x" or "0X" prefix.
 *
 * The strtol() function returns the converted integral number as a long int value.
 * */
long
strtol(const char *s, char **endptr, int base) {
  102cc4:	55                   	push   %ebp
  102cc5:	89 e5                	mov    %esp,%ebp
  102cc7:	83 ec 10             	sub    $0x10,%esp
    int neg = 0;
  102cca:	c7 45 fc 00 00 00 00 	movl   $0x0,-0x4(%ebp)
    long val = 0;
  102cd1:	c7 45 f8 00 00 00 00 	movl   $0x0,-0x8(%ebp)

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t') {
  102cd8:	eb 03                	jmp    102cdd <strtol+0x19>
        s ++;
  102cda:	ff 45 08             	incl   0x8(%ebp)
strtol(const char *s, char **endptr, int base) {
    int neg = 0;
    long val = 0;

    // gobble initial whitespace
    while (*s == ' ' || *s == '\t') {
  102cdd:	8b 45 08             	mov    0x8(%ebp),%eax
  102ce0:	0f b6 00             	movzbl (%eax),%eax
  102ce3:	3c 20                	cmp    $0x20,%al
  102ce5:	74 f3                	je     102cda <strtol+0x16>
  102ce7:	8b 45 08             	mov    0x8(%ebp),%eax
  102cea:	0f b6 00             	movzbl (%eax),%eax
  102ced:	3c 09                	cmp    $0x9,%al
  102cef:	74 e9                	je     102cda <strtol+0x16>
        s ++;
    }

    // plus/minus sign
    if (*s == '+') {
  102cf1:	8b 45 08             	mov    0x8(%ebp),%eax
  102cf4:	0f b6 00             	movzbl (%eax),%eax
  102cf7:	3c 2b                	cmp    $0x2b,%al
  102cf9:	75 05                	jne    102d00 <strtol+0x3c>
        s ++;
  102cfb:	ff 45 08             	incl   0x8(%ebp)
  102cfe:	eb 14                	jmp    102d14 <strtol+0x50>
    }
    else if (*s == '-') {
  102d00:	8b 45 08             	mov    0x8(%ebp),%eax
  102d03:	0f b6 00             	movzbl (%eax),%eax
  102d06:	3c 2d                	cmp    $0x2d,%al
  102d08:	75 0a                	jne    102d14 <strtol+0x50>
        s ++, neg = 1;
  102d0a:	ff 45 08             	incl   0x8(%ebp)
  102d0d:	c7 45 fc 01 00 00 00 	movl   $0x1,-0x4(%ebp)
    }

    // hex or octal base prefix
    if ((base == 0 || base == 16) && (s[0] == '0' && s[1] == 'x')) {
  102d14:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102d18:	74 06                	je     102d20 <strtol+0x5c>
  102d1a:	83 7d 10 10          	cmpl   $0x10,0x10(%ebp)
  102d1e:	75 22                	jne    102d42 <strtol+0x7e>
  102d20:	8b 45 08             	mov    0x8(%ebp),%eax
  102d23:	0f b6 00             	movzbl (%eax),%eax
  102d26:	3c 30                	cmp    $0x30,%al
  102d28:	75 18                	jne    102d42 <strtol+0x7e>
  102d2a:	8b 45 08             	mov    0x8(%ebp),%eax
  102d2d:	40                   	inc    %eax
  102d2e:	0f b6 00             	movzbl (%eax),%eax
  102d31:	3c 78                	cmp    $0x78,%al
  102d33:	75 0d                	jne    102d42 <strtol+0x7e>
        s += 2, base = 16;
  102d35:	83 45 08 02          	addl   $0x2,0x8(%ebp)
  102d39:	c7 45 10 10 00 00 00 	movl   $0x10,0x10(%ebp)
  102d40:	eb 29                	jmp    102d6b <strtol+0xa7>
    }
    else if (base == 0 && s[0] == '0') {
  102d42:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102d46:	75 16                	jne    102d5e <strtol+0x9a>
  102d48:	8b 45 08             	mov    0x8(%ebp),%eax
  102d4b:	0f b6 00             	movzbl (%eax),%eax
  102d4e:	3c 30                	cmp    $0x30,%al
  102d50:	75 0c                	jne    102d5e <strtol+0x9a>
        s ++, base = 8;
  102d52:	ff 45 08             	incl   0x8(%ebp)
  102d55:	c7 45 10 08 00 00 00 	movl   $0x8,0x10(%ebp)
  102d5c:	eb 0d                	jmp    102d6b <strtol+0xa7>
    }
    else if (base == 0) {
  102d5e:	83 7d 10 00          	cmpl   $0x0,0x10(%ebp)
  102d62:	75 07                	jne    102d6b <strtol+0xa7>
        base = 10;
  102d64:	c7 45 10 0a 00 00 00 	movl   $0xa,0x10(%ebp)

    // digits
    while (1) {
        int dig;

        if (*s >= '0' && *s <= '9') {
  102d6b:	8b 45 08             	mov    0x8(%ebp),%eax
  102d6e:	0f b6 00             	movzbl (%eax),%eax
  102d71:	3c 2f                	cmp    $0x2f,%al
  102d73:	7e 1b                	jle    102d90 <strtol+0xcc>
  102d75:	8b 45 08             	mov    0x8(%ebp),%eax
  102d78:	0f b6 00             	movzbl (%eax),%eax
  102d7b:	3c 39                	cmp    $0x39,%al
  102d7d:	7f 11                	jg     102d90 <strtol+0xcc>
            dig = *s - '0';
  102d7f:	8b 45 08             	mov    0x8(%ebp),%eax
  102d82:	0f b6 00             	movzbl (%eax),%eax
  102d85:	0f be c0             	movsbl %al,%eax
  102d88:	83 e8 30             	sub    $0x30,%eax
  102d8b:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102d8e:	eb 48                	jmp    102dd8 <strtol+0x114>
        }
        else if (*s >= 'a' && *s <= 'z') {
  102d90:	8b 45 08             	mov    0x8(%ebp),%eax
  102d93:	0f b6 00             	movzbl (%eax),%eax
  102d96:	3c 60                	cmp    $0x60,%al
  102d98:	7e 1b                	jle    102db5 <strtol+0xf1>
  102d9a:	8b 45 08             	mov    0x8(%ebp),%eax
  102d9d:	0f b6 00             	movzbl (%eax),%eax
  102da0:	3c 7a                	cmp    $0x7a,%al
  102da2:	7f 11                	jg     102db5 <strtol+0xf1>
            dig = *s - 'a' + 10;
  102da4:	8b 45 08             	mov    0x8(%ebp),%eax
  102da7:	0f b6 00             	movzbl (%eax),%eax
  102daa:	0f be c0             	movsbl %al,%eax
  102dad:	83 e8 57             	sub    $0x57,%eax
  102db0:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102db3:	eb 23                	jmp    102dd8 <strtol+0x114>
        }
        else if (*s >= 'A' && *s <= 'Z') {
  102db5:	8b 45 08             	mov    0x8(%ebp),%eax
  102db8:	0f b6 00             	movzbl (%eax),%eax
  102dbb:	3c 40                	cmp    $0x40,%al
  102dbd:	7e 3b                	jle    102dfa <strtol+0x136>
  102dbf:	8b 45 08             	mov    0x8(%ebp),%eax
  102dc2:	0f b6 00             	movzbl (%eax),%eax
  102dc5:	3c 5a                	cmp    $0x5a,%al
  102dc7:	7f 31                	jg     102dfa <strtol+0x136>
            dig = *s - 'A' + 10;
  102dc9:	8b 45 08             	mov    0x8(%ebp),%eax
  102dcc:	0f b6 00             	movzbl (%eax),%eax
  102dcf:	0f be c0             	movsbl %al,%eax
  102dd2:	83 e8 37             	sub    $0x37,%eax
  102dd5:	89 45 f4             	mov    %eax,-0xc(%ebp)
        }
        else {
            break;
        }
        if (dig >= base) {
  102dd8:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102ddb:	3b 45 10             	cmp    0x10(%ebp),%eax
  102dde:	7d 19                	jge    102df9 <strtol+0x135>
            break;
        }
        s ++, val = (val * base) + dig;
  102de0:	ff 45 08             	incl   0x8(%ebp)
  102de3:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102de6:	0f af 45 10          	imul   0x10(%ebp),%eax
  102dea:	89 c2                	mov    %eax,%edx
  102dec:	8b 45 f4             	mov    -0xc(%ebp),%eax
  102def:	01 d0                	add    %edx,%eax
  102df1:	89 45 f8             	mov    %eax,-0x8(%ebp)
        // we don't properly detect overflow!
    }
  102df4:	e9 72 ff ff ff       	jmp    102d6b <strtol+0xa7>
        }
        else {
            break;
        }
        if (dig >= base) {
            break;
  102df9:	90                   	nop
        }
        s ++, val = (val * base) + dig;
        // we don't properly detect overflow!
    }

    if (endptr) {
  102dfa:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  102dfe:	74 08                	je     102e08 <strtol+0x144>
        *endptr = (char *) s;
  102e00:	8b 45 0c             	mov    0xc(%ebp),%eax
  102e03:	8b 55 08             	mov    0x8(%ebp),%edx
  102e06:	89 10                	mov    %edx,(%eax)
    }
    return (neg ? -val : val);
  102e08:	83 7d fc 00          	cmpl   $0x0,-0x4(%ebp)
  102e0c:	74 07                	je     102e15 <strtol+0x151>
  102e0e:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102e11:	f7 d8                	neg    %eax
  102e13:	eb 03                	jmp    102e18 <strtol+0x154>
  102e15:	8b 45 f8             	mov    -0x8(%ebp),%eax
}
  102e18:	c9                   	leave  
  102e19:	c3                   	ret    

00102e1a <memset>:
 * @n:        number of bytes to be set to the value
 *
 * The memset() function returns @s.
 * */
void *
memset(void *s, char c, size_t n) {
  102e1a:	55                   	push   %ebp
  102e1b:	89 e5                	mov    %esp,%ebp
  102e1d:	57                   	push   %edi
  102e1e:	83 ec 24             	sub    $0x24,%esp
  102e21:	8b 45 0c             	mov    0xc(%ebp),%eax
  102e24:	88 45 d8             	mov    %al,-0x28(%ebp)
#ifdef __HAVE_ARCH_MEMSET
    return __memset(s, c, n);
  102e27:	0f be 45 d8          	movsbl -0x28(%ebp),%eax
  102e2b:	8b 55 08             	mov    0x8(%ebp),%edx
  102e2e:	89 55 f8             	mov    %edx,-0x8(%ebp)
  102e31:	88 45 f7             	mov    %al,-0x9(%ebp)
  102e34:	8b 45 10             	mov    0x10(%ebp),%eax
  102e37:	89 45 f0             	mov    %eax,-0x10(%ebp)
#ifndef __HAVE_ARCH_MEMSET
#define __HAVE_ARCH_MEMSET
static inline void *
__memset(void *s, char c, size_t n) {
    int d0, d1;
    asm volatile (
  102e3a:	8b 4d f0             	mov    -0x10(%ebp),%ecx
  102e3d:	0f b6 45 f7          	movzbl -0x9(%ebp),%eax
  102e41:	8b 55 f8             	mov    -0x8(%ebp),%edx
  102e44:	89 d7                	mov    %edx,%edi
  102e46:	f3 aa                	rep stos %al,%es:(%edi)
  102e48:	89 fa                	mov    %edi,%edx
  102e4a:	89 4d ec             	mov    %ecx,-0x14(%ebp)
  102e4d:	89 55 e8             	mov    %edx,-0x18(%ebp)
            "rep; stosb;"
            : "=&c" (d0), "=&D" (d1)
            : "0" (n), "a" (c), "1" (s)
            : "memory");
    return s;
  102e50:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102e53:	90                   	nop
    while (n -- > 0) {
        *p ++ = c;
    }
    return s;
#endif /* __HAVE_ARCH_MEMSET */
}
  102e54:	83 c4 24             	add    $0x24,%esp
  102e57:	5f                   	pop    %edi
  102e58:	5d                   	pop    %ebp
  102e59:	c3                   	ret    

00102e5a <memmove>:
 * @n:        number of bytes to copy
 *
 * The memmove() function returns @dst.
 * */
void *
memmove(void *dst, const void *src, size_t n) {
  102e5a:	55                   	push   %ebp
  102e5b:	89 e5                	mov    %esp,%ebp
  102e5d:	57                   	push   %edi
  102e5e:	56                   	push   %esi
  102e5f:	53                   	push   %ebx
  102e60:	83 ec 30             	sub    $0x30,%esp
  102e63:	8b 45 08             	mov    0x8(%ebp),%eax
  102e66:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102e69:	8b 45 0c             	mov    0xc(%ebp),%eax
  102e6c:	89 45 ec             	mov    %eax,-0x14(%ebp)
  102e6f:	8b 45 10             	mov    0x10(%ebp),%eax
  102e72:	89 45 e8             	mov    %eax,-0x18(%ebp)

#ifndef __HAVE_ARCH_MEMMOVE
#define __HAVE_ARCH_MEMMOVE
static inline void *
__memmove(void *dst, const void *src, size_t n) {
    if (dst < src) {
  102e75:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102e78:	3b 45 ec             	cmp    -0x14(%ebp),%eax
  102e7b:	73 42                	jae    102ebf <memmove+0x65>
  102e7d:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102e80:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  102e83:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102e86:	89 45 e0             	mov    %eax,-0x20(%ebp)
  102e89:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102e8c:	89 45 dc             	mov    %eax,-0x24(%ebp)
            "andl $3, %%ecx;"
            "jz 1f;"
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
  102e8f:	8b 45 dc             	mov    -0x24(%ebp),%eax
  102e92:	c1 e8 02             	shr    $0x2,%eax
  102e95:	89 c1                	mov    %eax,%ecx
#ifndef __HAVE_ARCH_MEMCPY
#define __HAVE_ARCH_MEMCPY
static inline void *
__memcpy(void *dst, const void *src, size_t n) {
    int d0, d1, d2;
    asm volatile (
  102e97:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  102e9a:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102e9d:	89 d7                	mov    %edx,%edi
  102e9f:	89 c6                	mov    %eax,%esi
  102ea1:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  102ea3:	8b 4d dc             	mov    -0x24(%ebp),%ecx
  102ea6:	83 e1 03             	and    $0x3,%ecx
  102ea9:	74 02                	je     102ead <memmove+0x53>
  102eab:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  102ead:	89 f0                	mov    %esi,%eax
  102eaf:	89 fa                	mov    %edi,%edx
  102eb1:	89 4d d8             	mov    %ecx,-0x28(%ebp)
  102eb4:	89 55 d4             	mov    %edx,-0x2c(%ebp)
  102eb7:	89 45 d0             	mov    %eax,-0x30(%ebp)
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
            : "memory");
    return dst;
  102eba:	8b 45 e4             	mov    -0x1c(%ebp),%eax
#ifdef __HAVE_ARCH_MEMMOVE
    return __memmove(dst, src, n);
  102ebd:	eb 36                	jmp    102ef5 <memmove+0x9b>
    asm volatile (
            "std;"
            "rep; movsb;"
            "cld;"
            : "=&c" (d0), "=&S" (d1), "=&D" (d2)
            : "0" (n), "1" (n - 1 + src), "2" (n - 1 + dst)
  102ebf:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102ec2:	8d 50 ff             	lea    -0x1(%eax),%edx
  102ec5:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102ec8:	01 c2                	add    %eax,%edx
  102eca:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102ecd:	8d 48 ff             	lea    -0x1(%eax),%ecx
  102ed0:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102ed3:	8d 1c 01             	lea    (%ecx,%eax,1),%ebx
__memmove(void *dst, const void *src, size_t n) {
    if (dst < src) {
        return __memcpy(dst, src, n);
    }
    int d0, d1, d2;
    asm volatile (
  102ed6:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102ed9:	89 c1                	mov    %eax,%ecx
  102edb:	89 d8                	mov    %ebx,%eax
  102edd:	89 d6                	mov    %edx,%esi
  102edf:	89 c7                	mov    %eax,%edi
  102ee1:	fd                   	std    
  102ee2:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  102ee4:	fc                   	cld    
  102ee5:	89 f8                	mov    %edi,%eax
  102ee7:	89 f2                	mov    %esi,%edx
  102ee9:	89 4d cc             	mov    %ecx,-0x34(%ebp)
  102eec:	89 55 c8             	mov    %edx,-0x38(%ebp)
  102eef:	89 45 c4             	mov    %eax,-0x3c(%ebp)
            "rep; movsb;"
            "cld;"
            : "=&c" (d0), "=&S" (d1), "=&D" (d2)
            : "0" (n), "1" (n - 1 + src), "2" (n - 1 + dst)
            : "memory");
    return dst;
  102ef2:	8b 45 f0             	mov    -0x10(%ebp),%eax
            *d ++ = *s ++;
        }
    }
    return dst;
#endif /* __HAVE_ARCH_MEMMOVE */
}
  102ef5:	83 c4 30             	add    $0x30,%esp
  102ef8:	5b                   	pop    %ebx
  102ef9:	5e                   	pop    %esi
  102efa:	5f                   	pop    %edi
  102efb:	5d                   	pop    %ebp
  102efc:	c3                   	ret    

00102efd <memcpy>:
 * it always copies exactly @n bytes. To avoid overflows, the size of arrays pointed
 * by both @src and @dst, should be at least @n bytes, and should not overlap
 * (for overlapping memory area, memmove is a safer approach).
 * */
void *
memcpy(void *dst, const void *src, size_t n) {
  102efd:	55                   	push   %ebp
  102efe:	89 e5                	mov    %esp,%ebp
  102f00:	57                   	push   %edi
  102f01:	56                   	push   %esi
  102f02:	83 ec 20             	sub    $0x20,%esp
  102f05:	8b 45 08             	mov    0x8(%ebp),%eax
  102f08:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102f0b:	8b 45 0c             	mov    0xc(%ebp),%eax
  102f0e:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102f11:	8b 45 10             	mov    0x10(%ebp),%eax
  102f14:	89 45 ec             	mov    %eax,-0x14(%ebp)
            "andl $3, %%ecx;"
            "jz 1f;"
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
  102f17:	8b 45 ec             	mov    -0x14(%ebp),%eax
  102f1a:	c1 e8 02             	shr    $0x2,%eax
  102f1d:	89 c1                	mov    %eax,%ecx
#ifndef __HAVE_ARCH_MEMCPY
#define __HAVE_ARCH_MEMCPY
static inline void *
__memcpy(void *dst, const void *src, size_t n) {
    int d0, d1, d2;
    asm volatile (
  102f1f:	8b 55 f4             	mov    -0xc(%ebp),%edx
  102f22:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102f25:	89 d7                	mov    %edx,%edi
  102f27:	89 c6                	mov    %eax,%esi
  102f29:	f3 a5                	rep movsl %ds:(%esi),%es:(%edi)
  102f2b:	8b 4d ec             	mov    -0x14(%ebp),%ecx
  102f2e:	83 e1 03             	and    $0x3,%ecx
  102f31:	74 02                	je     102f35 <memcpy+0x38>
  102f33:	f3 a4                	rep movsb %ds:(%esi),%es:(%edi)
  102f35:	89 f0                	mov    %esi,%eax
  102f37:	89 fa                	mov    %edi,%edx
  102f39:	89 4d e8             	mov    %ecx,-0x18(%ebp)
  102f3c:	89 55 e4             	mov    %edx,-0x1c(%ebp)
  102f3f:	89 45 e0             	mov    %eax,-0x20(%ebp)
            "rep; movsb;"
            "1:"
            : "=&c" (d0), "=&D" (d1), "=&S" (d2)
            : "0" (n / 4), "g" (n), "1" (dst), "2" (src)
            : "memory");
    return dst;
  102f42:	8b 45 f4             	mov    -0xc(%ebp),%eax
#ifdef __HAVE_ARCH_MEMCPY
    return __memcpy(dst, src, n);
  102f45:	90                   	nop
    while (n -- > 0) {
        *d ++ = *s ++;
    }
    return dst;
#endif /* __HAVE_ARCH_MEMCPY */
}
  102f46:	83 c4 20             	add    $0x20,%esp
  102f49:	5e                   	pop    %esi
  102f4a:	5f                   	pop    %edi
  102f4b:	5d                   	pop    %ebp
  102f4c:	c3                   	ret    

00102f4d <memcmp>:
 *   match in both memory blocks has a greater value in @v1 than in @v2
 *   as if evaluated as unsigned char values;
 * - And a value less than zero indicates the opposite.
 * */
int
memcmp(const void *v1, const void *v2, size_t n) {
  102f4d:	55                   	push   %ebp
  102f4e:	89 e5                	mov    %esp,%ebp
  102f50:	83 ec 10             	sub    $0x10,%esp
    const char *s1 = (const char *)v1;
  102f53:	8b 45 08             	mov    0x8(%ebp),%eax
  102f56:	89 45 fc             	mov    %eax,-0x4(%ebp)
    const char *s2 = (const char *)v2;
  102f59:	8b 45 0c             	mov    0xc(%ebp),%eax
  102f5c:	89 45 f8             	mov    %eax,-0x8(%ebp)
    while (n -- > 0) {
  102f5f:	eb 2e                	jmp    102f8f <memcmp+0x42>
        if (*s1 != *s2) {
  102f61:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102f64:	0f b6 10             	movzbl (%eax),%edx
  102f67:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102f6a:	0f b6 00             	movzbl (%eax),%eax
  102f6d:	38 c2                	cmp    %al,%dl
  102f6f:	74 18                	je     102f89 <memcmp+0x3c>
            return (int)((unsigned char)*s1 - (unsigned char)*s2);
  102f71:	8b 45 fc             	mov    -0x4(%ebp),%eax
  102f74:	0f b6 00             	movzbl (%eax),%eax
  102f77:	0f b6 d0             	movzbl %al,%edx
  102f7a:	8b 45 f8             	mov    -0x8(%ebp),%eax
  102f7d:	0f b6 00             	movzbl (%eax),%eax
  102f80:	0f b6 c0             	movzbl %al,%eax
  102f83:	29 c2                	sub    %eax,%edx
  102f85:	89 d0                	mov    %edx,%eax
  102f87:	eb 18                	jmp    102fa1 <memcmp+0x54>
        }
        s1 ++, s2 ++;
  102f89:	ff 45 fc             	incl   -0x4(%ebp)
  102f8c:	ff 45 f8             	incl   -0x8(%ebp)
 * */
int
memcmp(const void *v1, const void *v2, size_t n) {
    const char *s1 = (const char *)v1;
    const char *s2 = (const char *)v2;
    while (n -- > 0) {
  102f8f:	8b 45 10             	mov    0x10(%ebp),%eax
  102f92:	8d 50 ff             	lea    -0x1(%eax),%edx
  102f95:	89 55 10             	mov    %edx,0x10(%ebp)
  102f98:	85 c0                	test   %eax,%eax
  102f9a:	75 c5                	jne    102f61 <memcmp+0x14>
        if (*s1 != *s2) {
            return (int)((unsigned char)*s1 - (unsigned char)*s2);
        }
        s1 ++, s2 ++;
    }
    return 0;
  102f9c:	b8 00 00 00 00       	mov    $0x0,%eax
}
  102fa1:	c9                   	leave  
  102fa2:	c3                   	ret    

00102fa3 <printnum>:
 * @width:         maximum number of digits, if the actual width is less than @width, use @padc instead
 * @padc:        character that padded on the left if the actual width is less than @width
 * */
static void
printnum(void (*putch)(int, void*), void *putdat,
        unsigned long long num, unsigned base, int width, int padc) {
  102fa3:	55                   	push   %ebp
  102fa4:	89 e5                	mov    %esp,%ebp
  102fa6:	83 ec 58             	sub    $0x58,%esp
  102fa9:	8b 45 10             	mov    0x10(%ebp),%eax
  102fac:	89 45 d0             	mov    %eax,-0x30(%ebp)
  102faf:	8b 45 14             	mov    0x14(%ebp),%eax
  102fb2:	89 45 d4             	mov    %eax,-0x2c(%ebp)
    unsigned long long result = num;
  102fb5:	8b 45 d0             	mov    -0x30(%ebp),%eax
  102fb8:	8b 55 d4             	mov    -0x2c(%ebp),%edx
  102fbb:	89 45 e8             	mov    %eax,-0x18(%ebp)
  102fbe:	89 55 ec             	mov    %edx,-0x14(%ebp)
    unsigned mod = do_div(result, base);
  102fc1:	8b 45 18             	mov    0x18(%ebp),%eax
  102fc4:	89 45 e4             	mov    %eax,-0x1c(%ebp)
  102fc7:	8b 45 e8             	mov    -0x18(%ebp),%eax
  102fca:	8b 55 ec             	mov    -0x14(%ebp),%edx
  102fcd:	89 45 e0             	mov    %eax,-0x20(%ebp)
  102fd0:	89 55 f0             	mov    %edx,-0x10(%ebp)
  102fd3:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102fd6:	89 45 f4             	mov    %eax,-0xc(%ebp)
  102fd9:	83 7d f0 00          	cmpl   $0x0,-0x10(%ebp)
  102fdd:	74 1c                	je     102ffb <printnum+0x58>
  102fdf:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102fe2:	ba 00 00 00 00       	mov    $0x0,%edx
  102fe7:	f7 75 e4             	divl   -0x1c(%ebp)
  102fea:	89 55 f4             	mov    %edx,-0xc(%ebp)
  102fed:	8b 45 f0             	mov    -0x10(%ebp),%eax
  102ff0:	ba 00 00 00 00       	mov    $0x0,%edx
  102ff5:	f7 75 e4             	divl   -0x1c(%ebp)
  102ff8:	89 45 f0             	mov    %eax,-0x10(%ebp)
  102ffb:	8b 45 e0             	mov    -0x20(%ebp),%eax
  102ffe:	8b 55 f4             	mov    -0xc(%ebp),%edx
  103001:	f7 75 e4             	divl   -0x1c(%ebp)
  103004:	89 45 e0             	mov    %eax,-0x20(%ebp)
  103007:	89 55 dc             	mov    %edx,-0x24(%ebp)
  10300a:	8b 45 e0             	mov    -0x20(%ebp),%eax
  10300d:	8b 55 f0             	mov    -0x10(%ebp),%edx
  103010:	89 45 e8             	mov    %eax,-0x18(%ebp)
  103013:	89 55 ec             	mov    %edx,-0x14(%ebp)
  103016:	8b 45 dc             	mov    -0x24(%ebp),%eax
  103019:	89 45 d8             	mov    %eax,-0x28(%ebp)

    // first recursively print all preceding (more significant) digits
    if (num >= base) {
  10301c:	8b 45 18             	mov    0x18(%ebp),%eax
  10301f:	ba 00 00 00 00       	mov    $0x0,%edx
  103024:	3b 55 d4             	cmp    -0x2c(%ebp),%edx
  103027:	77 56                	ja     10307f <printnum+0xdc>
  103029:	3b 55 d4             	cmp    -0x2c(%ebp),%edx
  10302c:	72 05                	jb     103033 <printnum+0x90>
  10302e:	3b 45 d0             	cmp    -0x30(%ebp),%eax
  103031:	77 4c                	ja     10307f <printnum+0xdc>
        printnum(putch, putdat, result, base, width - 1, padc);
  103033:	8b 45 1c             	mov    0x1c(%ebp),%eax
  103036:	8d 50 ff             	lea    -0x1(%eax),%edx
  103039:	8b 45 20             	mov    0x20(%ebp),%eax
  10303c:	89 44 24 18          	mov    %eax,0x18(%esp)
  103040:	89 54 24 14          	mov    %edx,0x14(%esp)
  103044:	8b 45 18             	mov    0x18(%ebp),%eax
  103047:	89 44 24 10          	mov    %eax,0x10(%esp)
  10304b:	8b 45 e8             	mov    -0x18(%ebp),%eax
  10304e:	8b 55 ec             	mov    -0x14(%ebp),%edx
  103051:	89 44 24 08          	mov    %eax,0x8(%esp)
  103055:	89 54 24 0c          	mov    %edx,0xc(%esp)
  103059:	8b 45 0c             	mov    0xc(%ebp),%eax
  10305c:	89 44 24 04          	mov    %eax,0x4(%esp)
  103060:	8b 45 08             	mov    0x8(%ebp),%eax
  103063:	89 04 24             	mov    %eax,(%esp)
  103066:	e8 38 ff ff ff       	call   102fa3 <printnum>
  10306b:	eb 1b                	jmp    103088 <printnum+0xe5>
    } else {
        // print any needed pad characters before first digit
        while (-- width > 0)
            putch(padc, putdat);
  10306d:	8b 45 0c             	mov    0xc(%ebp),%eax
  103070:	89 44 24 04          	mov    %eax,0x4(%esp)
  103074:	8b 45 20             	mov    0x20(%ebp),%eax
  103077:	89 04 24             	mov    %eax,(%esp)
  10307a:	8b 45 08             	mov    0x8(%ebp),%eax
  10307d:	ff d0                	call   *%eax
    // first recursively print all preceding (more significant) digits
    if (num >= base) {
        printnum(putch, putdat, result, base, width - 1, padc);
    } else {
        // print any needed pad characters before first digit
        while (-- width > 0)
  10307f:	ff 4d 1c             	decl   0x1c(%ebp)
  103082:	83 7d 1c 00          	cmpl   $0x0,0x1c(%ebp)
  103086:	7f e5                	jg     10306d <printnum+0xca>
            putch(padc, putdat);
    }
    // then print this (the least significant) digit
    putch("0123456789abcdef"[mod], putdat);
  103088:	8b 45 d8             	mov    -0x28(%ebp),%eax
  10308b:	05 f0 3d 10 00       	add    $0x103df0,%eax
  103090:	0f b6 00             	movzbl (%eax),%eax
  103093:	0f be c0             	movsbl %al,%eax
  103096:	8b 55 0c             	mov    0xc(%ebp),%edx
  103099:	89 54 24 04          	mov    %edx,0x4(%esp)
  10309d:	89 04 24             	mov    %eax,(%esp)
  1030a0:	8b 45 08             	mov    0x8(%ebp),%eax
  1030a3:	ff d0                	call   *%eax
}
  1030a5:	90                   	nop
  1030a6:	c9                   	leave  
  1030a7:	c3                   	ret    

001030a8 <getuint>:
 * getuint - get an unsigned int of various possible sizes from a varargs list
 * @ap:            a varargs list pointer
 * @lflag:        determines the size of the vararg that @ap points to
 * */
static unsigned long long
getuint(va_list *ap, int lflag) {
  1030a8:	55                   	push   %ebp
  1030a9:	89 e5                	mov    %esp,%ebp
    if (lflag >= 2) {
  1030ab:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  1030af:	7e 14                	jle    1030c5 <getuint+0x1d>
        return va_arg(*ap, unsigned long long);
  1030b1:	8b 45 08             	mov    0x8(%ebp),%eax
  1030b4:	8b 00                	mov    (%eax),%eax
  1030b6:	8d 48 08             	lea    0x8(%eax),%ecx
  1030b9:	8b 55 08             	mov    0x8(%ebp),%edx
  1030bc:	89 0a                	mov    %ecx,(%edx)
  1030be:	8b 50 04             	mov    0x4(%eax),%edx
  1030c1:	8b 00                	mov    (%eax),%eax
  1030c3:	eb 30                	jmp    1030f5 <getuint+0x4d>
    }
    else if (lflag) {
  1030c5:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  1030c9:	74 16                	je     1030e1 <getuint+0x39>
        return va_arg(*ap, unsigned long);
  1030cb:	8b 45 08             	mov    0x8(%ebp),%eax
  1030ce:	8b 00                	mov    (%eax),%eax
  1030d0:	8d 48 04             	lea    0x4(%eax),%ecx
  1030d3:	8b 55 08             	mov    0x8(%ebp),%edx
  1030d6:	89 0a                	mov    %ecx,(%edx)
  1030d8:	8b 00                	mov    (%eax),%eax
  1030da:	ba 00 00 00 00       	mov    $0x0,%edx
  1030df:	eb 14                	jmp    1030f5 <getuint+0x4d>
    }
    else {
        return va_arg(*ap, unsigned int);
  1030e1:	8b 45 08             	mov    0x8(%ebp),%eax
  1030e4:	8b 00                	mov    (%eax),%eax
  1030e6:	8d 48 04             	lea    0x4(%eax),%ecx
  1030e9:	8b 55 08             	mov    0x8(%ebp),%edx
  1030ec:	89 0a                	mov    %ecx,(%edx)
  1030ee:	8b 00                	mov    (%eax),%eax
  1030f0:	ba 00 00 00 00       	mov    $0x0,%edx
    }
}
  1030f5:	5d                   	pop    %ebp
  1030f6:	c3                   	ret    

001030f7 <getint>:
 * getint - same as getuint but signed, we can't use getuint because of sign extension
 * @ap:            a varargs list pointer
 * @lflag:        determines the size of the vararg that @ap points to
 * */
static long long
getint(va_list *ap, int lflag) {
  1030f7:	55                   	push   %ebp
  1030f8:	89 e5                	mov    %esp,%ebp
    if (lflag >= 2) {
  1030fa:	83 7d 0c 01          	cmpl   $0x1,0xc(%ebp)
  1030fe:	7e 14                	jle    103114 <getint+0x1d>
        return va_arg(*ap, long long);
  103100:	8b 45 08             	mov    0x8(%ebp),%eax
  103103:	8b 00                	mov    (%eax),%eax
  103105:	8d 48 08             	lea    0x8(%eax),%ecx
  103108:	8b 55 08             	mov    0x8(%ebp),%edx
  10310b:	89 0a                	mov    %ecx,(%edx)
  10310d:	8b 50 04             	mov    0x4(%eax),%edx
  103110:	8b 00                	mov    (%eax),%eax
  103112:	eb 28                	jmp    10313c <getint+0x45>
    }
    else if (lflag) {
  103114:	83 7d 0c 00          	cmpl   $0x0,0xc(%ebp)
  103118:	74 12                	je     10312c <getint+0x35>
        return va_arg(*ap, long);
  10311a:	8b 45 08             	mov    0x8(%ebp),%eax
  10311d:	8b 00                	mov    (%eax),%eax
  10311f:	8d 48 04             	lea    0x4(%eax),%ecx
  103122:	8b 55 08             	mov    0x8(%ebp),%edx
  103125:	89 0a                	mov    %ecx,(%edx)
  103127:	8b 00                	mov    (%eax),%eax
  103129:	99                   	cltd   
  10312a:	eb 10                	jmp    10313c <getint+0x45>
    }
    else {
        return va_arg(*ap, int);
  10312c:	8b 45 08             	mov    0x8(%ebp),%eax
  10312f:	8b 00                	mov    (%eax),%eax
  103131:	8d 48 04             	lea    0x4(%eax),%ecx
  103134:	8b 55 08             	mov    0x8(%ebp),%edx
  103137:	89 0a                	mov    %ecx,(%edx)
  103139:	8b 00                	mov    (%eax),%eax
  10313b:	99                   	cltd   
    }
}
  10313c:	5d                   	pop    %ebp
  10313d:	c3                   	ret    

0010313e <printfmt>:
 * @putch:        specified putch function, print a single character
 * @putdat:        used by @putch function
 * @fmt:        the format string to use
 * */
void
printfmt(void (*putch)(int, void*), void *putdat, const char *fmt, ...) {
  10313e:	55                   	push   %ebp
  10313f:	89 e5                	mov    %esp,%ebp
  103141:	83 ec 28             	sub    $0x28,%esp
    va_list ap;

    va_start(ap, fmt);
  103144:	8d 45 14             	lea    0x14(%ebp),%eax
  103147:	89 45 f4             	mov    %eax,-0xc(%ebp)
    vprintfmt(putch, putdat, fmt, ap);
  10314a:	8b 45 f4             	mov    -0xc(%ebp),%eax
  10314d:	89 44 24 0c          	mov    %eax,0xc(%esp)
  103151:	8b 45 10             	mov    0x10(%ebp),%eax
  103154:	89 44 24 08          	mov    %eax,0x8(%esp)
  103158:	8b 45 0c             	mov    0xc(%ebp),%eax
  10315b:	89 44 24 04          	mov    %eax,0x4(%esp)
  10315f:	8b 45 08             	mov    0x8(%ebp),%eax
  103162:	89 04 24             	mov    %eax,(%esp)
  103165:	e8 03 00 00 00       	call   10316d <vprintfmt>
    va_end(ap);
}
  10316a:	90                   	nop
  10316b:	c9                   	leave  
  10316c:	c3                   	ret    

0010316d <vprintfmt>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want printfmt() instead.
 * */
void
vprintfmt(void (*putch)(int, void*), void *putdat, const char *fmt, va_list ap) {
  10316d:	55                   	push   %ebp
  10316e:	89 e5                	mov    %esp,%ebp
  103170:	56                   	push   %esi
  103171:	53                   	push   %ebx
  103172:	83 ec 40             	sub    $0x40,%esp
    register int ch, err;
    unsigned long long num;
    int base, width, precision, lflag, altflag;

    while (1) {
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  103175:	eb 17                	jmp    10318e <vprintfmt+0x21>
            if (ch == '\0') {
  103177:	85 db                	test   %ebx,%ebx
  103179:	0f 84 bf 03 00 00    	je     10353e <vprintfmt+0x3d1>
                return;
            }
            putch(ch, putdat);
  10317f:	8b 45 0c             	mov    0xc(%ebp),%eax
  103182:	89 44 24 04          	mov    %eax,0x4(%esp)
  103186:	89 1c 24             	mov    %ebx,(%esp)
  103189:	8b 45 08             	mov    0x8(%ebp),%eax
  10318c:	ff d0                	call   *%eax
    register int ch, err;
    unsigned long long num;
    int base, width, precision, lflag, altflag;

    while (1) {
        while ((ch = *(unsigned char *)fmt ++) != '%') {
  10318e:	8b 45 10             	mov    0x10(%ebp),%eax
  103191:	8d 50 01             	lea    0x1(%eax),%edx
  103194:	89 55 10             	mov    %edx,0x10(%ebp)
  103197:	0f b6 00             	movzbl (%eax),%eax
  10319a:	0f b6 d8             	movzbl %al,%ebx
  10319d:	83 fb 25             	cmp    $0x25,%ebx
  1031a0:	75 d5                	jne    103177 <vprintfmt+0xa>
            }
            putch(ch, putdat);
        }

        // Process a %-escape sequence
        char padc = ' ';
  1031a2:	c6 45 db 20          	movb   $0x20,-0x25(%ebp)
        width = precision = -1;
  1031a6:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
  1031ad:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  1031b0:	89 45 e8             	mov    %eax,-0x18(%ebp)
        lflag = altflag = 0;
  1031b3:	c7 45 dc 00 00 00 00 	movl   $0x0,-0x24(%ebp)
  1031ba:	8b 45 dc             	mov    -0x24(%ebp),%eax
  1031bd:	89 45 e0             	mov    %eax,-0x20(%ebp)

    reswitch:
        switch (ch = *(unsigned char *)fmt ++) {
  1031c0:	8b 45 10             	mov    0x10(%ebp),%eax
  1031c3:	8d 50 01             	lea    0x1(%eax),%edx
  1031c6:	89 55 10             	mov    %edx,0x10(%ebp)
  1031c9:	0f b6 00             	movzbl (%eax),%eax
  1031cc:	0f b6 d8             	movzbl %al,%ebx
  1031cf:	8d 43 dd             	lea    -0x23(%ebx),%eax
  1031d2:	83 f8 55             	cmp    $0x55,%eax
  1031d5:	0f 87 37 03 00 00    	ja     103512 <vprintfmt+0x3a5>
  1031db:	8b 04 85 14 3e 10 00 	mov    0x103e14(,%eax,4),%eax
  1031e2:	ff e0                	jmp    *%eax

        // flag to pad on the right
        case '-':
            padc = '-';
  1031e4:	c6 45 db 2d          	movb   $0x2d,-0x25(%ebp)
            goto reswitch;
  1031e8:	eb d6                	jmp    1031c0 <vprintfmt+0x53>

        // flag to pad with 0's instead of spaces
        case '0':
            padc = '0';
  1031ea:	c6 45 db 30          	movb   $0x30,-0x25(%ebp)
            goto reswitch;
  1031ee:	eb d0                	jmp    1031c0 <vprintfmt+0x53>

        // width field
        case '1' ... '9':
            for (precision = 0; ; ++ fmt) {
  1031f0:	c7 45 e4 00 00 00 00 	movl   $0x0,-0x1c(%ebp)
                precision = precision * 10 + ch - '0';
  1031f7:	8b 55 e4             	mov    -0x1c(%ebp),%edx
  1031fa:	89 d0                	mov    %edx,%eax
  1031fc:	c1 e0 02             	shl    $0x2,%eax
  1031ff:	01 d0                	add    %edx,%eax
  103201:	01 c0                	add    %eax,%eax
  103203:	01 d8                	add    %ebx,%eax
  103205:	83 e8 30             	sub    $0x30,%eax
  103208:	89 45 e4             	mov    %eax,-0x1c(%ebp)
                ch = *fmt;
  10320b:	8b 45 10             	mov    0x10(%ebp),%eax
  10320e:	0f b6 00             	movzbl (%eax),%eax
  103211:	0f be d8             	movsbl %al,%ebx
                if (ch < '0' || ch > '9') {
  103214:	83 fb 2f             	cmp    $0x2f,%ebx
  103217:	7e 38                	jle    103251 <vprintfmt+0xe4>
  103219:	83 fb 39             	cmp    $0x39,%ebx
  10321c:	7f 33                	jg     103251 <vprintfmt+0xe4>
            padc = '0';
            goto reswitch;

        // width field
        case '1' ... '9':
            for (precision = 0; ; ++ fmt) {
  10321e:	ff 45 10             	incl   0x10(%ebp)
                precision = precision * 10 + ch - '0';
                ch = *fmt;
                if (ch < '0' || ch > '9') {
                    break;
                }
            }
  103221:	eb d4                	jmp    1031f7 <vprintfmt+0x8a>
            goto process_precision;

        case '*':
            precision = va_arg(ap, int);
  103223:	8b 45 14             	mov    0x14(%ebp),%eax
  103226:	8d 50 04             	lea    0x4(%eax),%edx
  103229:	89 55 14             	mov    %edx,0x14(%ebp)
  10322c:	8b 00                	mov    (%eax),%eax
  10322e:	89 45 e4             	mov    %eax,-0x1c(%ebp)
            goto process_precision;
  103231:	eb 1f                	jmp    103252 <vprintfmt+0xe5>

        case '.':
            if (width < 0)
  103233:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  103237:	79 87                	jns    1031c0 <vprintfmt+0x53>
                width = 0;
  103239:	c7 45 e8 00 00 00 00 	movl   $0x0,-0x18(%ebp)
            goto reswitch;
  103240:	e9 7b ff ff ff       	jmp    1031c0 <vprintfmt+0x53>

        case '#':
            altflag = 1;
  103245:	c7 45 dc 01 00 00 00 	movl   $0x1,-0x24(%ebp)
            goto reswitch;
  10324c:	e9 6f ff ff ff       	jmp    1031c0 <vprintfmt+0x53>
                ch = *fmt;
                if (ch < '0' || ch > '9') {
                    break;
                }
            }
            goto process_precision;
  103251:	90                   	nop
        case '#':
            altflag = 1;
            goto reswitch;

        process_precision:
            if (width < 0)
  103252:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  103256:	0f 89 64 ff ff ff    	jns    1031c0 <vprintfmt+0x53>
                width = precision, precision = -1;
  10325c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  10325f:	89 45 e8             	mov    %eax,-0x18(%ebp)
  103262:	c7 45 e4 ff ff ff ff 	movl   $0xffffffff,-0x1c(%ebp)
            goto reswitch;
  103269:	e9 52 ff ff ff       	jmp    1031c0 <vprintfmt+0x53>

        // long flag (doubled for long long)
        case 'l':
            lflag ++;
  10326e:	ff 45 e0             	incl   -0x20(%ebp)
            goto reswitch;
  103271:	e9 4a ff ff ff       	jmp    1031c0 <vprintfmt+0x53>

        // character
        case 'c':
            putch(va_arg(ap, int), putdat);
  103276:	8b 45 14             	mov    0x14(%ebp),%eax
  103279:	8d 50 04             	lea    0x4(%eax),%edx
  10327c:	89 55 14             	mov    %edx,0x14(%ebp)
  10327f:	8b 00                	mov    (%eax),%eax
  103281:	8b 55 0c             	mov    0xc(%ebp),%edx
  103284:	89 54 24 04          	mov    %edx,0x4(%esp)
  103288:	89 04 24             	mov    %eax,(%esp)
  10328b:	8b 45 08             	mov    0x8(%ebp),%eax
  10328e:	ff d0                	call   *%eax
            break;
  103290:	e9 a4 02 00 00       	jmp    103539 <vprintfmt+0x3cc>

        // error message
        case 'e':
            err = va_arg(ap, int);
  103295:	8b 45 14             	mov    0x14(%ebp),%eax
  103298:	8d 50 04             	lea    0x4(%eax),%edx
  10329b:	89 55 14             	mov    %edx,0x14(%ebp)
  10329e:	8b 18                	mov    (%eax),%ebx
            if (err < 0) {
  1032a0:	85 db                	test   %ebx,%ebx
  1032a2:	79 02                	jns    1032a6 <vprintfmt+0x139>
                err = -err;
  1032a4:	f7 db                	neg    %ebx
            }
            if (err > MAXERROR || (p = error_string[err]) == NULL) {
  1032a6:	83 fb 06             	cmp    $0x6,%ebx
  1032a9:	7f 0b                	jg     1032b6 <vprintfmt+0x149>
  1032ab:	8b 34 9d d4 3d 10 00 	mov    0x103dd4(,%ebx,4),%esi
  1032b2:	85 f6                	test   %esi,%esi
  1032b4:	75 23                	jne    1032d9 <vprintfmt+0x16c>
                printfmt(putch, putdat, "error %d", err);
  1032b6:	89 5c 24 0c          	mov    %ebx,0xc(%esp)
  1032ba:	c7 44 24 08 01 3e 10 	movl   $0x103e01,0x8(%esp)
  1032c1:	00 
  1032c2:	8b 45 0c             	mov    0xc(%ebp),%eax
  1032c5:	89 44 24 04          	mov    %eax,0x4(%esp)
  1032c9:	8b 45 08             	mov    0x8(%ebp),%eax
  1032cc:	89 04 24             	mov    %eax,(%esp)
  1032cf:	e8 6a fe ff ff       	call   10313e <printfmt>
            }
            else {
                printfmt(putch, putdat, "%s", p);
            }
            break;
  1032d4:	e9 60 02 00 00       	jmp    103539 <vprintfmt+0x3cc>
            }
            if (err > MAXERROR || (p = error_string[err]) == NULL) {
                printfmt(putch, putdat, "error %d", err);
            }
            else {
                printfmt(putch, putdat, "%s", p);
  1032d9:	89 74 24 0c          	mov    %esi,0xc(%esp)
  1032dd:	c7 44 24 08 0a 3e 10 	movl   $0x103e0a,0x8(%esp)
  1032e4:	00 
  1032e5:	8b 45 0c             	mov    0xc(%ebp),%eax
  1032e8:	89 44 24 04          	mov    %eax,0x4(%esp)
  1032ec:	8b 45 08             	mov    0x8(%ebp),%eax
  1032ef:	89 04 24             	mov    %eax,(%esp)
  1032f2:	e8 47 fe ff ff       	call   10313e <printfmt>
            }
            break;
  1032f7:	e9 3d 02 00 00       	jmp    103539 <vprintfmt+0x3cc>

        // string
        case 's':
            if ((p = va_arg(ap, char *)) == NULL) {
  1032fc:	8b 45 14             	mov    0x14(%ebp),%eax
  1032ff:	8d 50 04             	lea    0x4(%eax),%edx
  103302:	89 55 14             	mov    %edx,0x14(%ebp)
  103305:	8b 30                	mov    (%eax),%esi
  103307:	85 f6                	test   %esi,%esi
  103309:	75 05                	jne    103310 <vprintfmt+0x1a3>
                p = "(null)";
  10330b:	be 0d 3e 10 00       	mov    $0x103e0d,%esi
            }
            if (width > 0 && padc != '-') {
  103310:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  103314:	7e 76                	jle    10338c <vprintfmt+0x21f>
  103316:	80 7d db 2d          	cmpb   $0x2d,-0x25(%ebp)
  10331a:	74 70                	je     10338c <vprintfmt+0x21f>
                for (width -= strnlen(p, precision); width > 0; width --) {
  10331c:	8b 45 e4             	mov    -0x1c(%ebp),%eax
  10331f:	89 44 24 04          	mov    %eax,0x4(%esp)
  103323:	89 34 24             	mov    %esi,(%esp)
  103326:	e8 f6 f7 ff ff       	call   102b21 <strnlen>
  10332b:	8b 55 e8             	mov    -0x18(%ebp),%edx
  10332e:	29 c2                	sub    %eax,%edx
  103330:	89 d0                	mov    %edx,%eax
  103332:	89 45 e8             	mov    %eax,-0x18(%ebp)
  103335:	eb 16                	jmp    10334d <vprintfmt+0x1e0>
                    putch(padc, putdat);
  103337:	0f be 45 db          	movsbl -0x25(%ebp),%eax
  10333b:	8b 55 0c             	mov    0xc(%ebp),%edx
  10333e:	89 54 24 04          	mov    %edx,0x4(%esp)
  103342:	89 04 24             	mov    %eax,(%esp)
  103345:	8b 45 08             	mov    0x8(%ebp),%eax
  103348:	ff d0                	call   *%eax
        case 's':
            if ((p = va_arg(ap, char *)) == NULL) {
                p = "(null)";
            }
            if (width > 0 && padc != '-') {
                for (width -= strnlen(p, precision); width > 0; width --) {
  10334a:	ff 4d e8             	decl   -0x18(%ebp)
  10334d:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  103351:	7f e4                	jg     103337 <vprintfmt+0x1ca>
                    putch(padc, putdat);
                }
            }
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
  103353:	eb 37                	jmp    10338c <vprintfmt+0x21f>
                if (altflag && (ch < ' ' || ch > '~')) {
  103355:	83 7d dc 00          	cmpl   $0x0,-0x24(%ebp)
  103359:	74 1f                	je     10337a <vprintfmt+0x20d>
  10335b:	83 fb 1f             	cmp    $0x1f,%ebx
  10335e:	7e 05                	jle    103365 <vprintfmt+0x1f8>
  103360:	83 fb 7e             	cmp    $0x7e,%ebx
  103363:	7e 15                	jle    10337a <vprintfmt+0x20d>
                    putch('?', putdat);
  103365:	8b 45 0c             	mov    0xc(%ebp),%eax
  103368:	89 44 24 04          	mov    %eax,0x4(%esp)
  10336c:	c7 04 24 3f 00 00 00 	movl   $0x3f,(%esp)
  103373:	8b 45 08             	mov    0x8(%ebp),%eax
  103376:	ff d0                	call   *%eax
  103378:	eb 0f                	jmp    103389 <vprintfmt+0x21c>
                }
                else {
                    putch(ch, putdat);
  10337a:	8b 45 0c             	mov    0xc(%ebp),%eax
  10337d:	89 44 24 04          	mov    %eax,0x4(%esp)
  103381:	89 1c 24             	mov    %ebx,(%esp)
  103384:	8b 45 08             	mov    0x8(%ebp),%eax
  103387:	ff d0                	call   *%eax
            if (width > 0 && padc != '-') {
                for (width -= strnlen(p, precision); width > 0; width --) {
                    putch(padc, putdat);
                }
            }
            for (; (ch = *p ++) != '\0' && (precision < 0 || -- precision >= 0); width --) {
  103389:	ff 4d e8             	decl   -0x18(%ebp)
  10338c:	89 f0                	mov    %esi,%eax
  10338e:	8d 70 01             	lea    0x1(%eax),%esi
  103391:	0f b6 00             	movzbl (%eax),%eax
  103394:	0f be d8             	movsbl %al,%ebx
  103397:	85 db                	test   %ebx,%ebx
  103399:	74 27                	je     1033c2 <vprintfmt+0x255>
  10339b:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  10339f:	78 b4                	js     103355 <vprintfmt+0x1e8>
  1033a1:	ff 4d e4             	decl   -0x1c(%ebp)
  1033a4:	83 7d e4 00          	cmpl   $0x0,-0x1c(%ebp)
  1033a8:	79 ab                	jns    103355 <vprintfmt+0x1e8>
                }
                else {
                    putch(ch, putdat);
                }
            }
            for (; width > 0; width --) {
  1033aa:	eb 16                	jmp    1033c2 <vprintfmt+0x255>
                putch(' ', putdat);
  1033ac:	8b 45 0c             	mov    0xc(%ebp),%eax
  1033af:	89 44 24 04          	mov    %eax,0x4(%esp)
  1033b3:	c7 04 24 20 00 00 00 	movl   $0x20,(%esp)
  1033ba:	8b 45 08             	mov    0x8(%ebp),%eax
  1033bd:	ff d0                	call   *%eax
                }
                else {
                    putch(ch, putdat);
                }
            }
            for (; width > 0; width --) {
  1033bf:	ff 4d e8             	decl   -0x18(%ebp)
  1033c2:	83 7d e8 00          	cmpl   $0x0,-0x18(%ebp)
  1033c6:	7f e4                	jg     1033ac <vprintfmt+0x23f>
                putch(' ', putdat);
            }
            break;
  1033c8:	e9 6c 01 00 00       	jmp    103539 <vprintfmt+0x3cc>

        // (signed) decimal
        case 'd':
            num = getint(&ap, lflag);
  1033cd:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1033d0:	89 44 24 04          	mov    %eax,0x4(%esp)
  1033d4:	8d 45 14             	lea    0x14(%ebp),%eax
  1033d7:	89 04 24             	mov    %eax,(%esp)
  1033da:	e8 18 fd ff ff       	call   1030f7 <getint>
  1033df:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1033e2:	89 55 f4             	mov    %edx,-0xc(%ebp)
            if ((long long)num < 0) {
  1033e5:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1033e8:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1033eb:	85 d2                	test   %edx,%edx
  1033ed:	79 26                	jns    103415 <vprintfmt+0x2a8>
                putch('-', putdat);
  1033ef:	8b 45 0c             	mov    0xc(%ebp),%eax
  1033f2:	89 44 24 04          	mov    %eax,0x4(%esp)
  1033f6:	c7 04 24 2d 00 00 00 	movl   $0x2d,(%esp)
  1033fd:	8b 45 08             	mov    0x8(%ebp),%eax
  103400:	ff d0                	call   *%eax
                num = -(long long)num;
  103402:	8b 45 f0             	mov    -0x10(%ebp),%eax
  103405:	8b 55 f4             	mov    -0xc(%ebp),%edx
  103408:	f7 d8                	neg    %eax
  10340a:	83 d2 00             	adc    $0x0,%edx
  10340d:	f7 da                	neg    %edx
  10340f:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103412:	89 55 f4             	mov    %edx,-0xc(%ebp)
            }
            base = 10;
  103415:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
            goto number;
  10341c:	e9 a8 00 00 00       	jmp    1034c9 <vprintfmt+0x35c>

        // unsigned decimal
        case 'u':
            num = getuint(&ap, lflag);
  103421:	8b 45 e0             	mov    -0x20(%ebp),%eax
  103424:	89 44 24 04          	mov    %eax,0x4(%esp)
  103428:	8d 45 14             	lea    0x14(%ebp),%eax
  10342b:	89 04 24             	mov    %eax,(%esp)
  10342e:	e8 75 fc ff ff       	call   1030a8 <getuint>
  103433:	89 45 f0             	mov    %eax,-0x10(%ebp)
  103436:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 10;
  103439:	c7 45 ec 0a 00 00 00 	movl   $0xa,-0x14(%ebp)
            goto number;
  103440:	e9 84 00 00 00       	jmp    1034c9 <vprintfmt+0x35c>

        // (unsigned) octal
        case 'o':
            num = getuint(&ap, lflag);
  103445:	8b 45 e0             	mov    -0x20(%ebp),%eax
  103448:	89 44 24 04          	mov    %eax,0x4(%esp)
  10344c:	8d 45 14             	lea    0x14(%ebp),%eax
  10344f:	89 04 24             	mov    %eax,(%esp)
  103452:	e8 51 fc ff ff       	call   1030a8 <getuint>
  103457:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10345a:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 8;
  10345d:	c7 45 ec 08 00 00 00 	movl   $0x8,-0x14(%ebp)
            goto number;
  103464:	eb 63                	jmp    1034c9 <vprintfmt+0x35c>

        // pointer
        case 'p':
            putch('0', putdat);
  103466:	8b 45 0c             	mov    0xc(%ebp),%eax
  103469:	89 44 24 04          	mov    %eax,0x4(%esp)
  10346d:	c7 04 24 30 00 00 00 	movl   $0x30,(%esp)
  103474:	8b 45 08             	mov    0x8(%ebp),%eax
  103477:	ff d0                	call   *%eax
            putch('x', putdat);
  103479:	8b 45 0c             	mov    0xc(%ebp),%eax
  10347c:	89 44 24 04          	mov    %eax,0x4(%esp)
  103480:	c7 04 24 78 00 00 00 	movl   $0x78,(%esp)
  103487:	8b 45 08             	mov    0x8(%ebp),%eax
  10348a:	ff d0                	call   *%eax
            num = (unsigned long long)(uintptr_t)va_arg(ap, void *);
  10348c:	8b 45 14             	mov    0x14(%ebp),%eax
  10348f:	8d 50 04             	lea    0x4(%eax),%edx
  103492:	89 55 14             	mov    %edx,0x14(%ebp)
  103495:	8b 00                	mov    (%eax),%eax
  103497:	89 45 f0             	mov    %eax,-0x10(%ebp)
  10349a:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
            base = 16;
  1034a1:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
            goto number;
  1034a8:	eb 1f                	jmp    1034c9 <vprintfmt+0x35c>

        // (unsigned) hexadecimal
        case 'x':
            num = getuint(&ap, lflag);
  1034aa:	8b 45 e0             	mov    -0x20(%ebp),%eax
  1034ad:	89 44 24 04          	mov    %eax,0x4(%esp)
  1034b1:	8d 45 14             	lea    0x14(%ebp),%eax
  1034b4:	89 04 24             	mov    %eax,(%esp)
  1034b7:	e8 ec fb ff ff       	call   1030a8 <getuint>
  1034bc:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1034bf:	89 55 f4             	mov    %edx,-0xc(%ebp)
            base = 16;
  1034c2:	c7 45 ec 10 00 00 00 	movl   $0x10,-0x14(%ebp)
        number:
            printnum(putch, putdat, num, base, width, padc);
  1034c9:	0f be 55 db          	movsbl -0x25(%ebp),%edx
  1034cd:	8b 45 ec             	mov    -0x14(%ebp),%eax
  1034d0:	89 54 24 18          	mov    %edx,0x18(%esp)
  1034d4:	8b 55 e8             	mov    -0x18(%ebp),%edx
  1034d7:	89 54 24 14          	mov    %edx,0x14(%esp)
  1034db:	89 44 24 10          	mov    %eax,0x10(%esp)
  1034df:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1034e2:	8b 55 f4             	mov    -0xc(%ebp),%edx
  1034e5:	89 44 24 08          	mov    %eax,0x8(%esp)
  1034e9:	89 54 24 0c          	mov    %edx,0xc(%esp)
  1034ed:	8b 45 0c             	mov    0xc(%ebp),%eax
  1034f0:	89 44 24 04          	mov    %eax,0x4(%esp)
  1034f4:	8b 45 08             	mov    0x8(%ebp),%eax
  1034f7:	89 04 24             	mov    %eax,(%esp)
  1034fa:	e8 a4 fa ff ff       	call   102fa3 <printnum>
            break;
  1034ff:	eb 38                	jmp    103539 <vprintfmt+0x3cc>

        // escaped '%' character
        case '%':
            putch(ch, putdat);
  103501:	8b 45 0c             	mov    0xc(%ebp),%eax
  103504:	89 44 24 04          	mov    %eax,0x4(%esp)
  103508:	89 1c 24             	mov    %ebx,(%esp)
  10350b:	8b 45 08             	mov    0x8(%ebp),%eax
  10350e:	ff d0                	call   *%eax
            break;
  103510:	eb 27                	jmp    103539 <vprintfmt+0x3cc>

        // unrecognized escape sequence - just print it literally
        default:
            putch('%', putdat);
  103512:	8b 45 0c             	mov    0xc(%ebp),%eax
  103515:	89 44 24 04          	mov    %eax,0x4(%esp)
  103519:	c7 04 24 25 00 00 00 	movl   $0x25,(%esp)
  103520:	8b 45 08             	mov    0x8(%ebp),%eax
  103523:	ff d0                	call   *%eax
            for (fmt --; fmt[-1] != '%'; fmt --)
  103525:	ff 4d 10             	decl   0x10(%ebp)
  103528:	eb 03                	jmp    10352d <vprintfmt+0x3c0>
  10352a:	ff 4d 10             	decl   0x10(%ebp)
  10352d:	8b 45 10             	mov    0x10(%ebp),%eax
  103530:	48                   	dec    %eax
  103531:	0f b6 00             	movzbl (%eax),%eax
  103534:	3c 25                	cmp    $0x25,%al
  103536:	75 f2                	jne    10352a <vprintfmt+0x3bd>
                /* do nothing */;
            break;
  103538:	90                   	nop
        }
    }
  103539:	e9 37 fc ff ff       	jmp    103175 <vprintfmt+0x8>
    int base, width, precision, lflag, altflag;

    while (1) {
        while ((ch = *(unsigned char *)fmt ++) != '%') {
            if (ch == '\0') {
                return;
  10353e:	90                   	nop
            for (fmt --; fmt[-1] != '%'; fmt --)
                /* do nothing */;
            break;
        }
    }
}
  10353f:	83 c4 40             	add    $0x40,%esp
  103542:	5b                   	pop    %ebx
  103543:	5e                   	pop    %esi
  103544:	5d                   	pop    %ebp
  103545:	c3                   	ret    

00103546 <sprintputch>:
 * sprintputch - 'print' a single character in a buffer
 * @ch:            the character will be printed
 * @b:            the buffer to place the character @ch
 * */
static void
sprintputch(int ch, struct sprintbuf *b) {
  103546:	55                   	push   %ebp
  103547:	89 e5                	mov    %esp,%ebp
    b->cnt ++;
  103549:	8b 45 0c             	mov    0xc(%ebp),%eax
  10354c:	8b 40 08             	mov    0x8(%eax),%eax
  10354f:	8d 50 01             	lea    0x1(%eax),%edx
  103552:	8b 45 0c             	mov    0xc(%ebp),%eax
  103555:	89 50 08             	mov    %edx,0x8(%eax)
    if (b->buf < b->ebuf) {
  103558:	8b 45 0c             	mov    0xc(%ebp),%eax
  10355b:	8b 10                	mov    (%eax),%edx
  10355d:	8b 45 0c             	mov    0xc(%ebp),%eax
  103560:	8b 40 04             	mov    0x4(%eax),%eax
  103563:	39 c2                	cmp    %eax,%edx
  103565:	73 12                	jae    103579 <sprintputch+0x33>
        *b->buf ++ = ch;
  103567:	8b 45 0c             	mov    0xc(%ebp),%eax
  10356a:	8b 00                	mov    (%eax),%eax
  10356c:	8d 48 01             	lea    0x1(%eax),%ecx
  10356f:	8b 55 0c             	mov    0xc(%ebp),%edx
  103572:	89 0a                	mov    %ecx,(%edx)
  103574:	8b 55 08             	mov    0x8(%ebp),%edx
  103577:	88 10                	mov    %dl,(%eax)
    }
}
  103579:	90                   	nop
  10357a:	5d                   	pop    %ebp
  10357b:	c3                   	ret    

0010357c <snprintf>:
 * @str:        the buffer to place the result into
 * @size:        the size of buffer, including the trailing null space
 * @fmt:        the format string to use
 * */
int
snprintf(char *str, size_t size, const char *fmt, ...) {
  10357c:	55                   	push   %ebp
  10357d:	89 e5                	mov    %esp,%ebp
  10357f:	83 ec 28             	sub    $0x28,%esp
    va_list ap;
    int cnt;
    va_start(ap, fmt);
  103582:	8d 45 14             	lea    0x14(%ebp),%eax
  103585:	89 45 f0             	mov    %eax,-0x10(%ebp)
    cnt = vsnprintf(str, size, fmt, ap);
  103588:	8b 45 f0             	mov    -0x10(%ebp),%eax
  10358b:	89 44 24 0c          	mov    %eax,0xc(%esp)
  10358f:	8b 45 10             	mov    0x10(%ebp),%eax
  103592:	89 44 24 08          	mov    %eax,0x8(%esp)
  103596:	8b 45 0c             	mov    0xc(%ebp),%eax
  103599:	89 44 24 04          	mov    %eax,0x4(%esp)
  10359d:	8b 45 08             	mov    0x8(%ebp),%eax
  1035a0:	89 04 24             	mov    %eax,(%esp)
  1035a3:	e8 08 00 00 00       	call   1035b0 <vsnprintf>
  1035a8:	89 45 f4             	mov    %eax,-0xc(%ebp)
    va_end(ap);
    return cnt;
  1035ab:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  1035ae:	c9                   	leave  
  1035af:	c3                   	ret    

001035b0 <vsnprintf>:
 *
 * Call this function if you are already dealing with a va_list.
 * Or you probably want snprintf() instead.
 * */
int
vsnprintf(char *str, size_t size, const char *fmt, va_list ap) {
  1035b0:	55                   	push   %ebp
  1035b1:	89 e5                	mov    %esp,%ebp
  1035b3:	83 ec 28             	sub    $0x28,%esp
    struct sprintbuf b = {str, str + size - 1, 0};
  1035b6:	8b 45 08             	mov    0x8(%ebp),%eax
  1035b9:	89 45 ec             	mov    %eax,-0x14(%ebp)
  1035bc:	8b 45 0c             	mov    0xc(%ebp),%eax
  1035bf:	8d 50 ff             	lea    -0x1(%eax),%edx
  1035c2:	8b 45 08             	mov    0x8(%ebp),%eax
  1035c5:	01 d0                	add    %edx,%eax
  1035c7:	89 45 f0             	mov    %eax,-0x10(%ebp)
  1035ca:	c7 45 f4 00 00 00 00 	movl   $0x0,-0xc(%ebp)
    if (str == NULL || b.buf > b.ebuf) {
  1035d1:	83 7d 08 00          	cmpl   $0x0,0x8(%ebp)
  1035d5:	74 0a                	je     1035e1 <vsnprintf+0x31>
  1035d7:	8b 55 ec             	mov    -0x14(%ebp),%edx
  1035da:	8b 45 f0             	mov    -0x10(%ebp),%eax
  1035dd:	39 c2                	cmp    %eax,%edx
  1035df:	76 07                	jbe    1035e8 <vsnprintf+0x38>
        return -E_INVAL;
  1035e1:	b8 fd ff ff ff       	mov    $0xfffffffd,%eax
  1035e6:	eb 2a                	jmp    103612 <vsnprintf+0x62>
    }
    // print the string to the buffer
    vprintfmt((void*)sprintputch, &b, fmt, ap);
  1035e8:	8b 45 14             	mov    0x14(%ebp),%eax
  1035eb:	89 44 24 0c          	mov    %eax,0xc(%esp)
  1035ef:	8b 45 10             	mov    0x10(%ebp),%eax
  1035f2:	89 44 24 08          	mov    %eax,0x8(%esp)
  1035f6:	8d 45 ec             	lea    -0x14(%ebp),%eax
  1035f9:	89 44 24 04          	mov    %eax,0x4(%esp)
  1035fd:	c7 04 24 46 35 10 00 	movl   $0x103546,(%esp)
  103604:	e8 64 fb ff ff       	call   10316d <vprintfmt>
    // null terminate the buffer
    *b.buf = '\0';
  103609:	8b 45 ec             	mov    -0x14(%ebp),%eax
  10360c:	c6 00 00             	movb   $0x0,(%eax)
    return b.cnt;
  10360f:	8b 45 f4             	mov    -0xc(%ebp),%eax
}
  103612:	c9                   	leave  
  103613:	c3                   	ret    
