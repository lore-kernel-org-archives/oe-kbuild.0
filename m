Content-Type: multipart/mixed; boundary="===============8850149699859635463=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-rt-devel:linux-5.6.y-rt-rebase 28/277] kernel/printk/printk.c:3050:7: warning: Local variable cont shadows outer variable
Date: Fri, 26 Jun 2020 02:23:37 +0800
Message-ID: <202006260222.csFbtBoB%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8850149699859635463==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: John Ogness <john.ogness@linutronix.de>
CC: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.g=
it linux-5.6.y-rt-rebase
head:   0db8d4bd38e640bf442ee849e898b3beda5121a8
commit: c77295fa77cf4557b996828548f56727a27df87e [28/277] printk: implement=
 kmsg_dump
:::::: branch date: 9 days ago
:::::: commit date: 9 days ago
compiler: gcc-9 (Debian 9.3.0-13) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

   kernel/printk/printk.c:503:24: warning: Possible null pointer dereferenc=
e: dict [nullPointer]
    memcpy(log_dict(msg), dict, dict_len);
                          ^
   kernel/printk/printk.c:1896:31: note: Calling function 'log_store', 7th =
argument 'NULL' value is 0
       c->ts_nsec, c->cpu_owner, NULL, 0, c->buf, c->len);
                                 ^
   kernel/printk/printk.c:503:24: note: Null pointer dereference
    memcpy(log_dict(msg), dict, dict_len);
                          ^
>> kernel/printk/printk.c:3050:7: warning: Local variable cont shadows oute=
r variable [shadowVar]
    bool cont =3D false;
         ^
   kernel/printk/printk.c:1886:3: note: Shadowed declaration
   } cont[2];
     ^
   kernel/printk/printk.c:3050:7: note: Shadow variable
    bool cont =3D false;
         ^
   kernel/printk/printk.c:3167:7: warning: Local variable cont shadows oute=
r variable [shadowVar]
    bool cont =3D false;
         ^
   kernel/printk/printk.c:1886:3: note: Shadowed declaration
   } cont[2];
     ^
   kernel/printk/printk.c:3167:7: note: Shadow variable
    bool cont =3D false;
         ^
   kernel/printk/printk.c:1009:18: warning: Shifting signed 32-bit value by=
 31 bits is undefined behaviour [shiftTooManyBitsSigned]
    if (size > (u64)LOG_BUF_LEN_MAX) {
                    ^
   kernel/printk/printk.c:1010:15: warning: Shifting signed 32-bit value by=
 31 bits is undefined behaviour [shiftTooManyBitsSigned]
     size =3D (u64)LOG_BUF_LEN_MAX;
                 ^
   kernel/printk/printk.c:588:27: warning: Clarify calculation precedence f=
or '&' and '?'. [clarifyCalculation]
       msg->flags & LOG_CONT ? 'c' : '-', caller, msg->cpu);
                             ^

# https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.git/com=
mit/?id=3Dc77295fa77cf4557b996828548f56727a27df87e
git remote add linux-rt-devel https://git.kernel.org/pub/scm/linux/kernel/g=
it/rt/linux-rt-devel.git
git remote update linux-rt-devel
git checkout c77295fa77cf4557b996828548f56727a27df87e
vim +3050 kernel/printk/printk.c

e2ae715d66bf4be kernel/printk.c        Kay Sievers     2012-06-15  3024  =

e2ae715d66bf4be kernel/printk.c        Kay Sievers     2012-06-15  3025  /**
533827c921c3431 kernel/printk.c        Anton Vorontsov 2012-07-20  3026   *=
 kmsg_dump_get_line_nolock - retrieve one kmsg log line (unlocked version)
e2ae715d66bf4be kernel/printk.c        Kay Sievers     2012-06-15  3027   *=
 @dumper: registered kmsg dumper
e2ae715d66bf4be kernel/printk.c        Kay Sievers     2012-06-15  3028   *=
 @syslog: include the "<4>" prefixes
e2ae715d66bf4be kernel/printk.c        Kay Sievers     2012-06-15  3029   *=
 @line: buffer to copy the line to
e2ae715d66bf4be kernel/printk.c        Kay Sievers     2012-06-15  3030   *=
 @size: maximum size of the buffer
e2ae715d66bf4be kernel/printk.c        Kay Sievers     2012-06-15  3031   *=
 @len: length of line placed into buffer
e2ae715d66bf4be kernel/printk.c        Kay Sievers     2012-06-15  3032   *
e2ae715d66bf4be kernel/printk.c        Kay Sievers     2012-06-15  3033   *=
 Start at the beginning of the kmsg buffer, with the oldest kmsg
e2ae715d66bf4be kernel/printk.c        Kay Sievers     2012-06-15  3034   *=
 record, and copy one record into the provided buffer.
e2ae715d66bf4be kernel/printk.c        Kay Sievers     2012-06-15  3035   *
e2ae715d66bf4be kernel/printk.c        Kay Sievers     2012-06-15  3036   *=
 Consecutive calls will return the next available record moving
e2ae715d66bf4be kernel/printk.c        Kay Sievers     2012-06-15  3037   *=
 towards the end of the buffer with the youngest messages.
e2ae715d66bf4be kernel/printk.c        Kay Sievers     2012-06-15  3038   *
e2ae715d66bf4be kernel/printk.c        Kay Sievers     2012-06-15  3039   *=
 A return value of FALSE indicates that there are no more records to
e2ae715d66bf4be kernel/printk.c        Kay Sievers     2012-06-15  3040   *=
 read.
533827c921c3431 kernel/printk.c        Anton Vorontsov 2012-07-20  3041   *
533827c921c3431 kernel/printk.c        Anton Vorontsov 2012-07-20  3042   *=
 The function is similar to kmsg_dump_get_line(), but grabs no locks.
e2ae715d66bf4be kernel/printk.c        Kay Sievers     2012-06-15  3043   */
533827c921c3431 kernel/printk.c        Anton Vorontsov 2012-07-20  3044  bo=
ol kmsg_dump_get_line_nolock(struct kmsg_dumper *dumper, bool syslog,
e2ae715d66bf4be kernel/printk.c        Kay Sievers     2012-06-15  3045  		=
	       char *line, size_t size, size_t *len)
e2ae715d66bf4be kernel/printk.c        Kay Sievers     2012-06-15  3046  {
c77295fa77cf455 kernel/printk/printk.c John Ogness     2019-02-12  3047  	s=
truct prb_iterator iter;
62e32ac3505a0ca kernel/printk/printk.c Joe Perches     2013-07-31  3048  	s=
truct printk_log *msg;
c77295fa77cf455 kernel/printk/printk.c John Ogness     2019-02-12  3049  	s=
truct prb_handle h;
c77295fa77cf455 kernel/printk/printk.c John Ogness     2019-02-12 @3050  	b=
ool cont =3D false;
c77295fa77cf455 kernel/printk/printk.c John Ogness     2019-02-12  3051  	c=
har *msgbuf;
c77295fa77cf455 kernel/printk/printk.c John Ogness     2019-02-12  3052  	c=
har *rbuf;
c77295fa77cf455 kernel/printk/printk.c John Ogness     2019-02-12  3053  	s=
ize_t l;
c77295fa77cf455 kernel/printk/printk.c John Ogness     2019-02-12  3054  	u=
64 seq;
c77295fa77cf455 kernel/printk/printk.c John Ogness     2019-02-12  3055  	i=
nt ret;
e2ae715d66bf4be kernel/printk.c        Kay Sievers     2012-06-15  3056  =

e2ae715d66bf4be kernel/printk.c        Kay Sievers     2012-06-15  3057  	i=
f (!dumper->active)
c77295fa77cf455 kernel/printk/printk.c John Ogness     2019-02-12  3058  		=
return cont;
456b565cc52fbcd kernel/printk.c        Simon Kagstrom  2009-10-16  3059  =

c77295fa77cf455 kernel/printk/printk.c John Ogness     2019-02-12  3060  	r=
buf =3D prb_reserve(&h, &sprint_rb, PRINTK_RECORD_MAX);
c77295fa77cf455 kernel/printk/printk.c John Ogness     2019-02-12  3061  	i=
f (!rbuf)
c77295fa77cf455 kernel/printk/printk.c John Ogness     2019-02-12  3062  		=
return cont;
c77295fa77cf455 kernel/printk/printk.c John Ogness     2019-02-12  3063  	m=
sgbuf =3D rbuf;
c77295fa77cf455 kernel/printk/printk.c John Ogness     2019-02-12  3064  re=
try:
c77295fa77cf455 kernel/printk/printk.c John Ogness     2019-02-12  3065  	f=
or (;;) {
c77295fa77cf455 kernel/printk/printk.c John Ogness     2019-02-12  3066  		=
prb_iter_init(&iter, &printk_rb, &seq);
c77295fa77cf455 kernel/printk/printk.c John Ogness     2019-02-12  3067  =

c77295fa77cf455 kernel/printk/printk.c John Ogness     2019-02-12  3068  		=
if (dumper->line_seq =3D=3D seq) {
c77295fa77cf455 kernel/printk/printk.c John Ogness     2019-02-12  3069  		=
	/* already where we want to be */
c77295fa77cf455 kernel/printk/printk.c John Ogness     2019-02-12  3070  		=
	break;
c77295fa77cf455 kernel/printk/printk.c John Ogness     2019-02-12  3071  		=
} else if (dumper->line_seq < seq) {
e2ae715d66bf4be kernel/printk.c        Kay Sievers     2012-06-15  3072  		=
	/* messages are gone, move to first available one */
c77295fa77cf455 kernel/printk/printk.c John Ogness     2019-02-12  3073  		=
	dumper->line_seq =3D seq;
c77295fa77cf455 kernel/printk/printk.c John Ogness     2019-02-12  3074  		=
	break;
456b565cc52fbcd kernel/printk.c        Simon Kagstrom  2009-10-16  3075  		}
e2ae715d66bf4be kernel/printk.c        Kay Sievers     2012-06-15  3076  =

c77295fa77cf455 kernel/printk/printk.c John Ogness     2019-02-12  3077  		=
ret =3D prb_iter_seek(&iter, dumper->line_seq);
c77295fa77cf455 kernel/printk/printk.c John Ogness     2019-02-12  3078  		=
if (ret > 0) {
c77295fa77cf455 kernel/printk/printk.c John Ogness     2019-02-12  3079  		=
	/* seeked to line_seq */
c77295fa77cf455 kernel/printk/printk.c John Ogness     2019-02-12  3080  		=
	break;
c77295fa77cf455 kernel/printk/printk.c John Ogness     2019-02-12  3081  		=
} else if (ret =3D=3D 0) {
c77295fa77cf455 kernel/printk/printk.c John Ogness     2019-02-12  3082  		=
	/*
c77295fa77cf455 kernel/printk/printk.c John Ogness     2019-02-12  3083  		=
	 * The end of the list was hit without ever seeing
c77295fa77cf455 kernel/printk/printk.c John Ogness     2019-02-12  3084  		=
	 * line_seq. Reset it to the beginning of the list.
c77295fa77cf455 kernel/printk/printk.c John Ogness     2019-02-12  3085  		=
	 */
c77295fa77cf455 kernel/printk/printk.c John Ogness     2019-02-12  3086  		=
	prb_iter_init(&iter, &printk_rb, &dumper->line_seq);
c77295fa77cf455 kernel/printk/printk.c John Ogness     2019-02-12  3087  		=
	break;
c77295fa77cf455 kernel/printk/printk.c John Ogness     2019-02-12  3088  		}
c77295fa77cf455 kernel/printk/printk.c John Ogness     2019-02-12  3089  		=
/* iterator invalid, start over */
c77295fa77cf455 kernel/printk/printk.c John Ogness     2019-02-12  3090  	}
c77295fa77cf455 kernel/printk/printk.c John Ogness     2019-02-12  3091  =

c77295fa77cf455 kernel/printk/printk.c John Ogness     2019-02-12  3092  	r=
et =3D prb_iter_next(&iter, msgbuf, PRINTK_RECORD_MAX,
c77295fa77cf455 kernel/printk/printk.c John Ogness     2019-02-12  3093  		=
	    &dumper->line_seq);
c77295fa77cf455 kernel/printk/printk.c John Ogness     2019-02-12  3094  	i=
f (ret =3D=3D 0)
e2ae715d66bf4be kernel/printk.c        Kay Sievers     2012-06-15  3095  		=
goto out;
c77295fa77cf455 kernel/printk/printk.c John Ogness     2019-02-12  3096  	e=
lse if (ret < 0)
c77295fa77cf455 kernel/printk/printk.c John Ogness     2019-02-12  3097  		=
goto retry;
456b565cc52fbcd kernel/printk.c        Simon Kagstrom  2009-10-16  3098  =

c77295fa77cf455 kernel/printk/printk.c John Ogness     2019-02-12  3099  	m=
sg =3D (struct printk_log *)msgbuf;
e80c1a9d5f514ce kernel/printk/printk.c Tetsuo Handa    2018-12-04  3100  	l=
 =3D msg_print_text(msg, syslog, printk_time, line, size);
e2ae715d66bf4be kernel/printk.c        Kay Sievers     2012-06-15  3101  =

e2ae715d66bf4be kernel/printk.c        Kay Sievers     2012-06-15  3102  	i=
f (len)
e2ae715d66bf4be kernel/printk.c        Kay Sievers     2012-06-15  3103  		=
*len =3D l;
c77295fa77cf455 kernel/printk/printk.c John Ogness     2019-02-12  3104  	c=
ont =3D true;
c77295fa77cf455 kernel/printk/printk.c John Ogness     2019-02-12  3105  ou=
t:
c77295fa77cf455 kernel/printk/printk.c John Ogness     2019-02-12  3106  	p=
rb_commit(&h);
c77295fa77cf455 kernel/printk/printk.c John Ogness     2019-02-12  3107  	r=
eturn cont;
e2ae715d66bf4be kernel/printk.c        Kay Sievers     2012-06-15  3108  }
533827c921c3431 kernel/printk.c        Anton Vorontsov 2012-07-20  3109  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============8850149699859635463==--

