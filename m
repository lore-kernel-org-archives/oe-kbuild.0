Content-Type: multipart/mixed; boundary="===============2818595308042678658=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: kernel/sysctl.c:1256:48: warning: use of uninitialized value 'tmp' [CWE-457]
Date: Sun, 07 Aug 2022 12:41:05 +0800
Message-ID: <202208071208.038EwLzE-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2818595308042678658==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: kernel/sy=
sctl.c:1256:48: warning: use of uninitialized value 'tmp' [CWE-457] [-Wanal=
yzer-use-of-uninitialized-value]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Yuwei Wang <wangyuweihx@gmail.com>
CC: Paolo Abeni <pabeni@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   1612c382ffbdf1f673caec76502b1c00e6d35363
commit: c381d02b2fd5f82d2207db1b9b25ff60d0d9c27c sysctl: add proc_dointvec_=
ms_jiffies_minmax
date:   5 weeks ago
:::::: branch date: 4 hours ago
:::::: commit date: 5 weeks ago
config: arm-randconfig-c002-20220805 (https://download.01.org/0day-ci/archi=
ve/20220807/202208071208.038EwLzE-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dc381d02b2fd5f82d2207db1b9b25ff60d0d9c27c
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout c381d02b2fd5f82d2207db1b9b25ff60d0d9c27c
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc-analyzer warnings: (new ones prefixed by >>)
   kernel/sysctl.c: In function 'do_proc_dointvec_ms_jiffies_minmax_conv':
>> kernel/sysctl.c:1256:48: warning: use of uninitialized value 'tmp' [CWE-=
457] [-Wanalyzer-use-of-uninitialized-value]
    1256 |                 if ((param->min && *param->min > tmp) ||
         |                                    ~~~~~~~~~~~~^~~~~
     'do_proc_dointvec_ms_jiffies_minmax_conv': events 1-8
       |
       | 1243 |         int tmp, ret;
       |      |             ^~~
       |      |             |
       |      |             (1) region created on stack here
       |......
       | 1252 |         if (ret)
       |      |            ~ =

       |      |            |
       |      |            (2) following 'false' branch (when 'ret =3D=3D 0=
')...
       |......
       | 1255 |         if (write) {
       |      |            ~ =

       |      |            |
       |      |            (3) ...to here
       |      |            (4) following 'true' branch (when 'write !=3D 0'=
)...
       | 1256 |                 if ((param->min && *param->min > tmp) ||
       |      |                    ~ ~~~~~~~~~~    ~~~~~~~~~~~~~~~~~
       |      |                    |      |        |           |
       |      |                    |      |        |           (8) use of u=
ninitialized value 'tmp' here
       |      |                    |      |        (7) ...to here
       |      |                    |      (5) ...to here
       |      |                    (6) following 'true' branch...
       |
   kernel/sysctl.c:1257:60: warning: use of uninitialized value 'tmp' [CWE-=
457] [-Wanalyzer-use-of-uninitialized-value]
    1257 |                                 (param->max && *param->max < tmp=
))
         |                                                ~~~~~~~~~~~~^~~~~
     'do_proc_dointvec_ms_jiffies_minmax_conv': events 1-8
       |
       | 1243 |         int tmp, ret;
       |      |             ^~~
       |      |             |
       |      |             (1) region created on stack here
       |......
       | 1252 |         if (ret)
       |      |            ~ =

       |      |            |
       |      |            (2) following 'false' branch (when 'ret =3D=3D 0=
')...
       |......
       | 1255 |         if (write) {
       |      |            ~ =

       |      |            |
       |      |            (3) ...to here
       |      |            (4) following 'true' branch (when 'write !=3D 0'=
)...
       | 1256 |                 if ((param->min && *param->min > tmp) ||
       |      |                     ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
       |      |                           |                           |
       |      |                           (5) ...to here              (6) f=
ollowing 'true' branch...
       | 1257 |                                 (param->max && *param->max =
< tmp))
       |      |                                 ~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~~~~
       |      |                                                |           |
       |      |                                                |           =
(8) use of uninitialized value 'tmp' here
       |      |                                                (7) ...to he=
re
       |
   kernel/sysctl.c:1259:23: warning: use of uninitialized value 'tmp' [CWE-=
457] [-Wanalyzer-use-of-uninitialized-value]
    1259 |                 *valp =3D tmp;
         |                 ~~~~~~^~~~~
     'do_proc_dointvec_ms_jiffies_minmax_conv': events 1-6
       |
       | 1243 |         int tmp, ret;
       |      |             ^~~
       |      |             |
       |      |             (1) region created on stack here
       |......
       | 1252 |         if (ret)
       |      |            ~ =

       |      |            |
       |      |            (2) following 'false' branch (when 'ret =3D=3D 0=
')...
       |......
       | 1255 |         if (write) {
       |      |            ~ =

       |      |            |
       |      |            (3) ...to here
       |      |            (4) following 'true' branch (when 'write !=3D 0'=
)...
       | 1256 |                 if ((param->min && *param->min > tmp) ||
       |      |                      ~~~~~~~~~~
       |      |                           |
       |      |                           (5) ...to here
       |......
       | 1259 |                 *valp =3D tmp;
       |      |                 ~~~~~~~~~~~
       |      |                       |
       |      |                       (6) use of uninitialized value 'tmp' =
here
       |

vim +/tmp +1256 kernel/sysctl.c

f461d2dcd511c0 Christoph Hellwig 2020-04-24  1239  =

c381d02b2fd5f8 Yuwei Wang        2022-06-29  1240  static int do_proc_doint=
vec_ms_jiffies_minmax_conv(bool *negp, unsigned long *lvalp,
c381d02b2fd5f8 Yuwei Wang        2022-06-29  1241  						int *valp, int wri=
te, void *data)
c381d02b2fd5f8 Yuwei Wang        2022-06-29  1242  {
c381d02b2fd5f8 Yuwei Wang        2022-06-29  1243  	int tmp, ret;
c381d02b2fd5f8 Yuwei Wang        2022-06-29  1244  	struct do_proc_dointvec=
_minmax_conv_param *param =3D data;
c381d02b2fd5f8 Yuwei Wang        2022-06-29  1245  	/*
c381d02b2fd5f8 Yuwei Wang        2022-06-29  1246  	 * If writing, first do=
 so via a temporary local int so we can
c381d02b2fd5f8 Yuwei Wang        2022-06-29  1247  	 * bounds-check it befo=
re touching *valp.
c381d02b2fd5f8 Yuwei Wang        2022-06-29  1248  	 */
c381d02b2fd5f8 Yuwei Wang        2022-06-29  1249  	int *ip =3D write ? &tm=
p : valp;
c381d02b2fd5f8 Yuwei Wang        2022-06-29  1250  =

c381d02b2fd5f8 Yuwei Wang        2022-06-29  1251  	ret =3D do_proc_dointve=
c_ms_jiffies_conv(negp, lvalp, ip, write, data);
c381d02b2fd5f8 Yuwei Wang        2022-06-29  1252  	if (ret)
c381d02b2fd5f8 Yuwei Wang        2022-06-29  1253  		return ret;
c381d02b2fd5f8 Yuwei Wang        2022-06-29  1254  =

c381d02b2fd5f8 Yuwei Wang        2022-06-29  1255  	if (write) {
c381d02b2fd5f8 Yuwei Wang        2022-06-29 @1256  		if ((param->min && *pa=
ram->min > tmp) ||
c381d02b2fd5f8 Yuwei Wang        2022-06-29  1257  				(param->max && *para=
m->max < tmp))
c381d02b2fd5f8 Yuwei Wang        2022-06-29  1258  			return -EINVAL;
c381d02b2fd5f8 Yuwei Wang        2022-06-29  1259  		*valp =3D tmp;
c381d02b2fd5f8 Yuwei Wang        2022-06-29  1260  	}
c381d02b2fd5f8 Yuwei Wang        2022-06-29  1261  	return 0;
c381d02b2fd5f8 Yuwei Wang        2022-06-29  1262  }
c381d02b2fd5f8 Yuwei Wang        2022-06-29  1263  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2818595308042678658==--

