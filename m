Content-Type: multipart/mixed; boundary="===============0993478256716625942=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/char/pcmcia/synclink_cs.c:1952:13: warning: use of uninitialized value '<unknown>' [CWE-457]
Date: Tue, 13 Sep 2022 04:45:50 +0800
Message-ID: <202209130421.tjA1I73U-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0993478256716625942==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check first_new_problem:=
 drivers/char/pcmcia/synclink_cs.c:1952:13: warning: use of uninitialized v=
alue '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Kees Cook <keescook@chromium.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   80e78fcce86de0288793a0ef0f6acf37656ee4cf
commit: f68f2ff91512c199ec24883001245912afc17873 fortify: Detect struct mem=
ber overflows in memcpy() at compile-time
date:   7 months ago
:::::: branch date: 24 hours ago
:::::: commit date: 7 months ago
config: arm-randconfig-c002-20220911 (https://download.01.org/0day-ci/archi=
ve/20220913/202209130421.tjA1I73U-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Df68f2ff91512c199ec24883001245912afc17873
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout f68f2ff91512c199ec24883001245912afc17873
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc_analyzer warnings: (new ones prefixed by >>)
   drivers/char/pcmcia/synclink_cs.c: In function 'wait_events':
>> drivers/char/pcmcia/synclink_cs.c:1952:13: warning: use of uninitialized=
 value '<unknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
    1952 |         int mask;
         |             ^~~~
     'mgslpc_ioctl': events 1-4
       |
       |  669 |         if (!info)
       |      |            ~
       |      |            |
       |      |            (2) following 'false' branch (when 'info' is non=
-NULL)...
       |......
       | 2219 | static int mgslpc_ioctl(struct tty_struct *tty,
       |      |            ^~~~~~~~~~~~
       |      |            |
       |      |            (1) entry to 'mgslpc_ioctl'
       |......
       | 2232 |         if (cmd !=3D TIOCMIWAIT) {
       |      |            ~
       |      |            |
       |      |            (3) ...to here
       |      |            (4) following 'true' branch (when 'cmd !=3D 2159=
6')...
       |
     'mgslpc_ioctl': event 5
       |
       |include/asm-generic/bitops/non-atomic.h:118:27:
       |  118 |         return 1UL & (addr[BIT_WORD(nr)] >> (nr & (BITS_PER=
_LONG-1)));
       |      |                       ~~~~^~~~~~~~~~~~~~
       |      |                           |
       |      |                           (5) ...to here
       |
     'mgslpc_ioctl': events 6-10
       |
       |drivers/char/pcmcia/synclink_cs.c:2233:20:
       | 2233 |                 if (tty_io_error(tty))
       |      |                    ^
       |      |                    |
       |      |                    (6) following 'false' branch...
       |......
       | 2237 |         switch (cmd) {
       |      |         ~~~~~~      =

       |      |         |
       |      |         (7) ...to here
       |      |         (8) following 'case 3221515528:' branch...
       |......
       | 2258 |         case MGSL_IOCWAITEVENT:
       |      |         ~~~~        =

       |      |         |
       |      |         (9) ...to here
       | 2259 |                 return wait_events(info, argp);
       |      |                        ~~~~~~~~~~~~~~~~~~~~~~~
       |      |                        |
       |      |                        (10) calling 'wait_events' from 'mgs=
lpc_ioctl'
       |
       +--> 'wait_events': events 11-12
              |
              | 1945 | static int wait_events(MGSLPC_INFO * info, int __use=
r *mask_ptr)
              |      |            ^~~~~~~~~~~
              |      |            |
              |      |            (11) entry to 'wait_events'
              |......
              | 1952 |         int mask;
              |      |             ~~~~
              |      |             |
              |      |             (12) use of uninitialized value '<unknow=
n>' here
              |
   In file included from include/linux/bitops.h:7,
                    from include/linux/log2.h:12,
                    from include/asm-generic/div64.h:55,
                    from arch/arm/include/asm/div64.h:107,
                    from include/linux/math.h:5,
                    from include/linux/math64.h:6,
                    from include/linux/time.h:6,
                    from include/linux/stat.h:19,
                    from include/linux/module.h:13,
                    from drivers/char/pcmcia/synclink_cs.c:38:
   drivers/char/pcmcia/synclink_cs.c: In function 'mgslpc_wait_until_sent':
   include/linux/typecheck.h:11:19: warning: use of uninitialized value '<u=
nknown>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
      11 |         typeof(x) __dummy2; \
         |                   ^~~~~~~~
   include/linux/jiffies.h:105:10: note: in expansion of macro 'typecheck'
     105 |         (typecheck(unsigned long, a) && \
         |          ^~~~~~~~~
   drivers/char/pcmcia/synclink_cs.c:2391:40: note: in expansion of macro '=
time_after'
    2391 |                         if (timeout && time_after(jiffies, orig_=
jiffies + timeout))
         |                                        ^~~~~~~~~~
     'mgslpc_wait_until_sent': event 1
       |
       | 2355 |         if (!info)
       |      |            ^
       |      |            |
       |      |            (1) following 'false' branch (when 'info' is non=
-NULL)...
       |
     'mgslpc_wait_until_sent': events 2-5
       |
       | 2358 |         if (debug_level >=3D DEBUG_LEVEL_INFO)
       |......
       | 2365 |         if (!tty_port_initialized(&info->port))
       |      |            ~             =

       |      |            |
       |      |            (3) following 'true' branch...
       |......
       | 2368 |         orig_jiffies =3D jiffies;

vim +1952 drivers/char/pcmcia/synclink_cs.c

^1da177e4c3f41 Linus Torvalds 2005-04-16  1936  =

^1da177e4c3f41 Linus Torvalds 2005-04-16  1937  /* wait for specified event=
 to occur
^1da177e4c3f41 Linus Torvalds 2005-04-16  1938   *
^1da177e4c3f41 Linus Torvalds 2005-04-16  1939   * Arguments:		info	pointer=
 to device instance data
^1da177e4c3f41 Linus Torvalds 2005-04-16  1940   *			mask	pointer to bitmas=
k of events to wait for
^1da177e4c3f41 Linus Torvalds 2005-04-16  1941   * Return Value:	0	if succe=
ssful and bit mask updated with
^1da177e4c3f41 Linus Torvalds 2005-04-16  1942   *				of events triggerred,
^1da177e4c3f41 Linus Torvalds 2005-04-16  1943   *			otherwise error code
^1da177e4c3f41 Linus Torvalds 2005-04-16  1944   */
^1da177e4c3f41 Linus Torvalds 2005-04-16  1945  static int wait_events(MGSL=
PC_INFO * info, int __user *mask_ptr)
^1da177e4c3f41 Linus Torvalds 2005-04-16  1946  {
^1da177e4c3f41 Linus Torvalds 2005-04-16  1947  	unsigned long flags;
^1da177e4c3f41 Linus Torvalds 2005-04-16  1948  	int s;
^1da177e4c3f41 Linus Torvalds 2005-04-16  1949  	int rc=3D0;
^1da177e4c3f41 Linus Torvalds 2005-04-16  1950  	struct mgsl_icount cprev, =
cnow;
^1da177e4c3f41 Linus Torvalds 2005-04-16  1951  	int events;
^1da177e4c3f41 Linus Torvalds 2005-04-16 @1952  	int mask;
^1da177e4c3f41 Linus Torvalds 2005-04-16  1953  	struct	_input_signal_event=
s oldsigs, newsigs;
^1da177e4c3f41 Linus Torvalds 2005-04-16  1954  	DECLARE_WAITQUEUE(wait, cu=
rrent);
^1da177e4c3f41 Linus Torvalds 2005-04-16  1955  =

^1da177e4c3f41 Linus Torvalds 2005-04-16  1956  	COPY_FROM_USER(rc,&mask, m=
ask_ptr, sizeof(int));
^1da177e4c3f41 Linus Torvalds 2005-04-16  1957  	if (rc)
^1da177e4c3f41 Linus Torvalds 2005-04-16  1958  		return  -EFAULT;
^1da177e4c3f41 Linus Torvalds 2005-04-16  1959  =

^1da177e4c3f41 Linus Torvalds 2005-04-16  1960  	if (debug_level >=3D DEBUG=
_LEVEL_INFO)
^1da177e4c3f41 Linus Torvalds 2005-04-16  1961  		printk("wait_events(%s,%d=
)\n", info->device_name, mask);
^1da177e4c3f41 Linus Torvalds 2005-04-16  1962  =

^1da177e4c3f41 Linus Torvalds 2005-04-16  1963  	spin_lock_irqsave(&info->l=
ock, flags);
^1da177e4c3f41 Linus Torvalds 2005-04-16  1964  =

^1da177e4c3f41 Linus Torvalds 2005-04-16  1965  	/* return immediately if s=
tate matches requested events */
^1da177e4c3f41 Linus Torvalds 2005-04-16  1966  	get_signals(info);
^1da177e4c3f41 Linus Torvalds 2005-04-16  1967  	s =3D info->serial_signals;
^1da177e4c3f41 Linus Torvalds 2005-04-16  1968  	events =3D mask &
^1da177e4c3f41 Linus Torvalds 2005-04-16  1969  		( ((s & SerialSignal_DSR)=
 ? MgslEvent_DsrActive:MgslEvent_DsrInactive) +
^1da177e4c3f41 Linus Torvalds 2005-04-16  1970  		  ((s & SerialSignal_DCD)=
 ? MgslEvent_DcdActive:MgslEvent_DcdInactive) +
^1da177e4c3f41 Linus Torvalds 2005-04-16  1971  		  ((s & SerialSignal_CTS)=
 ? MgslEvent_CtsActive:MgslEvent_CtsInactive) +
^1da177e4c3f41 Linus Torvalds 2005-04-16  1972  		  ((s & SerialSignal_RI) =
 ? MgslEvent_RiActive :MgslEvent_RiInactive) );
^1da177e4c3f41 Linus Torvalds 2005-04-16  1973  	if (events) {
^1da177e4c3f41 Linus Torvalds 2005-04-16  1974  		spin_unlock_irqrestore(&i=
nfo->lock, flags);
^1da177e4c3f41 Linus Torvalds 2005-04-16  1975  		goto exit;
^1da177e4c3f41 Linus Torvalds 2005-04-16  1976  	}
^1da177e4c3f41 Linus Torvalds 2005-04-16  1977  =

^1da177e4c3f41 Linus Torvalds 2005-04-16  1978  	/* save current irq counts=
 */
^1da177e4c3f41 Linus Torvalds 2005-04-16  1979  	cprev =3D info->icount;
^1da177e4c3f41 Linus Torvalds 2005-04-16  1980  	oldsigs =3D info->input_si=
gnal_events;
^1da177e4c3f41 Linus Torvalds 2005-04-16  1981  =

^1da177e4c3f41 Linus Torvalds 2005-04-16  1982  	if ((info->params.mode =3D=
=3D MGSL_MODE_HDLC) &&
^1da177e4c3f41 Linus Torvalds 2005-04-16  1983  	    (mask & MgslEvent_Exit=
HuntMode))
^1da177e4c3f41 Linus Torvalds 2005-04-16  1984  		irq_enable(info, CHA, IRQ=
_EXITHUNT);
^1da177e4c3f41 Linus Torvalds 2005-04-16  1985  =

^1da177e4c3f41 Linus Torvalds 2005-04-16  1986  	set_current_state(TASK_INT=
ERRUPTIBLE);
^1da177e4c3f41 Linus Torvalds 2005-04-16  1987  	add_wait_queue(&info->even=
t_wait_q, &wait);
^1da177e4c3f41 Linus Torvalds 2005-04-16  1988  =

^1da177e4c3f41 Linus Torvalds 2005-04-16  1989  	spin_unlock_irqrestore(&in=
fo->lock, flags);
^1da177e4c3f41 Linus Torvalds 2005-04-16  1990  =

^1da177e4c3f41 Linus Torvalds 2005-04-16  1991  =

^1da177e4c3f41 Linus Torvalds 2005-04-16  1992  	for(;;) {
^1da177e4c3f41 Linus Torvalds 2005-04-16  1993  		schedule();
^1da177e4c3f41 Linus Torvalds 2005-04-16  1994  		if (signal_pending(curren=
t)) {
^1da177e4c3f41 Linus Torvalds 2005-04-16  1995  			rc =3D -ERESTARTSYS;
^1da177e4c3f41 Linus Torvalds 2005-04-16  1996  			break;
^1da177e4c3f41 Linus Torvalds 2005-04-16  1997  		}
^1da177e4c3f41 Linus Torvalds 2005-04-16  1998  =

^1da177e4c3f41 Linus Torvalds 2005-04-16  1999  		/* get current irq counts=
 */
^1da177e4c3f41 Linus Torvalds 2005-04-16  2000  		spin_lock_irqsave(&info->=
lock, flags);
^1da177e4c3f41 Linus Torvalds 2005-04-16  2001  		cnow =3D info->icount;
^1da177e4c3f41 Linus Torvalds 2005-04-16  2002  		newsigs =3D info->input_s=
ignal_events;
^1da177e4c3f41 Linus Torvalds 2005-04-16  2003  		set_current_state(TASK_IN=
TERRUPTIBLE);
^1da177e4c3f41 Linus Torvalds 2005-04-16  2004  		spin_unlock_irqrestore(&i=
nfo->lock, flags);
^1da177e4c3f41 Linus Torvalds 2005-04-16  2005  =

^1da177e4c3f41 Linus Torvalds 2005-04-16  2006  		/* if no change, wait abo=
rted for some reason */
^1da177e4c3f41 Linus Torvalds 2005-04-16  2007  		if (newsigs.dsr_up   =3D=
=3D oldsigs.dsr_up   &&
^1da177e4c3f41 Linus Torvalds 2005-04-16  2008  		    newsigs.dsr_down =3D=
=3D oldsigs.dsr_down &&
^1da177e4c3f41 Linus Torvalds 2005-04-16  2009  		    newsigs.dcd_up   =3D=
=3D oldsigs.dcd_up   &&
^1da177e4c3f41 Linus Torvalds 2005-04-16  2010  		    newsigs.dcd_down =3D=
=3D oldsigs.dcd_down &&
^1da177e4c3f41 Linus Torvalds 2005-04-16  2011  		    newsigs.cts_up   =3D=
=3D oldsigs.cts_up   &&
^1da177e4c3f41 Linus Torvalds 2005-04-16  2012  		    newsigs.cts_down =3D=
=3D oldsigs.cts_down &&
^1da177e4c3f41 Linus Torvalds 2005-04-16  2013  		    newsigs.ri_up    =3D=
=3D oldsigs.ri_up    &&
^1da177e4c3f41 Linus Torvalds 2005-04-16  2014  		    newsigs.ri_down  =3D=
=3D oldsigs.ri_down  &&
^1da177e4c3f41 Linus Torvalds 2005-04-16  2015  		    cnow.exithunt    =3D=
=3D cprev.exithunt   &&
^1da177e4c3f41 Linus Torvalds 2005-04-16  2016  		    cnow.rxidle      =3D=
=3D cprev.rxidle) {
^1da177e4c3f41 Linus Torvalds 2005-04-16  2017  			rc =3D -EIO;
^1da177e4c3f41 Linus Torvalds 2005-04-16  2018  			break;
^1da177e4c3f41 Linus Torvalds 2005-04-16  2019  		}
^1da177e4c3f41 Linus Torvalds 2005-04-16  2020  =

^1da177e4c3f41 Linus Torvalds 2005-04-16  2021  		events =3D mask &
^1da177e4c3f41 Linus Torvalds 2005-04-16  2022  			( (newsigs.dsr_up   !=3D=
 oldsigs.dsr_up   ? MgslEvent_DsrActive:0)   +
^1da177e4c3f41 Linus Torvalds 2005-04-16  2023  			  (newsigs.dsr_down !=3D=
 oldsigs.dsr_down ? MgslEvent_DsrInactive:0) +
^1da177e4c3f41 Linus Torvalds 2005-04-16  2024  			  (newsigs.dcd_up   !=3D=
 oldsigs.dcd_up   ? MgslEvent_DcdActive:0)   +
^1da177e4c3f41 Linus Torvalds 2005-04-16  2025  			  (newsigs.dcd_down !=3D=
 oldsigs.dcd_down ? MgslEvent_DcdInactive:0) +
^1da177e4c3f41 Linus Torvalds 2005-04-16  2026  			  (newsigs.cts_up   !=3D=
 oldsigs.cts_up   ? MgslEvent_CtsActive:0)   +
^1da177e4c3f41 Linus Torvalds 2005-04-16  2027  			  (newsigs.cts_down !=3D=
 oldsigs.cts_down ? MgslEvent_CtsInactive:0) +
^1da177e4c3f41 Linus Torvalds 2005-04-16  2028  			  (newsigs.ri_up    !=3D=
 oldsigs.ri_up    ? MgslEvent_RiActive:0)    +
^1da177e4c3f41 Linus Torvalds 2005-04-16  2029  			  (newsigs.ri_down  !=3D=
 oldsigs.ri_down  ? MgslEvent_RiInactive:0)  +
^1da177e4c3f41 Linus Torvalds 2005-04-16  2030  			  (cnow.exithunt    !=3D=
 cprev.exithunt   ? MgslEvent_ExitHuntMode:0) +
^1da177e4c3f41 Linus Torvalds 2005-04-16  2031  			  (cnow.rxidle      !=3D=
 cprev.rxidle     ? MgslEvent_IdleReceived:0) );
^1da177e4c3f41 Linus Torvalds 2005-04-16  2032  		if (events)
^1da177e4c3f41 Linus Torvalds 2005-04-16  2033  			break;
^1da177e4c3f41 Linus Torvalds 2005-04-16  2034  =

^1da177e4c3f41 Linus Torvalds 2005-04-16  2035  		cprev =3D cnow;
^1da177e4c3f41 Linus Torvalds 2005-04-16  2036  		oldsigs =3D newsigs;
^1da177e4c3f41 Linus Torvalds 2005-04-16  2037  	}
^1da177e4c3f41 Linus Torvalds 2005-04-16  2038  =

^1da177e4c3f41 Linus Torvalds 2005-04-16  2039  	remove_wait_queue(&info->e=
vent_wait_q, &wait);
^1da177e4c3f41 Linus Torvalds 2005-04-16  2040  	set_current_state(TASK_RUN=
NING);
^1da177e4c3f41 Linus Torvalds 2005-04-16  2041  =

^1da177e4c3f41 Linus Torvalds 2005-04-16  2042  	if (mask & MgslEvent_ExitH=
untMode) {
^1da177e4c3f41 Linus Torvalds 2005-04-16  2043  		spin_lock_irqsave(&info->=
lock, flags);
^1da177e4c3f41 Linus Torvalds 2005-04-16  2044  		if (!waitqueue_active(&in=
fo->event_wait_q))
^1da177e4c3f41 Linus Torvalds 2005-04-16  2045  			irq_disable(info, CHA, I=
RQ_EXITHUNT);
^1da177e4c3f41 Linus Torvalds 2005-04-16  2046  		spin_unlock_irqrestore(&i=
nfo->lock, flags);
^1da177e4c3f41 Linus Torvalds 2005-04-16  2047  	}
^1da177e4c3f41 Linus Torvalds 2005-04-16  2048  exit:
^1da177e4c3f41 Linus Torvalds 2005-04-16  2049  	if (rc =3D=3D 0)
^1da177e4c3f41 Linus Torvalds 2005-04-16  2050  		PUT_USER(rc, events, mask=
_ptr);
^1da177e4c3f41 Linus Torvalds 2005-04-16  2051  	return rc;
^1da177e4c3f41 Linus Torvalds 2005-04-16  2052  }
^1da177e4c3f41 Linus Torvalds 2005-04-16  2053  =


:::::: The code at line 1952 was first introduced by commit
:::::: 1da177e4c3f41524e886b7f1b8a0c1fc7321cac2 Linux-2.6.12-rc2

:::::: TO: Linus Torvalds <torvalds@ppc970.osdl.org>
:::::: CC: Linus Torvalds <torvalds@ppc970.osdl.org>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0993478256716625942==--

