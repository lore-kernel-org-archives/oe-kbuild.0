Content-Type: multipart/mixed; boundary="===============2690826545691094670=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/media/rc/imon.c:871:22: warning: use of uninitialized value '<unknown>' [CWE-457]
Date: Sun, 04 Sep 2022 07:03:09 +0800
Message-ID: <202209040655.PAkGuAKa-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2690826545691094670==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: drivers/m=
edia/rc/imon.c:871:22: warning: use of uninitialized value '<unknown>' [CWE=
-457] [-Wanalyzer-use-of-uninitialized-value]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
CC: Mauro Carvalho Chehab <mchehab@kernel.org>
CC: linux-media(a)vger.kernel.org
CC: Sean Young <sean@mess.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   65eea2c060aee3bf6d27ea365360059fbd4eeff4
commit: db264d4c66c0fe007b5d19fd007707cd0697603d media: imon: reorganize se=
rialization
date:   4 months ago
:::::: branch date: 3 hours ago
:::::: commit date: 4 months ago
config: arm-randconfig-c002-20220830 (https://download.01.org/0day-ci/archi=
ve/20220904/202209040655.PAkGuAKa-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Ddb264d4c66c0fe007b5d19fd007707cd0697603d
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout db264d4c66c0fe007b5d19fd007707cd0697603d
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc_analyzer warnings: (new ones prefixed by >>)
   drivers/media/rc/imon.c: In function 'imon_clock_store':
>> drivers/media/rc/imon.c:871:22: warning: use of uninitialized value '<un=
known>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     871 |         unsigned int year, month, day, dow, hour, minute, second;
         |                      ^~~~
     'imon_clock_store': event 1
       |
       |  871 |         unsigned int year, month, day, dow, hour, minute, s=
econd;
       |      |                      ^~~~
       |      |                      |
       |      |                      (1) use of uninitialized value '<unkno=
wn>' here
       |
   drivers/media/rc/imon.c:871:28: warning: use of uninitialized value '<un=
known>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     871 |         unsigned int year, month, day, dow, hour, minute, second;
         |                            ^~~~~
     'imon_clock_store': event 1
       |
       |  871 |         unsigned int year, month, day, dow, hour, minute, s=
econd;
       |      |                            ^~~~~
       |      |                            |
       |      |                            (1) use of uninitialized value '=
<unknown>' here
       |
   drivers/media/rc/imon.c:871:35: warning: use of uninitialized value '<un=
known>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     871 |         unsigned int year, month, day, dow, hour, minute, second;
         |                                   ^~~
     'imon_clock_store': event 1
       |
       |  871 |         unsigned int year, month, day, dow, hour, minute, s=
econd;
       |      |                                   ^~~
       |      |                                   |
       |      |                                   (1) use of uninitialized =
value '<unknown>' here
       |
   drivers/media/rc/imon.c:871:40: warning: use of uninitialized value '<un=
known>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     871 |         unsigned int year, month, day, dow, hour, minute, second;
         |                                        ^~~
     'imon_clock_store': event 1
       |
       |  871 |         unsigned int year, month, day, dow, hour, minute, s=
econd;
       |      |                                        ^~~
       |      |                                        |
       |      |                                        (1) use of uninitial=
ized value '<unknown>' here
       |
   drivers/media/rc/imon.c:871:45: warning: use of uninitialized value '<un=
known>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     871 |         unsigned int year, month, day, dow, hour, minute, second;
         |                                             ^~~~
     'imon_clock_store': event 1
       |
       |  871 |         unsigned int year, month, day, dow, hour, minute, s=
econd;
       |      |                                             ^~~~
       |      |                                             |
       |      |                                             (1) use of unin=
itialized value '<unknown>' here
       |
   drivers/media/rc/imon.c:871:51: warning: use of uninitialized value '<un=
known>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     871 |         unsigned int year, month, day, dow, hour, minute, second;
         |                                                   ^~~~~~
     'imon_clock_store': event 1
       |
       |  871 |         unsigned int year, month, day, dow, hour, minute, s=
econd;
       |      |                                                   ^~~~~~
       |      |                                                   |
       |      |                                                   (1) use o=
f uninitialized value '<unknown>' here
       |
   drivers/media/rc/imon.c:871:59: warning: use of uninitialized value '<un=
known>' [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
     871 |         unsigned int year, month, day, dow, hour, minute, second;
         |                                                           ^~~~~~
     'imon_clock_store': event 1
       |
       |  871 |         unsigned int year, month, day, dow, hour, minute, s=
econd;
       |      |                                                           ^=
~~~~~
       |      |                                                           |
       |      |                                                           (=
1) use of uninitialized value '<unknown>' here
       |

vim +871 drivers/media/rc/imon.c

21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson 2010-04-16  864  =

f1d9f315924f02 drivers/media/rc/imon.c Zhen Lei     2021-06-03  865  static=
 ssize_t imon_clock_store(struct device *d,
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson 2010-04-16  866  				st=
ruct device_attribute *attr,
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson 2010-04-16  867  				co=
nst char *buf, size_t count)
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson 2010-04-16  868  {
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson 2010-04-16  869  	struc=
t imon_context *ictx =3D dev_get_drvdata(d);
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson 2010-04-16  870  	ssize=
_t retval;
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson 2010-04-16 @871  	unsig=
ned int year, month, day, dow, hour, minute, second;
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson 2010-04-16  872  =

21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson 2010-04-16  873  	if (!=
ictx)
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson 2010-04-16  874  		retu=
rn -ENODEV;
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson 2010-04-16  875  =

21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson 2010-04-16  876  	mutex=
_lock(&ictx->lock);
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson 2010-04-16  877  =

21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson 2010-04-16  878  	if (!=
ictx->display_supported) {
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson 2010-04-16  879  		retv=
al =3D -ENODEV;
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson 2010-04-16  880  		goto=
 exit;
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson 2010-04-16  881  	} els=
e if (ictx->display_isopen) {
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson 2010-04-16  882  		retv=
al =3D -EBUSY;
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson 2010-04-16  883  		goto=
 exit;
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson 2010-04-16  884  	}
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson 2010-04-16  885  =

21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson 2010-04-16  886  	if (s=
scanf(buf, "%u %u %u %u %u %u %u",	&year, &month, &day, &dow,
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson 2010-04-16  887  		   &=
hour, &minute, &second) !=3D 7) {
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson 2010-04-16  888  		retv=
al =3D -EINVAL;
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson 2010-04-16  889  		goto=
 exit;
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson 2010-04-16  890  	}
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson 2010-04-16  891  =

21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson 2010-04-16  892  	if ((=
month < 1 || month > 12) ||
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson 2010-04-16  893  	    (=
day < 1 || day > 31) || (dow > 6) ||
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson 2010-04-16  894  	    (=
hour > 23) || (minute > 59) || (second > 59)) {
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson 2010-04-16  895  		retv=
al =3D -EINVAL;
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson 2010-04-16  896  		goto=
 exit;
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson 2010-04-16  897  	}
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson 2010-04-16  898  =

21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson 2010-04-16  899  	retva=
l =3D send_set_imon_clock(ictx, year, month, day, dow,
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson 2010-04-16  900  				  =
   hour, minute, second);
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson 2010-04-16  901  	if (r=
etval)
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson 2010-04-16  902  		goto=
 exit;
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson 2010-04-16  903  =

21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson 2010-04-16  904  	retva=
l =3D count;
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson 2010-04-16  905  exit:
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson 2010-04-16  906  	mutex=
_unlock(&ictx->lock);
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson 2010-04-16  907  =

21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson 2010-04-16  908  	retur=
n retval;
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson 2010-04-16  909  }
21677cfc562a27 drivers/media/IR/imon.c Jarod Wilson 2010-04-16  910  =


:::::: The code at line 871 was first introduced by commit
:::::: 21677cfc562a27e099719d413287bc8d1d24deb7 V4L/DVB: ir-core: add imon =
driver

:::::: TO: Jarod Wilson <jarod@redhat.com>
:::::: CC: Mauro Carvalho Chehab <mchehab@redhat.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2690826545691094670==--

