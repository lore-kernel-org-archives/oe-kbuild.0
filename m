Content-Type: multipart/mixed; boundary="===============3719827598051587200=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/rtc/dev.c:401:30: warning: use of uninitialized value '<unknown>' [CWE-457]
Date: Sat, 13 Aug 2022 23:31:28 +0800
Message-ID: <202208132313.MyHRFYLD-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3719827598051587200==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: drivers/r=
tc/dev.c:401:30: warning: use of uninitialized value '<unknown>' [CWE-457] =
[-Wanalyzer-use-of-uninitialized-value]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Kees Cook <keescook@chromium.org>
CC: Alexandre Belloni <alexandre.belloni@bootlin.com>
CC: "Gustavo A. R. Silva" <gustavoars@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   69dac8e431af26173ca0a1ebc87054e01c585bcc
commit: ba52eac083e1598e748811ff58d259f77e4c5c4d rtc: Move variable into sw=
itch case statement
date:   7 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 7 months ago
config: arm-randconfig-c002-20220810 (https://download.01.org/0day-ci/archi=
ve/20220813/202208132313.MyHRFYLD-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dba52eac083e1598e748811ff58d259f77e4c5c4d
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout ba52eac083e1598e748811ff58d259f77e4c5c4d
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc-analyzer warnings: (new ones prefixed by >>)
   drivers/rtc/dev.c: In function 'rtc_dev_ioctl':
>> drivers/rtc/dev.c:401:30: warning: use of uninitialized value '<unknown>=
' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     401 |                         long offset;
         |                              ^~~~~~
     'rtc_dev_ioctl': events 1-3
       |
       |  215 |         if (err)
       |      |            ^
       |      |            |
       |      |            (1) following 'false' branch (when 'err =3D=3D 0=
')...
       |......
       |  256 |         switch (cmd) {
       |      |         ~~~~~~
       |      |         |
       |      |         (2) ...to here
       |      |         (3) following 'case 1075343379:' branch...
       |
     'rtc_dev_ioctl': event 4
       |
       |include/linux/uaccess.h:192:21:
       |  192 |                 n =3D _copy_from_user(to, from, n);
       |      |                     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                     |
       |      |                     (4) ...to here
       |
     'rtc_dev_ioctl': events 5-6
       |
       |drivers/rtc/dev.c:388:20:
       |  388 |                 if (copy_from_user(&param, uarg, sizeof(par=
am))) {
       |      |                    ^
       |      |                    |
       |      |                    (5) following 'false' branch (when 'n =
=3D=3D 0')...
       |......
       |  393 |                 switch(param.param) {
       |      |                        ~~~~~~~~~~~
       |      |                             |
       |      |                             (6) ...to here
       |
     'rtc_dev_ioctl': event 7
       |
       |cc1:
       | (7): following 'case 1:' branch...
       |
     'rtc_dev_ioctl': events 8-9
       |
       |  400 |                 case RTC_PARAM_CORRECTION: {
       |      |                 ^~~~
       |      |                 |
       |      |                 (8) ...to here
       |  401 |                         long offset;
       |      |                              ~~~~~~
       |      |                              |
       |      |                              (9) use of uninitialized value=
 '<unknown>' here
       |

vim +401 drivers/rtc/dev.c

e824290e5dcfaf drivers/rtc/rtc-dev.c Alessandro Zummo  2006-03-27  202  =

5ad31a57515714 drivers/rtc/rtc-dev.c David Brownell    2008-07-23  203  sta=
tic long rtc_dev_ioctl(struct file *file,
e824290e5dcfaf drivers/rtc/rtc-dev.c Alessandro Zummo  2006-03-27  204  			=
  unsigned int cmd, unsigned long arg)
e824290e5dcfaf drivers/rtc/rtc-dev.c Alessandro Zummo  2006-03-27  205  {
e824290e5dcfaf drivers/rtc/rtc-dev.c Alessandro Zummo  2006-03-27  206  	in=
t err =3D 0;
ab6a2d70d18edc drivers/rtc/rtc-dev.c David Brownell    2007-05-08  207  	st=
ruct rtc_device *rtc =3D file->private_data;
ff8371ac9a5a55 drivers/rtc/rtc-dev.c David Brownell    2006-09-30  208  	co=
nst struct rtc_class_ops *ops =3D rtc->ops;
e824290e5dcfaf drivers/rtc/rtc-dev.c Alessandro Zummo  2006-03-27  209  	st=
ruct rtc_time tm;
e824290e5dcfaf drivers/rtc/rtc-dev.c Alessandro Zummo  2006-03-27  210  	st=
ruct rtc_wkalrm alarm;
6a8af1b6568ad9 drivers/rtc/dev.c     Alexandre Belloni 2021-10-18  211  	st=
ruct rtc_param param;
e824290e5dcfaf drivers/rtc/rtc-dev.c Alessandro Zummo  2006-03-27  212  	vo=
id __user *uarg =3D (void __user *)arg;
e824290e5dcfaf drivers/rtc/rtc-dev.c Alessandro Zummo  2006-03-27  213  =

5ad31a57515714 drivers/rtc/rtc-dev.c David Brownell    2008-07-23  214  	er=
r =3D mutex_lock_interruptible(&rtc->ops_lock);
5ad31a57515714 drivers/rtc/rtc-dev.c David Brownell    2008-07-23  215  	if=
 (err)
b68bb2632453a9 drivers/rtc/rtc-dev.c David Brownell    2008-07-29  216  		r=
eturn err;
5ad31a57515714 drivers/rtc/rtc-dev.c David Brownell    2008-07-23  217  =

2601a46474db2d drivers/rtc/rtc-dev.c David Brownell    2006-11-25  218  	/*=
 check that the calling task has appropriate permissions
110d693d589864 drivers/rtc/rtc-dev.c Alessandro Zummo  2006-06-25  219  	 *=
 for certain ioctls. doing this check here is useful
110d693d589864 drivers/rtc/rtc-dev.c Alessandro Zummo  2006-06-25  220  	 *=
 to avoid duplicate code in each driver.
110d693d589864 drivers/rtc/rtc-dev.c Alessandro Zummo  2006-06-25  221  	 */
110d693d589864 drivers/rtc/rtc-dev.c Alessandro Zummo  2006-06-25  222  	sw=
itch (cmd) {
110d693d589864 drivers/rtc/rtc-dev.c Alessandro Zummo  2006-06-25  223  	ca=
se RTC_EPOCH_SET:
110d693d589864 drivers/rtc/rtc-dev.c Alessandro Zummo  2006-06-25  224  	ca=
se RTC_SET_TIME:
6a8af1b6568ad9 drivers/rtc/dev.c     Alexandre Belloni 2021-10-18  225  	ca=
se RTC_PARAM_SET:
110d693d589864 drivers/rtc/rtc-dev.c Alessandro Zummo  2006-06-25  226  		i=
f (!capable(CAP_SYS_TIME))
5ad31a57515714 drivers/rtc/rtc-dev.c David Brownell    2008-07-23  227  			=
err =3D -EACCES;
110d693d589864 drivers/rtc/rtc-dev.c Alessandro Zummo  2006-06-25  228  		b=
reak;
110d693d589864 drivers/rtc/rtc-dev.c Alessandro Zummo  2006-06-25  229  =

110d693d589864 drivers/rtc/rtc-dev.c Alessandro Zummo  2006-06-25  230  	ca=
se RTC_IRQP_SET:
110d693d589864 drivers/rtc/rtc-dev.c Alessandro Zummo  2006-06-25  231  		i=
f (arg > rtc->max_user_freq && !capable(CAP_SYS_RESOURCE))
5ad31a57515714 drivers/rtc/rtc-dev.c David Brownell    2008-07-23  232  			=
err =3D -EACCES;
110d693d589864 drivers/rtc/rtc-dev.c Alessandro Zummo  2006-06-25  233  		b=
reak;
110d693d589864 drivers/rtc/rtc-dev.c Alessandro Zummo  2006-06-25  234  =

110d693d589864 drivers/rtc/rtc-dev.c Alessandro Zummo  2006-06-25  235  	ca=
se RTC_PIE_ON:
9d013d3b14f4c8 drivers/rtc/rtc-dev.c Bryan Kadzban     2007-10-16  236  		i=
f (rtc->irq_freq > rtc->max_user_freq &&
9d013d3b14f4c8 drivers/rtc/rtc-dev.c Bryan Kadzban     2007-10-16  237  		 =
   !capable(CAP_SYS_RESOURCE))
5ad31a57515714 drivers/rtc/rtc-dev.c David Brownell    2008-07-23  238  			=
err =3D -EACCES;
110d693d589864 drivers/rtc/rtc-dev.c Alessandro Zummo  2006-06-25  239  		b=
reak;
110d693d589864 drivers/rtc/rtc-dev.c Alessandro Zummo  2006-06-25  240  	}
110d693d589864 drivers/rtc/rtc-dev.c Alessandro Zummo  2006-06-25  241  =

5ad31a57515714 drivers/rtc/rtc-dev.c David Brownell    2008-07-23  242  	if=
 (err)
5ad31a57515714 drivers/rtc/rtc-dev.c David Brownell    2008-07-23  243  		g=
oto done;
5ad31a57515714 drivers/rtc/rtc-dev.c David Brownell    2008-07-23  244  =

ac54cd2bd5b4db drivers/rtc/rtc-dev.c John Stultz       2011-02-02  245  	/*
8a0bdfd7a05f5b drivers/rtc/rtc-dev.c David Brownell    2008-02-06  246  	 *=
 Drivers *SHOULD NOT* provide ioctl implementations
8a0bdfd7a05f5b drivers/rtc/rtc-dev.c David Brownell    2008-02-06  247  	 *=
 for these requests.  Instead, provide methods to
8a0bdfd7a05f5b drivers/rtc/rtc-dev.c David Brownell    2008-02-06  248  	 *=
 support the following code, so that the RTC's main
8a0bdfd7a05f5b drivers/rtc/rtc-dev.c David Brownell    2008-02-06  249  	 *=
 features are accessible without using ioctls.
8a0bdfd7a05f5b drivers/rtc/rtc-dev.c David Brownell    2008-02-06  250  	 *
8a0bdfd7a05f5b drivers/rtc/rtc-dev.c David Brownell    2008-02-06  251  	 *=
 RTC and alarm times will be in UTC, by preference,
8a0bdfd7a05f5b drivers/rtc/rtc-dev.c David Brownell    2008-02-06  252  	 *=
 but dual-booting with MS-Windows implies RTCs must
8a0bdfd7a05f5b drivers/rtc/rtc-dev.c David Brownell    2008-02-06  253  	 *=
 use the local wall clock time.
e824290e5dcfaf drivers/rtc/rtc-dev.c Alessandro Zummo  2006-03-27  254  	 */
e824290e5dcfaf drivers/rtc/rtc-dev.c Alessandro Zummo  2006-03-27  255  =

e824290e5dcfaf drivers/rtc/rtc-dev.c Alessandro Zummo  2006-03-27  256  	sw=
itch (cmd) {
e824290e5dcfaf drivers/rtc/rtc-dev.c Alessandro Zummo  2006-03-27  257  	ca=
se RTC_ALM_READ:
5ad31a57515714 drivers/rtc/rtc-dev.c David Brownell    2008-07-23  258  		m=
utex_unlock(&rtc->ops_lock);
5ad31a57515714 drivers/rtc/rtc-dev.c David Brownell    2008-07-23  259  =

ab6a2d70d18edc drivers/rtc/rtc-dev.c David Brownell    2007-05-08  260  		e=
rr =3D rtc_read_alarm(rtc, &alarm);
e824290e5dcfaf drivers/rtc/rtc-dev.c Alessandro Zummo  2006-03-27  261  		i=
f (err < 0)
e824290e5dcfaf drivers/rtc/rtc-dev.c Alessandro Zummo  2006-03-27  262  			=
return err;
e824290e5dcfaf drivers/rtc/rtc-dev.c Alessandro Zummo  2006-03-27  263  =

e824290e5dcfaf drivers/rtc/rtc-dev.c Alessandro Zummo  2006-03-27  264  		i=
f (copy_to_user(uarg, &alarm.time, sizeof(tm)))
5ad31a57515714 drivers/rtc/rtc-dev.c David Brownell    2008-07-23  265  			=
err =3D -EFAULT;
5ad31a57515714 drivers/rtc/rtc-dev.c David Brownell    2008-07-23  266  		r=
eturn err;
e824290e5dcfaf drivers/rtc/rtc-dev.c Alessandro Zummo  2006-03-27  267  =

e824290e5dcfaf drivers/rtc/rtc-dev.c Alessandro Zummo  2006-03-27  268  	ca=
se RTC_ALM_SET:
5ad31a57515714 drivers/rtc/rtc-dev.c David Brownell    2008-07-23  269  		m=
utex_unlock(&rtc->ops_lock);
5ad31a57515714 drivers/rtc/rtc-dev.c David Brownell    2008-07-23  270  =

e824290e5dcfaf drivers/rtc/rtc-dev.c Alessandro Zummo  2006-03-27  271  		i=
f (copy_from_user(&alarm.time, uarg, sizeof(tm)))
e824290e5dcfaf drivers/rtc/rtc-dev.c Alessandro Zummo  2006-03-27  272  			=
return -EFAULT;
e824290e5dcfaf drivers/rtc/rtc-dev.c Alessandro Zummo  2006-03-27  273  =

e824290e5dcfaf drivers/rtc/rtc-dev.c Alessandro Zummo  2006-03-27  274  		a=
larm.enabled =3D 0;
e824290e5dcfaf drivers/rtc/rtc-dev.c Alessandro Zummo  2006-03-27  275  		a=
larm.pending =3D 0;
e824290e5dcfaf drivers/rtc/rtc-dev.c Alessandro Zummo  2006-03-27  276  		a=
larm.time.tm_wday =3D -1;
e824290e5dcfaf drivers/rtc/rtc-dev.c Alessandro Zummo  2006-03-27  277  		a=
larm.time.tm_yday =3D -1;
e824290e5dcfaf drivers/rtc/rtc-dev.c Alessandro Zummo  2006-03-27  278  		a=
larm.time.tm_isdst =3D -1;
f8245c26886c91 drivers/rtc/rtc-dev.c David Brownell    2007-05-08  279  =

f8245c26886c91 drivers/rtc/rtc-dev.c David Brownell    2007-05-08  280  		/=
* RTC_ALM_SET alarms may be up to 24 hours in the future.
f8245c26886c91 drivers/rtc/rtc-dev.c David Brownell    2007-05-08  281  		 =
* Rather than expecting every RTC to implement "don't care"
f8245c26886c91 drivers/rtc/rtc-dev.c David Brownell    2007-05-08  282  		 =
* for day/month/year fields, just force the alarm to have
f8245c26886c91 drivers/rtc/rtc-dev.c David Brownell    2007-05-08  283  		 =
* the right values for those fields.
f8245c26886c91 drivers/rtc/rtc-dev.c David Brownell    2007-05-08  284  		 *
f8245c26886c91 drivers/rtc/rtc-dev.c David Brownell    2007-05-08  285  		 =
* RTC_WKALM_SET should be used instead.  Not only does it
f8245c26886c91 drivers/rtc/rtc-dev.c David Brownell    2007-05-08  286  		 =
* eliminate the need for a separate RTC_AIE_ON call, it
f8245c26886c91 drivers/rtc/rtc-dev.c David Brownell    2007-05-08  287  		 =
* doesn't have the "alarm 23:59:59 in the future" race.
f8245c26886c91 drivers/rtc/rtc-dev.c David Brownell    2007-05-08  288  		 *
f8245c26886c91 drivers/rtc/rtc-dev.c David Brownell    2007-05-08  289  		 =
* NOTE:  some legacy code may have used invalid fields as
f8245c26886c91 drivers/rtc/rtc-dev.c David Brownell    2007-05-08  290  		 =
* wildcards, exposing hardware "periodic alarm" capabilities.
f8245c26886c91 drivers/rtc/rtc-dev.c David Brownell    2007-05-08  291  		 =
* Not supported here.
f8245c26886c91 drivers/rtc/rtc-dev.c David Brownell    2007-05-08  292  		 =
*/
f8245c26886c91 drivers/rtc/rtc-dev.c David Brownell    2007-05-08  293  		{
4ec2364f491023 drivers/rtc/rtc-dev.c Xunlei Pang       2015-01-22  294  			=
time64_t now, then;
f8245c26886c91 drivers/rtc/rtc-dev.c David Brownell    2007-05-08  295  =

f8245c26886c91 drivers/rtc/rtc-dev.c David Brownell    2007-05-08  296  			=
err =3D rtc_read_time(rtc, &tm);
f8245c26886c91 drivers/rtc/rtc-dev.c David Brownell    2007-05-08  297  			=
if (err < 0)
f8245c26886c91 drivers/rtc/rtc-dev.c David Brownell    2007-05-08  298  			=
	return err;
4ec2364f491023 drivers/rtc/rtc-dev.c Xunlei Pang       2015-01-22  299  			=
now =3D rtc_tm_to_time64(&tm);
f8245c26886c91 drivers/rtc/rtc-dev.c David Brownell    2007-05-08  300  =

f8245c26886c91 drivers/rtc/rtc-dev.c David Brownell    2007-05-08  301  			=
alarm.time.tm_mday =3D tm.tm_mday;
f8245c26886c91 drivers/rtc/rtc-dev.c David Brownell    2007-05-08  302  			=
alarm.time.tm_mon =3D tm.tm_mon;
f8245c26886c91 drivers/rtc/rtc-dev.c David Brownell    2007-05-08  303  			=
alarm.time.tm_year =3D tm.tm_year;
f8245c26886c91 drivers/rtc/rtc-dev.c David Brownell    2007-05-08  304  			=
err  =3D rtc_valid_tm(&alarm.time);
f8245c26886c91 drivers/rtc/rtc-dev.c David Brownell    2007-05-08  305  			=
if (err < 0)
f8245c26886c91 drivers/rtc/rtc-dev.c David Brownell    2007-05-08  306  			=
	return err;
4ec2364f491023 drivers/rtc/rtc-dev.c Xunlei Pang       2015-01-22  307  			=
then =3D rtc_tm_to_time64(&alarm.time);
f8245c26886c91 drivers/rtc/rtc-dev.c David Brownell    2007-05-08  308  =

f8245c26886c91 drivers/rtc/rtc-dev.c David Brownell    2007-05-08  309  			=
/* alarm may need to wrap into tomorrow */
f8245c26886c91 drivers/rtc/rtc-dev.c David Brownell    2007-05-08  310  			=
if (then < now) {
4ec2364f491023 drivers/rtc/rtc-dev.c Xunlei Pang       2015-01-22  311  			=
	rtc_time64_to_tm(now + 24 * 60 * 60, &tm);
f8245c26886c91 drivers/rtc/rtc-dev.c David Brownell    2007-05-08  312  			=
	alarm.time.tm_mday =3D tm.tm_mday;
f8245c26886c91 drivers/rtc/rtc-dev.c David Brownell    2007-05-08  313  			=
	alarm.time.tm_mon =3D tm.tm_mon;
f8245c26886c91 drivers/rtc/rtc-dev.c David Brownell    2007-05-08  314  			=
	alarm.time.tm_year =3D tm.tm_year;
f8245c26886c91 drivers/rtc/rtc-dev.c David Brownell    2007-05-08  315  			}
f8245c26886c91 drivers/rtc/rtc-dev.c David Brownell    2007-05-08  316  		}
f8245c26886c91 drivers/rtc/rtc-dev.c David Brownell    2007-05-08  317  =

5ad31a57515714 drivers/rtc/rtc-dev.c David Brownell    2008-07-23  318  		r=
eturn rtc_set_alarm(rtc, &alarm);
e824290e5dcfaf drivers/rtc/rtc-dev.c Alessandro Zummo  2006-03-27  319  =

e824290e5dcfaf drivers/rtc/rtc-dev.c Alessandro Zummo  2006-03-27  320  	ca=
se RTC_RD_TIME:
5ad31a57515714 drivers/rtc/rtc-dev.c David Brownell    2008-07-23  321  		m=
utex_unlock(&rtc->ops_lock);
5ad31a57515714 drivers/rtc/rtc-dev.c David Brownell    2008-07-23  322  =

ab6a2d70d18edc drivers/rtc/rtc-dev.c David Brownell    2007-05-08  323  		e=
rr =3D rtc_read_time(rtc, &tm);
e824290e5dcfaf drivers/rtc/rtc-dev.c Alessandro Zummo  2006-03-27  324  		i=
f (err < 0)
e824290e5dcfaf drivers/rtc/rtc-dev.c Alessandro Zummo  2006-03-27  325  			=
return err;
e824290e5dcfaf drivers/rtc/rtc-dev.c Alessandro Zummo  2006-03-27  326  =

e824290e5dcfaf drivers/rtc/rtc-dev.c Alessandro Zummo  2006-03-27  327  		i=
f (copy_to_user(uarg, &tm, sizeof(tm)))
5ad31a57515714 drivers/rtc/rtc-dev.c David Brownell    2008-07-23  328  			=
err =3D -EFAULT;
5ad31a57515714 drivers/rtc/rtc-dev.c David Brownell    2008-07-23  329  		r=
eturn err;
e824290e5dcfaf drivers/rtc/rtc-dev.c Alessandro Zummo  2006-03-27  330  =

e824290e5dcfaf drivers/rtc/rtc-dev.c Alessandro Zummo  2006-03-27  331  	ca=
se RTC_SET_TIME:
5ad31a57515714 drivers/rtc/rtc-dev.c David Brownell    2008-07-23  332  		m=
utex_unlock(&rtc->ops_lock);
5ad31a57515714 drivers/rtc/rtc-dev.c David Brownell    2008-07-23  333  =

e824290e5dcfaf drivers/rtc/rtc-dev.c Alessandro Zummo  2006-03-27  334  		i=
f (copy_from_user(&tm, uarg, sizeof(tm)))
e824290e5dcfaf drivers/rtc/rtc-dev.c Alessandro Zummo  2006-03-27  335  			=
return -EFAULT;
e824290e5dcfaf drivers/rtc/rtc-dev.c Alessandro Zummo  2006-03-27  336  =

5ad31a57515714 drivers/rtc/rtc-dev.c David Brownell    2008-07-23  337  		r=
eturn rtc_set_time(rtc, &tm);
2601a46474db2d drivers/rtc/rtc-dev.c David Brownell    2006-11-25  338  =

d691eb901e0440 drivers/rtc/rtc-dev.c Alessandro Zummo  2007-10-16  339  	ca=
se RTC_PIE_ON:
8719d3c9188b38 drivers/rtc/rtc-dev.c Alexandre Belloni 2018-07-25  340  		e=
rr =3D rtc_irq_set_state(rtc, 1);
d691eb901e0440 drivers/rtc/rtc-dev.c Alessandro Zummo  2007-10-16  341  		b=
reak;
d691eb901e0440 drivers/rtc/rtc-dev.c Alessandro Zummo  2007-10-16  342  =

d691eb901e0440 drivers/rtc/rtc-dev.c Alessandro Zummo  2007-10-16  343  	ca=
se RTC_PIE_OFF:
8719d3c9188b38 drivers/rtc/rtc-dev.c Alexandre Belloni 2018-07-25  344  		e=
rr =3D rtc_irq_set_state(rtc, 0);
2601a46474db2d drivers/rtc/rtc-dev.c David Brownell    2006-11-25  345  		b=
reak;
2601a46474db2d drivers/rtc/rtc-dev.c David Brownell    2006-11-25  346  =

099e657625e801 drivers/rtc/rtc-dev.c Alessandro Zummo  2009-01-04  347  	ca=
se RTC_AIE_ON:
099e657625e801 drivers/rtc/rtc-dev.c Alessandro Zummo  2009-01-04  348  		m=
utex_unlock(&rtc->ops_lock);
099e657625e801 drivers/rtc/rtc-dev.c Alessandro Zummo  2009-01-04  349  		r=
eturn rtc_alarm_irq_enable(rtc, 1);
099e657625e801 drivers/rtc/rtc-dev.c Alessandro Zummo  2009-01-04  350  =

099e657625e801 drivers/rtc/rtc-dev.c Alessandro Zummo  2009-01-04  351  	ca=
se RTC_AIE_OFF:
099e657625e801 drivers/rtc/rtc-dev.c Alessandro Zummo  2009-01-04  352  		m=
utex_unlock(&rtc->ops_lock);
099e657625e801 drivers/rtc/rtc-dev.c Alessandro Zummo  2009-01-04  353  		r=
eturn rtc_alarm_irq_enable(rtc, 0);
099e657625e801 drivers/rtc/rtc-dev.c Alessandro Zummo  2009-01-04  354  =

099e657625e801 drivers/rtc/rtc-dev.c Alessandro Zummo  2009-01-04  355  	ca=
se RTC_UIE_ON:
099e657625e801 drivers/rtc/rtc-dev.c Alessandro Zummo  2009-01-04  356  		m=
utex_unlock(&rtc->ops_lock);
099e657625e801 drivers/rtc/rtc-dev.c Alessandro Zummo  2009-01-04  357  		r=
eturn rtc_update_irq_enable(rtc, 1);
099e657625e801 drivers/rtc/rtc-dev.c Alessandro Zummo  2009-01-04  358  =

099e657625e801 drivers/rtc/rtc-dev.c Alessandro Zummo  2009-01-04  359  	ca=
se RTC_UIE_OFF:
099e657625e801 drivers/rtc/rtc-dev.c Alessandro Zummo  2009-01-04  360  		m=
utex_unlock(&rtc->ops_lock);
099e657625e801 drivers/rtc/rtc-dev.c Alessandro Zummo  2009-01-04  361  		r=
eturn rtc_update_irq_enable(rtc, 0);
099e657625e801 drivers/rtc/rtc-dev.c Alessandro Zummo  2009-01-04  362  =

2601a46474db2d drivers/rtc/rtc-dev.c David Brownell    2006-11-25  363  	ca=
se RTC_IRQP_SET:
8719d3c9188b38 drivers/rtc/rtc-dev.c Alexandre Belloni 2018-07-25  364  		e=
rr =3D rtc_irq_set_freq(rtc, arg);
d691eb901e0440 drivers/rtc/rtc-dev.c Alessandro Zummo  2007-10-16  365  		b=
reak;
d691eb901e0440 drivers/rtc/rtc-dev.c Alessandro Zummo  2007-10-16  366  	ca=
se RTC_IRQP_READ:
d691eb901e0440 drivers/rtc/rtc-dev.c Alessandro Zummo  2007-10-16  367  		e=
rr =3D put_user(rtc->irq_freq, (unsigned long __user *)uarg);
2601a46474db2d drivers/rtc/rtc-dev.c David Brownell    2006-11-25  368  		b=
reak;
2601a46474db2d drivers/rtc/rtc-dev.c David Brownell    2006-11-25  369  =

e824290e5dcfaf drivers/rtc/rtc-dev.c Alessandro Zummo  2006-03-27  370  	ca=
se RTC_WKALM_SET:
5ad31a57515714 drivers/rtc/rtc-dev.c David Brownell    2008-07-23  371  		m=
utex_unlock(&rtc->ops_lock);
e824290e5dcfaf drivers/rtc/rtc-dev.c Alessandro Zummo  2006-03-27  372  		i=
f (copy_from_user(&alarm, uarg, sizeof(alarm)))
e824290e5dcfaf drivers/rtc/rtc-dev.c Alessandro Zummo  2006-03-27  373  			=
return -EFAULT;
e824290e5dcfaf drivers/rtc/rtc-dev.c Alessandro Zummo  2006-03-27  374  =

5ad31a57515714 drivers/rtc/rtc-dev.c David Brownell    2008-07-23  375  		r=
eturn rtc_set_alarm(rtc, &alarm);
e824290e5dcfaf drivers/rtc/rtc-dev.c Alessandro Zummo  2006-03-27  376  =

e824290e5dcfaf drivers/rtc/rtc-dev.c Alessandro Zummo  2006-03-27  377  	ca=
se RTC_WKALM_RD:
5ad31a57515714 drivers/rtc/rtc-dev.c David Brownell    2008-07-23  378  		m=
utex_unlock(&rtc->ops_lock);
ab6a2d70d18edc drivers/rtc/rtc-dev.c David Brownell    2007-05-08  379  		e=
rr =3D rtc_read_alarm(rtc, &alarm);
e824290e5dcfaf drivers/rtc/rtc-dev.c Alessandro Zummo  2006-03-27  380  		i=
f (err < 0)
e824290e5dcfaf drivers/rtc/rtc-dev.c Alessandro Zummo  2006-03-27  381  			=
return err;
e824290e5dcfaf drivers/rtc/rtc-dev.c Alessandro Zummo  2006-03-27  382  =

e824290e5dcfaf drivers/rtc/rtc-dev.c Alessandro Zummo  2006-03-27  383  		i=
f (copy_to_user(uarg, &alarm, sizeof(alarm)))
5ad31a57515714 drivers/rtc/rtc-dev.c David Brownell    2008-07-23  384  			=
err =3D -EFAULT;
5ad31a57515714 drivers/rtc/rtc-dev.c David Brownell    2008-07-23  385  		r=
eturn err;
e824290e5dcfaf drivers/rtc/rtc-dev.c Alessandro Zummo  2006-03-27  386  =

6a8af1b6568ad9 drivers/rtc/dev.c     Alexandre Belloni 2021-10-18  387  	ca=
se RTC_PARAM_GET:
6a8af1b6568ad9 drivers/rtc/dev.c     Alexandre Belloni 2021-10-18  388  		i=
f (copy_from_user(&param, uarg, sizeof(param))) {
6a8af1b6568ad9 drivers/rtc/dev.c     Alexandre Belloni 2021-10-18  389  			=
mutex_unlock(&rtc->ops_lock);
6a8af1b6568ad9 drivers/rtc/dev.c     Alexandre Belloni 2021-10-18  390  			=
return -EFAULT;
6a8af1b6568ad9 drivers/rtc/dev.c     Alexandre Belloni 2021-10-18  391  		}
6a8af1b6568ad9 drivers/rtc/dev.c     Alexandre Belloni 2021-10-18  392  =

6a8af1b6568ad9 drivers/rtc/dev.c     Alexandre Belloni 2021-10-18  393  		s=
witch(param.param) {
6a8af1b6568ad9 drivers/rtc/dev.c     Alexandre Belloni 2021-10-18  394  		c=
ase RTC_PARAM_FEATURES:
6a8af1b6568ad9 drivers/rtc/dev.c     Alexandre Belloni 2021-10-18  395  			=
if (param.index !=3D 0)
6a8af1b6568ad9 drivers/rtc/dev.c     Alexandre Belloni 2021-10-18  396  			=
	err =3D -EINVAL;
6a8af1b6568ad9 drivers/rtc/dev.c     Alexandre Belloni 2021-10-18  397  			=
param.uvalue =3D rtc->features[0];
6a8af1b6568ad9 drivers/rtc/dev.c     Alexandre Belloni 2021-10-18  398  			=
break;
6a8af1b6568ad9 drivers/rtc/dev.c     Alexandre Belloni 2021-10-18  399  =

ba52eac083e159 drivers/rtc/dev.c     Kees Cook         2021-12-08  400  		c=
ase RTC_PARAM_CORRECTION: {
ba52eac083e159 drivers/rtc/dev.c     Kees Cook         2021-12-08 @401  			=
long offset;
a6d8c6e1a5c6fb drivers/rtc/dev.c     Alexandre Belloni 2021-10-18  402  			=
mutex_unlock(&rtc->ops_lock);
a6d8c6e1a5c6fb drivers/rtc/dev.c     Alexandre Belloni 2021-10-18  403  			=
if (param.index !=3D 0)
a6d8c6e1a5c6fb drivers/rtc/dev.c     Alexandre Belloni 2021-10-18  404  			=
	return -EINVAL;
a6d8c6e1a5c6fb drivers/rtc/dev.c     Alexandre Belloni 2021-10-18  405  			=
err =3D rtc_read_offset(rtc, &offset);
a6d8c6e1a5c6fb drivers/rtc/dev.c     Alexandre Belloni 2021-10-18  406  			=
mutex_lock(&rtc->ops_lock);
a6d8c6e1a5c6fb drivers/rtc/dev.c     Alexandre Belloni 2021-10-18  407  			=
if (err =3D=3D 0)
a6d8c6e1a5c6fb drivers/rtc/dev.c     Alexandre Belloni 2021-10-18  408  			=
	param.svalue =3D offset;
a6d8c6e1a5c6fb drivers/rtc/dev.c     Alexandre Belloni 2021-10-18  409  			=
break;
ba52eac083e159 drivers/rtc/dev.c     Kees Cook         2021-12-08  410  		}
6a8af1b6568ad9 drivers/rtc/dev.c     Alexandre Belloni 2021-10-18  411  		d=
efault:
0d20e9fb1262b1 drivers/rtc/dev.c     Alexandre Belloni 2021-10-18  412  			=
if (rtc->ops->param_get)
0d20e9fb1262b1 drivers/rtc/dev.c     Alexandre Belloni 2021-10-18  413  			=
	err =3D rtc->ops->param_get(rtc->dev.parent, &param);
0d20e9fb1262b1 drivers/rtc/dev.c     Alexandre Belloni 2021-10-18  414  			=
else
6a8af1b6568ad9 drivers/rtc/dev.c     Alexandre Belloni 2021-10-18  415  			=
	err =3D -EINVAL;
6a8af1b6568ad9 drivers/rtc/dev.c     Alexandre Belloni 2021-10-18  416  		}
6a8af1b6568ad9 drivers/rtc/dev.c     Alexandre Belloni 2021-10-18  417  =

6a8af1b6568ad9 drivers/rtc/dev.c     Alexandre Belloni 2021-10-18  418  		i=
f (!err)
6a8af1b6568ad9 drivers/rtc/dev.c     Alexandre Belloni 2021-10-18  419  			=
if (copy_to_user(uarg, &param, sizeof(param)))
6a8af1b6568ad9 drivers/rtc/dev.c     Alexandre Belloni 2021-10-18  420  			=
	err =3D -EFAULT;
6a8af1b6568ad9 drivers/rtc/dev.c     Alexandre Belloni 2021-10-18  421  =

6a8af1b6568ad9 drivers/rtc/dev.c     Alexandre Belloni 2021-10-18  422  		b=
reak;
6a8af1b6568ad9 drivers/rtc/dev.c     Alexandre Belloni 2021-10-18  423  =

6a8af1b6568ad9 drivers/rtc/dev.c     Alexandre Belloni 2021-10-18  424  	ca=
se RTC_PARAM_SET:
6a8af1b6568ad9 drivers/rtc/dev.c     Alexandre Belloni 2021-10-18  425  		i=
f (copy_from_user(&param, uarg, sizeof(param))) {
6a8af1b6568ad9 drivers/rtc/dev.c     Alexandre Belloni 2021-10-18  426  			=
mutex_unlock(&rtc->ops_lock);
6a8af1b6568ad9 drivers/rtc/dev.c     Alexandre Belloni 2021-10-18  427  			=
return -EFAULT;
6a8af1b6568ad9 drivers/rtc/dev.c     Alexandre Belloni 2021-10-18  428  		}
6a8af1b6568ad9 drivers/rtc/dev.c     Alexandre Belloni 2021-10-18  429  =

6a8af1b6568ad9 drivers/rtc/dev.c     Alexandre Belloni 2021-10-18  430  		s=
witch(param.param) {
6a8af1b6568ad9 drivers/rtc/dev.c     Alexandre Belloni 2021-10-18  431  		c=
ase RTC_PARAM_FEATURES:
a6d8c6e1a5c6fb drivers/rtc/dev.c     Alexandre Belloni 2021-10-18  432  			=
err =3D -EINVAL;
a6d8c6e1a5c6fb drivers/rtc/dev.c     Alexandre Belloni 2021-10-18  433  			=
break;
a6d8c6e1a5c6fb drivers/rtc/dev.c     Alexandre Belloni 2021-10-18  434  =

a6d8c6e1a5c6fb drivers/rtc/dev.c     Alexandre Belloni 2021-10-18  435  		c=
ase RTC_PARAM_CORRECTION:
a6d8c6e1a5c6fb drivers/rtc/dev.c     Alexandre Belloni 2021-10-18  436  			=
mutex_unlock(&rtc->ops_lock);
a6d8c6e1a5c6fb drivers/rtc/dev.c     Alexandre Belloni 2021-10-18  437  			=
if (param.index !=3D 0)
a6d8c6e1a5c6fb drivers/rtc/dev.c     Alexandre Belloni 2021-10-18  438  			=
	return -EINVAL;
a6d8c6e1a5c6fb drivers/rtc/dev.c     Alexandre Belloni 2021-10-18  439  			=
return rtc_set_offset(rtc, param.svalue);
a6d8c6e1a5c6fb drivers/rtc/dev.c     Alexandre Belloni 2021-10-18  440  =

6a8af1b6568ad9 drivers/rtc/dev.c     Alexandre Belloni 2021-10-18  441  		d=
efault:
0d20e9fb1262b1 drivers/rtc/dev.c     Alexandre Belloni 2021-10-18  442  			=
if (rtc->ops->param_set)
0d20e9fb1262b1 drivers/rtc/dev.c     Alexandre Belloni 2021-10-18  443  			=
	err =3D rtc->ops->param_set(rtc->dev.parent, &param);
0d20e9fb1262b1 drivers/rtc/dev.c     Alexandre Belloni 2021-10-18  444  			=
else
6a8af1b6568ad9 drivers/rtc/dev.c     Alexandre Belloni 2021-10-18  445  			=
	err =3D -EINVAL;
6a8af1b6568ad9 drivers/rtc/dev.c     Alexandre Belloni 2021-10-18  446  		}
6a8af1b6568ad9 drivers/rtc/dev.c     Alexandre Belloni 2021-10-18  447  =

6a8af1b6568ad9 drivers/rtc/dev.c     Alexandre Belloni 2021-10-18  448  		b=
reak;
6a8af1b6568ad9 drivers/rtc/dev.c     Alexandre Belloni 2021-10-18  449  =

e824290e5dcfaf drivers/rtc/rtc-dev.c Alessandro Zummo  2006-03-27  450  	de=
fault:
ac54cd2bd5b4db drivers/rtc/rtc-dev.c John Stultz       2011-02-02  451  		/=
* Finally try the driver's ioctl interface */
ac54cd2bd5b4db drivers/rtc/rtc-dev.c John Stultz       2011-02-02  452  		i=
f (ops->ioctl) {
ac54cd2bd5b4db drivers/rtc/rtc-dev.c John Stultz       2011-02-02  453  			=
err =3D ops->ioctl(rtc->dev.parent, cmd, arg);
ac54cd2bd5b4db drivers/rtc/rtc-dev.c John Stultz       2011-02-02  454  			=
if (err =3D=3D -ENOIOCTLCMD)
b3969e5831adac drivers/rtc/rtc-dev.c Alessandro Zummo  2006-05-20  455  			=
	err =3D -ENOTTY;
606cc43c720bde drivers/rtc/dev.c     Alexandre Belloni 2019-03-20  456  		}=
 else {
e17fd4ba2a81f1 drivers/rtc/rtc-dev.c John Stultz       2011-05-31  457  			=
err =3D -ENOTTY;
606cc43c720bde drivers/rtc/dev.c     Alexandre Belloni 2019-03-20  458  		}
e824290e5dcfaf drivers/rtc/rtc-dev.c Alessandro Zummo  2006-03-27  459  		b=
reak;
e824290e5dcfaf drivers/rtc/rtc-dev.c Alessandro Zummo  2006-03-27  460  	}
e824290e5dcfaf drivers/rtc/rtc-dev.c Alessandro Zummo  2006-03-27  461  =

5ad31a57515714 drivers/rtc/rtc-dev.c David Brownell    2008-07-23  462  don=
e:
5ad31a57515714 drivers/rtc/rtc-dev.c David Brownell    2008-07-23  463  	mu=
tex_unlock(&rtc->ops_lock);
e824290e5dcfaf drivers/rtc/rtc-dev.c Alessandro Zummo  2006-03-27  464  	re=
turn err;
e824290e5dcfaf drivers/rtc/rtc-dev.c Alessandro Zummo  2006-03-27  465  }
e824290e5dcfaf drivers/rtc/rtc-dev.c Alessandro Zummo  2006-03-27  466  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3719827598051587200==--

