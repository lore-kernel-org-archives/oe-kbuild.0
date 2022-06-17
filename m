Content-Type: multipart/mixed; boundary="===============8559189559442365048=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [alobakin:bitops 4/7] include/asm-generic/bitops/generic-non-atomic.h:156:9: sparse: sparse: unreplaced symbol 'val'
Date: Sat, 18 Jun 2022 07:04:42 +0800
Message-ID: <202206180725.x64yxg4E-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8559189559442365048==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: include/a=
sm-generic/bitops/generic-non-atomic.h:156:9: sparse: sparse: unreplaced sy=
mbol 'val'"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Alexander Lobakin <alexandr.lobakin@intel.com>

tree:   https://github.com/alobakin/linux bitops
head:   9bd39b17ce49d350eed93a031e0da6389067013e
commit: c6d1f21e05b033e6a95928a5bc89e4751c21704f [4/7] bitops: define const=
_*() versions of the non-atomics
:::::: branch date: 9 hours ago
:::::: commit date: 11 hours ago
config: sh-randconfig-s031-20220617 (https://download.01.org/0day-ci/archiv=
e/20220618/202206180725.x64yxg4E-lkp(a)intel.com/config)
compiler: sh4-linux-gcc (GCC) 11.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-30-g92122700-dirty
        # https://github.com/alobakin/linux/commit/c6d1f21e05b033e6a95928a5=
bc89e4751c21704f
        git remote add alobakin https://github.com/alobakin/linux
        git fetch --no-tags alobakin bitops
        git checkout c6d1f21e05b033e6a95928a5bc89e4751c21704f
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-11.3.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Ds=
h SHELL=3D/bin/bash drivers/scsi/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
   include/asm-generic/bitops/generic-non-atomic.h:32:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:27:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/scsi_debugfs.c: note: in included file (through arch/sh/inc=
lude/asm/bitops.h, include/linux/bitops.h):
   arch/sh/include/asm/bitops-op32.h:51:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:52:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:24: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:40:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/scsi_debugfs.c: note: in included file (through include/lin=
ux/bitops.h):
   include/asm-generic/bitops/generic-non-atomic.h:38:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:39:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:36:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/scsi_debugfs.c: note: in included file (through arch/sh/inc=
lude/asm/bitops.h, include/linux/bitops.h):
   arch/sh/include/asm/bitops-op32.h:79:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:80:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:23: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:68:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/scsi_debugfs.c: note: in included file (through include/lin=
ux/bitops.h):
   include/asm-generic/bitops/generic-non-atomic.h:56:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:57:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:15: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:54:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/scsi_debugfs.c: note: in included file (through arch/sh/inc=
lude/asm/bitops.h, include/linux/bitops.h):
   arch/sh/include/asm/bitops-op32.h:98:9: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/sh/include/asm/bitops-op32.h:99:9: sparse: sparse: unreplaced symbo=
l 'p'
   arch/sh/include/asm/bitops-op32.h:100:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:102:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:102:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:102:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:103:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:96:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/scsi_debugfs.c: note: in included file (through include/lin=
ux/bitops.h):
   include/asm-generic/bitops/generic-non-atomic.h:74:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:75:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:76:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:78:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:20: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:79:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:72:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/scsi_debugfs.c: note: in included file (through arch/sh/inc=
lude/asm/bitops.h, include/linux/bitops.h):
   arch/sh/include/asm/bitops-op32.h:118:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:119:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:120:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:122:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:122:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:122:21: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:123:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:116:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/scsi_debugfs.c: note: in included file (through include/lin=
ux/bitops.h):
   include/asm-generic/bitops/generic-non-atomic.h:94:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:95:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:96:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:98:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:21: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:99:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:92:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/scsi_debugfs.c: note: in included file (through arch/sh/inc=
lude/asm/bitops.h, include/linux/bitops.h):
   arch/sh/include/asm/bitops-op32.h:130:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:131:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:132:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:134:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:134:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:134:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:135:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:128:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/scsi_debugfs.c: note: in included file (through include/lin=
ux/bitops.h):
   include/asm-generic/bitops/generic-non-atomic.h:106:9: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:107:9: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:108:9: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:10: sparse: sparse: =
unreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:110:14: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:20: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:17: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:111:23: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:104:1: sparse: sparse: u=
nreplaced symbol 'return'
   drivers/scsi/scsi_debugfs.c: note: in included file (through arch/sh/inc=
lude/asm/bitops.h, include/linux/bitops.h):
   arch/sh/include/asm/bitops-op32.h:146:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:144:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/scsi_debugfs.c: note: in included file (through include/lin=
ux/bitops.h):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:154:9: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:155:9: sparse: sparse: u=
nreplaced symbol 'mask'
>> include/asm-generic/bitops/generic-non-atomic.h:156:9: sparse: sparse: u=
nreplaced symbol 'val'
   include/asm-generic/bitops/generic-non-atomic.h:158:19: sparse: sparse: =
unreplaced symbol 'val'
   include/asm-generic/bitops/generic-non-atomic.h:158:25: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:158:9: sparse: sparse: t=
oo many warnings
--
   include/asm-generic/bitops/generic-non-atomic.h:32:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:27:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/scsi_sysctl.c: note: in included file (through arch/sh/incl=
ude/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h):
   arch/sh/include/asm/bitops-op32.h:51:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:52:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:24: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:40:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/scsi_sysctl.c: note: in included file (through include/linu=
x/bitops.h, include/linux/kernel.h):
   include/asm-generic/bitops/generic-non-atomic.h:38:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:39:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:36:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/scsi_sysctl.c: note: in included file (through arch/sh/incl=
ude/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h):
   arch/sh/include/asm/bitops-op32.h:79:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:80:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:23: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:68:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/scsi_sysctl.c: note: in included file (through include/linu=
x/bitops.h, include/linux/kernel.h):
   include/asm-generic/bitops/generic-non-atomic.h:56:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:57:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:15: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:54:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/scsi_sysctl.c: note: in included file (through arch/sh/incl=
ude/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h):
   arch/sh/include/asm/bitops-op32.h:98:9: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/sh/include/asm/bitops-op32.h:99:9: sparse: sparse: unreplaced symbo=
l 'p'
   arch/sh/include/asm/bitops-op32.h:100:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:102:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:102:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:102:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:103:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:96:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/scsi_sysctl.c: note: in included file (through include/linu=
x/bitops.h, include/linux/kernel.h):
   include/asm-generic/bitops/generic-non-atomic.h:74:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:75:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:76:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:78:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:20: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:79:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:72:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/scsi_sysctl.c: note: in included file (through arch/sh/incl=
ude/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h):
   arch/sh/include/asm/bitops-op32.h:118:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:119:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:120:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:122:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:122:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:122:21: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:123:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:116:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/scsi_sysctl.c: note: in included file (through include/linu=
x/bitops.h, include/linux/kernel.h):
   include/asm-generic/bitops/generic-non-atomic.h:94:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:95:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:96:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:98:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:21: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:99:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:92:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/scsi_sysctl.c: note: in included file (through arch/sh/incl=
ude/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h):
   arch/sh/include/asm/bitops-op32.h:130:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:131:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:132:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:134:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:134:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:134:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:135:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:128:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/scsi_sysctl.c: note: in included file (through include/linu=
x/bitops.h, include/linux/kernel.h):
   include/asm-generic/bitops/generic-non-atomic.h:106:9: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:107:9: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:108:9: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:10: sparse: sparse: =
unreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:110:14: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:20: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:17: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:111:23: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:104:1: sparse: sparse: u=
nreplaced symbol 'return'
   drivers/scsi/scsi_sysctl.c: note: in included file (through arch/sh/incl=
ude/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h):
   arch/sh/include/asm/bitops-op32.h:146:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:144:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/scsi_sysctl.c: note: in included file (through include/linu=
x/bitops.h, include/linux/kernel.h):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:154:9: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:155:9: sparse: sparse: u=
nreplaced symbol 'mask'
>> include/asm-generic/bitops/generic-non-atomic.h:156:9: sparse: sparse: u=
nreplaced symbol 'val'
   include/asm-generic/bitops/generic-non-atomic.h:158:19: sparse: sparse: =
unreplaced symbol 'val'
   include/asm-generic/bitops/generic-non-atomic.h:158:25: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:158:9: sparse: sparse: t=
oo many warnings
--
   include/asm-generic/bitops/generic-non-atomic.h:32:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:27:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/scsicam.c: note: in included file (through arch/sh/include/=
asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:51:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:52:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:24: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:40:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/scsicam.c: note: in included file (through include/linux/bi=
tops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:38:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:39:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:36:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/scsicam.c: note: in included file (through arch/sh/include/=
asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:79:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:80:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:23: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:68:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/scsicam.c: note: in included file (through include/linux/bi=
tops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:56:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:57:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:15: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:54:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/scsicam.c: note: in included file (through arch/sh/include/=
asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:98:9: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/sh/include/asm/bitops-op32.h:99:9: sparse: sparse: unreplaced symbo=
l 'p'
   arch/sh/include/asm/bitops-op32.h:100:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:102:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:102:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:102:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:103:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:96:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/scsicam.c: note: in included file (through include/linux/bi=
tops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:74:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:75:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:76:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:78:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:20: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:79:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:72:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/scsicam.c: note: in included file (through arch/sh/include/=
asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:118:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:119:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:120:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:122:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:122:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:122:21: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:123:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:116:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/scsicam.c: note: in included file (through include/linux/bi=
tops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:94:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:95:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:96:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:98:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:21: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:99:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:92:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/scsicam.c: note: in included file (through arch/sh/include/=
asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:130:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:131:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:132:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:134:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:134:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:134:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:135:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:128:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/scsicam.c: note: in included file (through include/linux/bi=
tops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:106:9: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:107:9: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:108:9: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:10: sparse: sparse: =
unreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:110:14: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:20: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:17: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:111:23: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:104:1: sparse: sparse: u=
nreplaced symbol 'return'
   drivers/scsi/scsicam.c: note: in included file (through arch/sh/include/=
asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:146:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:144:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/scsicam.c: note: in included file (through include/linux/bi=
tops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:154:9: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:155:9: sparse: sparse: u=
nreplaced symbol 'mask'
>> include/asm-generic/bitops/generic-non-atomic.h:156:9: sparse: sparse: u=
nreplaced symbol 'val'
   include/asm-generic/bitops/generic-non-atomic.h:158:19: sparse: sparse: =
unreplaced symbol 'val'
   include/asm-generic/bitops/generic-non-atomic.h:158:25: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:158:9: sparse: sparse: t=
oo many warnings
--
   include/asm-generic/bitops/generic-non-atomic.h:32:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:27:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/constants.c: note: in included file (through arch/sh/includ=
e/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:51:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:52:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:24: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:40:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/constants.c: note: in included file (through include/linux/=
bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:38:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:39:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:36:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/constants.c: note: in included file (through arch/sh/includ=
e/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:79:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:80:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:23: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:68:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/constants.c: note: in included file (through include/linux/=
bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:56:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:57:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:15: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:54:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/constants.c: note: in included file (through arch/sh/includ=
e/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:98:9: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/sh/include/asm/bitops-op32.h:99:9: sparse: sparse: unreplaced symbo=
l 'p'
   arch/sh/include/asm/bitops-op32.h:100:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:102:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:102:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:102:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:103:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:96:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/constants.c: note: in included file (through include/linux/=
bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:74:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:75:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:76:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:78:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:20: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:79:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:72:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/constants.c: note: in included file (through arch/sh/includ=
e/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:118:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:119:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:120:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:122:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:122:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:122:21: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:123:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:116:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/constants.c: note: in included file (through include/linux/=
bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:94:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:95:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:96:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:98:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:21: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:99:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:92:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/constants.c: note: in included file (through arch/sh/includ=
e/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:130:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:131:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:132:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:134:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:134:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:134:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:135:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:128:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/constants.c: note: in included file (through include/linux/=
bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:106:9: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:107:9: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:108:9: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:10: sparse: sparse: =
unreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:110:14: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:20: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:17: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:111:23: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:104:1: sparse: sparse: u=
nreplaced symbol 'return'
   drivers/scsi/constants.c: note: in included file (through arch/sh/includ=
e/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:146:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:144:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/constants.c: note: in included file (through include/linux/=
bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:154:9: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:155:9: sparse: sparse: u=
nreplaced symbol 'mask'
>> include/asm-generic/bitops/generic-non-atomic.h:156:9: sparse: sparse: u=
nreplaced symbol 'val'
   include/asm-generic/bitops/generic-non-atomic.h:158:19: sparse: sparse: =
unreplaced symbol 'val'
   include/asm-generic/bitops/generic-non-atomic.h:158:25: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:158:9: sparse: sparse: t=
oo many warnings
--
   include/asm-generic/bitops/generic-non-atomic.h:32:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:27:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/scsi_common.c: note: in included file (through arch/sh/incl=
ude/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h):
   arch/sh/include/asm/bitops-op32.h:51:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:52:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:24: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:40:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/scsi_common.c: note: in included file (through include/linu=
x/bitops.h, include/linux/kernel.h):
   include/asm-generic/bitops/generic-non-atomic.h:38:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:39:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:36:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/scsi_common.c: note: in included file (through arch/sh/incl=
ude/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h):
   arch/sh/include/asm/bitops-op32.h:79:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:80:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:23: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:68:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/scsi_common.c: note: in included file (through include/linu=
x/bitops.h, include/linux/kernel.h):
   include/asm-generic/bitops/generic-non-atomic.h:56:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:57:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:15: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:54:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/scsi_common.c: note: in included file (through arch/sh/incl=
ude/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h):
   arch/sh/include/asm/bitops-op32.h:98:9: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/sh/include/asm/bitops-op32.h:99:9: sparse: sparse: unreplaced symbo=
l 'p'
   arch/sh/include/asm/bitops-op32.h:100:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:102:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:102:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:102:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:103:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:96:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/scsi_common.c: note: in included file (through include/linu=
x/bitops.h, include/linux/kernel.h):
   include/asm-generic/bitops/generic-non-atomic.h:74:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:75:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:76:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:78:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:20: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:79:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:72:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/scsi_common.c: note: in included file (through arch/sh/incl=
ude/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h):
   arch/sh/include/asm/bitops-op32.h:118:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:119:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:120:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:122:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:122:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:122:21: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:123:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:116:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/scsi_common.c: note: in included file (through include/linu=
x/bitops.h, include/linux/kernel.h):
   include/asm-generic/bitops/generic-non-atomic.h:94:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:95:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:96:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:98:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:21: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:99:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:92:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/scsi_common.c: note: in included file (through arch/sh/incl=
ude/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h):
   arch/sh/include/asm/bitops-op32.h:130:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:131:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:132:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:134:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:134:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:134:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:135:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:128:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/scsi_common.c: note: in included file (through include/linu=
x/bitops.h, include/linux/kernel.h):
   include/asm-generic/bitops/generic-non-atomic.h:106:9: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:107:9: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:108:9: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:10: sparse: sparse: =
unreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:110:14: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:20: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:17: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:111:23: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:104:1: sparse: sparse: u=
nreplaced symbol 'return'
   drivers/scsi/scsi_common.c: note: in included file (through arch/sh/incl=
ude/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h):
   arch/sh/include/asm/bitops-op32.h:146:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:144:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/scsi_common.c: note: in included file (through include/linu=
x/bitops.h, include/linux/kernel.h):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:154:9: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:155:9: sparse: sparse: u=
nreplaced symbol 'mask'
>> include/asm-generic/bitops/generic-non-atomic.h:156:9: sparse: sparse: u=
nreplaced symbol 'val'
   include/asm-generic/bitops/generic-non-atomic.h:158:19: sparse: sparse: =
unreplaced symbol 'val'
   include/asm-generic/bitops/generic-non-atomic.h:158:25: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:158:9: sparse: sparse: t=
oo many warnings
--
   include/asm-generic/bitops/generic-non-atomic.h:32:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:27:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/scsi_devinfo.c: note: in included file (through arch/sh/inc=
lude/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:51:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:52:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:24: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:40:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/scsi_devinfo.c: note: in included file (through include/lin=
ux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:38:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:39:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:36:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/scsi_devinfo.c: note: in included file (through arch/sh/inc=
lude/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:79:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:80:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:23: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:68:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/scsi_devinfo.c: note: in included file (through include/lin=
ux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:56:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:57:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:15: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:54:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/scsi_devinfo.c: note: in included file (through arch/sh/inc=
lude/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:98:9: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/sh/include/asm/bitops-op32.h:99:9: sparse: sparse: unreplaced symbo=
l 'p'
   arch/sh/include/asm/bitops-op32.h:100:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:102:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:102:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:102:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:103:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:96:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/scsi_devinfo.c: note: in included file (through include/lin=
ux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:74:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:75:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:76:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:78:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:20: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:79:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:72:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/scsi_devinfo.c: note: in included file (through arch/sh/inc=
lude/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:118:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:119:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:120:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:122:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:122:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:122:21: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:123:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:116:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/scsi_devinfo.c: note: in included file (through include/lin=
ux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:94:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:95:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:96:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:98:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:21: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:99:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:92:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/scsi_devinfo.c: note: in included file (through arch/sh/inc=
lude/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:130:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:131:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:132:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:134:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:134:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:134:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:135:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:128:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/scsi_devinfo.c: note: in included file (through include/lin=
ux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:106:9: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:107:9: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:108:9: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:10: sparse: sparse: =
unreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:110:14: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:20: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:17: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:111:23: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:104:1: sparse: sparse: u=
nreplaced symbol 'return'
   drivers/scsi/scsi_devinfo.c: note: in included file (through arch/sh/inc=
lude/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:146:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:144:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/scsi_devinfo.c: note: in included file (through include/lin=
ux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:154:9: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:155:9: sparse: sparse: u=
nreplaced symbol 'mask'
>> include/asm-generic/bitops/generic-non-atomic.h:156:9: sparse: sparse: u=
nreplaced symbol 'val'
   include/asm-generic/bitops/generic-non-atomic.h:158:19: sparse: sparse: =
unreplaced symbol 'val'
   include/asm-generic/bitops/generic-non-atomic.h:158:25: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:158:9: sparse: sparse: t=
oo many warnings
--
   include/asm-generic/bitops/generic-non-atomic.h:32:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:27:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/scsi_trace.c: note: in included file (through arch/sh/inclu=
de/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h):
   arch/sh/include/asm/bitops-op32.h:51:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:52:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:24: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:40:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/scsi_trace.c: note: in included file (through include/linux=
/bitops.h, include/linux/kernel.h):
   include/asm-generic/bitops/generic-non-atomic.h:38:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:39:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:36:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/scsi_trace.c: note: in included file (through arch/sh/inclu=
de/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h):
   arch/sh/include/asm/bitops-op32.h:79:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:80:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:23: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:68:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/scsi_trace.c: note: in included file (through include/linux=
/bitops.h, include/linux/kernel.h):
   include/asm-generic/bitops/generic-non-atomic.h:56:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:57:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:15: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:54:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/scsi_trace.c: note: in included file (through arch/sh/inclu=
de/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h):
   arch/sh/include/asm/bitops-op32.h:98:9: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/sh/include/asm/bitops-op32.h:99:9: sparse: sparse: unreplaced symbo=
l 'p'
   arch/sh/include/asm/bitops-op32.h:100:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:102:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:102:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:102:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:103:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:96:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/scsi_trace.c: note: in included file (through include/linux=
/bitops.h, include/linux/kernel.h):
   include/asm-generic/bitops/generic-non-atomic.h:74:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:75:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:76:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:78:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:20: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:79:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:72:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/scsi_trace.c: note: in included file (through arch/sh/inclu=
de/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h):
   arch/sh/include/asm/bitops-op32.h:118:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:119:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:120:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:122:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:122:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:122:21: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:123:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:116:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/scsi_trace.c: note: in included file (through include/linux=
/bitops.h, include/linux/kernel.h):
   include/asm-generic/bitops/generic-non-atomic.h:94:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:95:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:96:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:98:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:21: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:99:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:92:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/scsi_trace.c: note: in included file (through arch/sh/inclu=
de/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h):
   arch/sh/include/asm/bitops-op32.h:130:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:131:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:132:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:134:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:134:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:134:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:135:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:128:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/scsi_trace.c: note: in included file (through include/linux=
/bitops.h, include/linux/kernel.h):
   include/asm-generic/bitops/generic-non-atomic.h:106:9: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:107:9: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:108:9: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:10: sparse: sparse: =
unreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:110:14: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:20: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:17: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:111:23: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:104:1: sparse: sparse: u=
nreplaced symbol 'return'
   drivers/scsi/scsi_trace.c: note: in included file (through arch/sh/inclu=
de/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h):
   arch/sh/include/asm/bitops-op32.h:146:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:144:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/scsi_trace.c: note: in included file (through include/linux=
/bitops.h, include/linux/kernel.h):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:154:9: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:155:9: sparse: sparse: u=
nreplaced symbol 'mask'
>> include/asm-generic/bitops/generic-non-atomic.h:156:9: sparse: sparse: u=
nreplaced symbol 'val'
   include/asm-generic/bitops/generic-non-atomic.h:158:19: sparse: sparse: =
unreplaced symbol 'val'
   include/asm-generic/bitops/generic-non-atomic.h:158:25: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:158:9: sparse: sparse: t=
oo many warnings
--
   include/asm-generic/bitops/generic-non-atomic.h:32:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:27:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/hosts.c: note: in included file (through arch/sh/include/as=
m/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:51:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:52:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:24: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:40:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/hosts.c: note: in included file (through include/linux/bito=
ps.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:38:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:39:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:36:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/hosts.c: note: in included file (through arch/sh/include/as=
m/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:79:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:80:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:23: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:68:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/hosts.c: note: in included file (through include/linux/bito=
ps.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:56:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:57:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:15: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:54:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/hosts.c: note: in included file (through arch/sh/include/as=
m/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:98:9: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/sh/include/asm/bitops-op32.h:99:9: sparse: sparse: unreplaced symbo=
l 'p'
   arch/sh/include/asm/bitops-op32.h:100:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:102:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:102:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:102:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:103:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:96:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/hosts.c: note: in included file (through include/linux/bito=
ps.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:74:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:75:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:76:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:78:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:20: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:79:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:72:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/hosts.c: note: in included file (through arch/sh/include/as=
m/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:118:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:119:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:120:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:122:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:122:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:122:21: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:123:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:116:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/hosts.c: note: in included file (through include/linux/bito=
ps.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:94:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:95:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:96:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:98:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:21: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:99:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:92:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/hosts.c: note: in included file (through arch/sh/include/as=
m/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:130:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:131:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:132:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:134:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:134:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:134:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:135:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:128:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/hosts.c: note: in included file (through include/linux/bito=
ps.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:106:9: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:107:9: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:108:9: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:10: sparse: sparse: =
unreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:110:14: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:20: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:17: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:111:23: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:104:1: sparse: sparse: u=
nreplaced symbol 'return'
   drivers/scsi/hosts.c: note: in included file (through arch/sh/include/as=
m/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:146:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:144:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/hosts.c: note: in included file (through include/linux/bito=
ps.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:154:9: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:155:9: sparse: sparse: u=
nreplaced symbol 'mask'
>> include/asm-generic/bitops/generic-non-atomic.h:156:9: sparse: sparse: u=
nreplaced symbol 'val'
   include/asm-generic/bitops/generic-non-atomic.h:158:19: sparse: sparse: =
unreplaced symbol 'val'
   include/asm-generic/bitops/generic-non-atomic.h:158:25: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:158:9: sparse: sparse: t=
oo many warnings
--
   include/asm-generic/bitops/generic-non-atomic.h:32:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:27:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/scsi_logging.c: note: in included file (through arch/sh/inc=
lude/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h):
   arch/sh/include/asm/bitops-op32.h:51:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:52:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:24: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:40:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/scsi_logging.c: note: in included file (through include/lin=
ux/bitops.h, include/linux/kernel.h):
   include/asm-generic/bitops/generic-non-atomic.h:38:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:39:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:36:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/scsi_logging.c: note: in included file (through arch/sh/inc=
lude/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h):
   arch/sh/include/asm/bitops-op32.h:79:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:80:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:23: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:68:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/scsi_logging.c: note: in included file (through include/lin=
ux/bitops.h, include/linux/kernel.h):
   include/asm-generic/bitops/generic-non-atomic.h:56:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:57:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:15: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:54:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/scsi_logging.c: note: in included file (through arch/sh/inc=
lude/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h):
   arch/sh/include/asm/bitops-op32.h:98:9: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/sh/include/asm/bitops-op32.h:99:9: sparse: sparse: unreplaced symbo=
l 'p'
   arch/sh/include/asm/bitops-op32.h:100:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:102:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:102:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:102:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:103:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:96:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/scsi_logging.c: note: in included file (through include/lin=
ux/bitops.h, include/linux/kernel.h):
   include/asm-generic/bitops/generic-non-atomic.h:74:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:75:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:76:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:78:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:20: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:79:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:72:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/scsi_logging.c: note: in included file (through arch/sh/inc=
lude/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h):
   arch/sh/include/asm/bitops-op32.h:118:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:119:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:120:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:122:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:122:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:122:21: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:123:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:116:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/scsi_logging.c: note: in included file (through include/lin=
ux/bitops.h, include/linux/kernel.h):
   include/asm-generic/bitops/generic-non-atomic.h:94:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:95:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:96:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:98:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:21: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:99:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:92:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/scsi_logging.c: note: in included file (through arch/sh/inc=
lude/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h):
   arch/sh/include/asm/bitops-op32.h:130:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:131:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:132:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:134:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:134:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:134:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:135:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:128:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/scsi_logging.c: note: in included file (through include/lin=
ux/bitops.h, include/linux/kernel.h):
   include/asm-generic/bitops/generic-non-atomic.h:106:9: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:107:9: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:108:9: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:10: sparse: sparse: =
unreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:110:14: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:20: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:17: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:111:23: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:104:1: sparse: sparse: u=
nreplaced symbol 'return'
   drivers/scsi/scsi_logging.c: note: in included file (through arch/sh/inc=
lude/asm/bitops.h, include/linux/bitops.h, include/linux/kernel.h):
   arch/sh/include/asm/bitops-op32.h:146:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:144:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/scsi_logging.c: note: in included file (through include/lin=
ux/bitops.h, include/linux/kernel.h):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:154:9: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:155:9: sparse: sparse: u=
nreplaced symbol 'mask'
>> include/asm-generic/bitops/generic-non-atomic.h:156:9: sparse: sparse: u=
nreplaced symbol 'val'
   include/asm-generic/bitops/generic-non-atomic.h:158:19: sparse: sparse: =
unreplaced symbol 'val'
   include/asm-generic/bitops/generic-non-atomic.h:158:25: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:158:9: sparse: sparse: t=
oo many warnings
--
   include/asm-generic/bitops/generic-non-atomic.h:32:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:27:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/scsi_ioctl.c: note: in included file (through arch/sh/inclu=
de/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:51:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:52:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:24: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:40:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/scsi_ioctl.c: note: in included file (through include/linux=
/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:38:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:39:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:36:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/scsi_ioctl.c: note: in included file (through arch/sh/inclu=
de/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:79:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:80:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:23: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:68:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/scsi_ioctl.c: note: in included file (through include/linux=
/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:56:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:57:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:15: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:54:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/scsi_ioctl.c: note: in included file (through arch/sh/inclu=
de/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:98:9: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/sh/include/asm/bitops-op32.h:99:9: sparse: sparse: unreplaced symbo=
l 'p'
   arch/sh/include/asm/bitops-op32.h:100:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:102:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:102:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:102:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:103:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:96:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/scsi_ioctl.c: note: in included file (through include/linux=
/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:74:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:75:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:76:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:78:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:20: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:79:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:72:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/scsi_ioctl.c: note: in included file (through arch/sh/inclu=
de/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:118:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:119:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:120:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:122:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:122:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:122:21: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:123:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:116:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/scsi_ioctl.c: note: in included file (through include/linux=
/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:94:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:95:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:96:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:98:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:21: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:99:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:92:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/scsi_ioctl.c: note: in included file (through arch/sh/inclu=
de/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:130:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:131:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:132:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:134:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:134:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:134:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:135:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:128:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/scsi_ioctl.c: note: in included file (through include/linux=
/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:106:9: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:107:9: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:108:9: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:10: sparse: sparse: =
unreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:110:14: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:20: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:17: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:111:23: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:104:1: sparse: sparse: u=
nreplaced symbol 'return'
   drivers/scsi/scsi_ioctl.c: note: in included file (through arch/sh/inclu=
de/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:146:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:144:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/scsi_ioctl.c: note: in included file (through include/linux=
/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:154:9: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:155:9: sparse: sparse: u=
nreplaced symbol 'mask'
>> include/asm-generic/bitops/generic-non-atomic.h:156:9: sparse: sparse: u=
nreplaced symbol 'val'
   include/asm-generic/bitops/generic-non-atomic.h:158:19: sparse: sparse: =
unreplaced symbol 'val'
   include/asm-generic/bitops/generic-non-atomic.h:158:25: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:158:9: sparse: sparse: t=
oo many warnings
--
   include/asm-generic/bitops/generic-non-atomic.h:32:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:27:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/scsi_pm.c: note: in included file (through arch/sh/include/=
asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:51:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:52:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:24: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:40:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/scsi_pm.c: note: in included file (through include/linux/bi=
tops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:38:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:39:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:36:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/scsi_pm.c: note: in included file (through arch/sh/include/=
asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:79:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:80:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:23: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:68:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/scsi_pm.c: note: in included file (through include/linux/bi=
tops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:56:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:57:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:15: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:54:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/scsi_pm.c: note: in included file (through arch/sh/include/=
asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:98:9: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/sh/include/asm/bitops-op32.h:99:9: sparse: sparse: unreplaced symbo=
l 'p'
   arch/sh/include/asm/bitops-op32.h:100:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:102:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:102:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:102:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:103:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:96:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/scsi_pm.c: note: in included file (through include/linux/bi=
tops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:74:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:75:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:76:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:78:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:20: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:79:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:72:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/scsi_pm.c: note: in included file (through arch/sh/include/=
asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:118:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:119:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:120:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:122:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:122:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:122:21: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:123:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:116:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/scsi_pm.c: note: in included file (through include/linux/bi=
tops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:94:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:95:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:96:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:98:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:21: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:99:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:92:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/scsi_pm.c: note: in included file (through arch/sh/include/=
asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:130:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:131:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:132:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:134:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:134:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:134:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:135:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:128:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/scsi_pm.c: note: in included file (through include/linux/bi=
tops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:106:9: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:107:9: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:108:9: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:10: sparse: sparse: =
unreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:110:14: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:20: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:17: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:111:23: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:104:1: sparse: sparse: u=
nreplaced symbol 'return'
   drivers/scsi/scsi_pm.c: note: in included file (through arch/sh/include/=
asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:146:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:144:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/scsi_pm.c: note: in included file (through include/linux/bi=
tops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:154:9: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:155:9: sparse: sparse: u=
nreplaced symbol 'mask'
>> include/asm-generic/bitops/generic-non-atomic.h:156:9: sparse: sparse: u=
nreplaced symbol 'val'
   include/asm-generic/bitops/generic-non-atomic.h:158:19: sparse: sparse: =
unreplaced symbol 'val'
   include/asm-generic/bitops/generic-non-atomic.h:158:25: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:158:9: sparse: sparse: t=
oo many warnings
--
   include/asm-generic/bitops/generic-non-atomic.h:32:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:27:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/raid_class.c: note: in included file (through arch/sh/inclu=
de/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:51:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:52:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:24: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:40:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/raid_class.c: note: in included file (through include/linux=
/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:38:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:39:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:36:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/raid_class.c: note: in included file (through arch/sh/inclu=
de/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:79:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:80:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:23: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:68:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/raid_class.c: note: in included file (through include/linux=
/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:56:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:57:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:15: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:54:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/raid_class.c: note: in included file (through arch/sh/inclu=
de/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:98:9: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/sh/include/asm/bitops-op32.h:99:9: sparse: sparse: unreplaced symbo=
l 'p'
   arch/sh/include/asm/bitops-op32.h:100:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:102:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:102:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:102:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:103:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:96:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/raid_class.c: note: in included file (through include/linux=
/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:74:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:75:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:76:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:78:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:20: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:79:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:72:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/raid_class.c: note: in included file (through arch/sh/inclu=
de/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:118:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:119:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:120:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:122:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:122:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:122:21: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:123:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:116:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/raid_class.c: note: in included file (through include/linux=
/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:94:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:95:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:96:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:98:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:21: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:99:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:92:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/raid_class.c: note: in included file (through arch/sh/inclu=
de/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:130:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:131:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:132:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:134:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:134:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:134:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:135:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:128:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/raid_class.c: note: in included file (through include/linux=
/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:106:9: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:107:9: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:108:9: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:10: sparse: sparse: =
unreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:110:14: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:20: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:17: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:111:23: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:104:1: sparse: sparse: u=
nreplaced symbol 'return'
   drivers/scsi/raid_class.c: note: in included file (through arch/sh/inclu=
de/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:146:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:144:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/raid_class.c: note: in included file (through include/linux=
/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:154:9: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:155:9: sparse: sparse: u=
nreplaced symbol 'mask'
>> include/asm-generic/bitops/generic-non-atomic.h:156:9: sparse: sparse: u=
nreplaced symbol 'val'
   include/asm-generic/bitops/generic-non-atomic.h:158:19: sparse: sparse: =
unreplaced symbol 'val'
   include/asm-generic/bitops/generic-non-atomic.h:158:25: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:158:9: sparse: sparse: t=
oo many warnings
--
   include/asm-generic/bitops/generic-non-atomic.h:32:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:27:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/scsi_transport_srp.c: note: in included file (through arch/=
sh/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:51:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:52:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:24: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:40:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/scsi_transport_srp.c: note: in included file (through inclu=
de/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:38:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:39:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:36:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/scsi_transport_srp.c: note: in included file (through arch/=
sh/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:79:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:80:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:23: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:68:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/scsi_transport_srp.c: note: in included file (through inclu=
de/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:56:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:57:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:15: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:54:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/scsi_transport_srp.c: note: in included file (through arch/=
sh/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:98:9: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/sh/include/asm/bitops-op32.h:99:9: sparse: sparse: unreplaced symbo=
l 'p'
   arch/sh/include/asm/bitops-op32.h:100:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:102:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:102:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:102:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:103:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:96:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/scsi_transport_srp.c: note: in included file (through inclu=
de/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:74:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:75:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:76:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:78:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:20: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:79:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:72:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/scsi_transport_srp.c: note: in included file (through arch/=
sh/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:118:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:119:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:120:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:122:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:122:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:122:21: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:123:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:116:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/scsi_transport_srp.c: note: in included file (through inclu=
de/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:94:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:95:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:96:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:98:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:21: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:99:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:92:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/scsi_transport_srp.c: note: in included file (through arch/=
sh/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:130:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:131:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:132:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:134:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:134:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:134:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:135:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:128:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/scsi_transport_srp.c: note: in included file (through inclu=
de/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:106:9: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:107:9: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:108:9: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:10: sparse: sparse: =
unreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:110:14: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:20: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:17: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:111:23: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:104:1: sparse: sparse: u=
nreplaced symbol 'return'
   drivers/scsi/scsi_transport_srp.c: note: in included file (through arch/=
sh/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:146:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:144:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/scsi_transport_srp.c: note: in included file (through inclu=
de/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:154:9: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:155:9: sparse: sparse: u=
nreplaced symbol 'mask'
>> include/asm-generic/bitops/generic-non-atomic.h:156:9: sparse: sparse: u=
nreplaced symbol 'val'
   include/asm-generic/bitops/generic-non-atomic.h:158:19: sparse: sparse: =
unreplaced symbol 'val'
   include/asm-generic/bitops/generic-non-atomic.h:158:25: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:158:9: sparse: sparse: t=
oo many warnings
--
   include/asm-generic/bitops/generic-non-atomic.h:32:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:27:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/ses.c: note: in included file (through arch/sh/include/asm/=
bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:51:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:52:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:24: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:40:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/ses.c: note: in included file (through include/linux/bitops=
.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:38:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:39:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:36:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/ses.c: note: in included file (through arch/sh/include/asm/=
bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:79:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:80:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:23: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:68:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/ses.c: note: in included file (through include/linux/bitops=
.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:56:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:57:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:15: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:54:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/ses.c: note: in included file (through arch/sh/include/asm/=
bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:98:9: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/sh/include/asm/bitops-op32.h:99:9: sparse: sparse: unreplaced symbo=
l 'p'
   arch/sh/include/asm/bitops-op32.h:100:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:102:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:102:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:102:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:103:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:96:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/ses.c: note: in included file (through include/linux/bitops=
.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:74:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:75:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:76:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:78:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:20: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:79:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:72:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/ses.c: note: in included file (through arch/sh/include/asm/=
bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:118:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:119:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:120:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:122:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:122:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:122:21: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:123:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:116:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/ses.c: note: in included file (through include/linux/bitops=
.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:94:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:95:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:96:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:98:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:21: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:99:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:92:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/ses.c: note: in included file (through arch/sh/include/asm/=
bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:130:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:131:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:132:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:134:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:134:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:134:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:135:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:128:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/ses.c: note: in included file (through include/linux/bitops=
.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:106:9: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:107:9: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:108:9: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:10: sparse: sparse: =
unreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:110:14: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:20: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:17: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:111:23: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:104:1: sparse: sparse: u=
nreplaced symbol 'return'
   drivers/scsi/ses.c: note: in included file (through arch/sh/include/asm/=
bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:146:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:144:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/ses.c: note: in included file (through include/linux/bitops=
.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:154:9: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:155:9: sparse: sparse: u=
nreplaced symbol 'mask'
>> include/asm-generic/bitops/generic-non-atomic.h:156:9: sparse: sparse: u=
nreplaced symbol 'val'
   include/asm-generic/bitops/generic-non-atomic.h:158:19: sparse: sparse: =
unreplaced symbol 'val'
   include/asm-generic/bitops/generic-non-atomic.h:158:25: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:158:9: sparse: sparse: t=
oo many warnings
--
   include/asm-generic/bitops/generic-non-atomic.h:32:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:27:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/scsi_error.c: note: in included file (through arch/sh/inclu=
de/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:51:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:52:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:24: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:40:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/scsi_error.c: note: in included file (through include/linux=
/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:38:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:39:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:36:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/scsi_error.c: note: in included file (through arch/sh/inclu=
de/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:79:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:80:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:23: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:68:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/scsi_error.c: note: in included file (through include/linux=
/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:56:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:57:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:15: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:54:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/scsi_error.c: note: in included file (through arch/sh/inclu=
de/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:98:9: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/sh/include/asm/bitops-op32.h:99:9: sparse: sparse: unreplaced symbo=
l 'p'
   arch/sh/include/asm/bitops-op32.h:100:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:102:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:102:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:102:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:103:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:96:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/scsi_error.c: note: in included file (through include/linux=
/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:74:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:75:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:76:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:78:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:20: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:79:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:72:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/scsi_error.c: note: in included file (through arch/sh/inclu=
de/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:118:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:119:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:120:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:122:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:122:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:122:21: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:123:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:116:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/scsi_error.c: note: in included file (through include/linux=
/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:94:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:95:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:96:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:98:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:21: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:99:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:92:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/scsi_error.c: note: in included file (through arch/sh/inclu=
de/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:130:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:131:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:132:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:134:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:134:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:134:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:135:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:128:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/scsi_error.c: note: in included file (through include/linux=
/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:106:9: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:107:9: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:108:9: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:10: sparse: sparse: =
unreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:110:14: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:20: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:17: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:111:23: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:104:1: sparse: sparse: u=
nreplaced symbol 'return'
   drivers/scsi/scsi_error.c: note: in included file (through arch/sh/inclu=
de/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:146:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:144:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/scsi_error.c: note: in included file (through include/linux=
/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:154:9: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:155:9: sparse: sparse: u=
nreplaced symbol 'mask'
>> include/asm-generic/bitops/generic-non-atomic.h:156:9: sparse: sparse: u=
nreplaced symbol 'val'
   include/asm-generic/bitops/generic-non-atomic.h:158:19: sparse: sparse: =
unreplaced symbol 'val'
   include/asm-generic/bitops/generic-non-atomic.h:158:25: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:158:9: sparse: sparse: t=
oo many warnings
--
   include/asm-generic/bitops/generic-non-atomic.h:32:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:27:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/sg.c: note: in included file (through arch/sh/include/asm/b=
itops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:51:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:52:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:24: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:40:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/sg.c: note: in included file (through include/linux/bitops.=
h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:38:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:39:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:36:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/sg.c: note: in included file (through arch/sh/include/asm/b=
itops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:79:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:80:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:23: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:68:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/sg.c: note: in included file (through include/linux/bitops.=
h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:56:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:57:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:15: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:54:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/sg.c: note: in included file (through arch/sh/include/asm/b=
itops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:98:9: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/sh/include/asm/bitops-op32.h:99:9: sparse: sparse: unreplaced symbo=
l 'p'
   arch/sh/include/asm/bitops-op32.h:100:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:102:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:102:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:102:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:103:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:96:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/sg.c: note: in included file (through include/linux/bitops.=
h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:74:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:75:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:76:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:78:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:20: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:79:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:72:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/sg.c: note: in included file (through arch/sh/include/asm/b=
itops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:118:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:119:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:120:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:122:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:122:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:122:21: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:123:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:116:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/sg.c: note: in included file (through include/linux/bitops.=
h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:94:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:95:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:96:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:98:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:21: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:99:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:92:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/sg.c: note: in included file (through arch/sh/include/asm/b=
itops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:130:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:131:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:132:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:134:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:134:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:134:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:135:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:128:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/sg.c: note: in included file (through include/linux/bitops.=
h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:106:9: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:107:9: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:108:9: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:10: sparse: sparse: =
unreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:110:14: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:20: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:17: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:111:23: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:104:1: sparse: sparse: u=
nreplaced symbol 'return'
   drivers/scsi/sg.c: note: in included file (through arch/sh/include/asm/b=
itops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:146:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:144:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/sg.c: note: in included file (through include/linux/bitops.=
h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:154:9: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:155:9: sparse: sparse: u=
nreplaced symbol 'mask'
>> include/asm-generic/bitops/generic-non-atomic.h:156:9: sparse: sparse: u=
nreplaced symbol 'val'
   include/asm-generic/bitops/generic-non-atomic.h:158:19: sparse: sparse: =
unreplaced symbol 'val'
   include/asm-generic/bitops/generic-non-atomic.h:158:25: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:158:9: sparse: sparse: t=
oo many warnings
--
   include/asm-generic/bitops/generic-non-atomic.h:32:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:27:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/scsi.c: note: in included file (through arch/sh/include/asm=
/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:51:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:52:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:24: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:40:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/scsi.c: note: in included file (through include/linux/bitop=
s.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:38:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:39:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:36:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/scsi.c: note: in included file (through arch/sh/include/asm=
/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:79:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:80:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:23: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:68:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/scsi.c: note: in included file (through include/linux/bitop=
s.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:56:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:57:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:15: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:54:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/scsi.c: note: in included file (through arch/sh/include/asm=
/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:98:9: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/sh/include/asm/bitops-op32.h:99:9: sparse: sparse: unreplaced symbo=
l 'p'
   arch/sh/include/asm/bitops-op32.h:100:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:102:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:102:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:102:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:103:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:96:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/scsi.c: note: in included file (through include/linux/bitop=
s.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:74:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:75:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:76:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:78:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:20: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:79:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:72:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/scsi.c: note: in included file (through arch/sh/include/asm=
/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:118:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:119:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:120:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:122:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:122:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:122:21: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:123:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:116:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/scsi.c: note: in included file (through include/linux/bitop=
s.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:94:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:95:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:96:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:98:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:21: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:99:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:92:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/scsi.c: note: in included file (through arch/sh/include/asm=
/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:130:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:131:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:132:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:134:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:134:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:134:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:135:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:128:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/scsi.c: note: in included file (through include/linux/bitop=
s.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:106:9: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:107:9: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:108:9: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:10: sparse: sparse: =
unreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:110:14: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:20: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:17: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:111:23: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:104:1: sparse: sparse: u=
nreplaced symbol 'return'
   drivers/scsi/scsi.c: note: in included file (through arch/sh/include/asm=
/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:146:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:144:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/scsi.c: note: in included file (through include/linux/bitop=
s.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:154:9: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:155:9: sparse: sparse: u=
nreplaced symbol 'mask'
>> include/asm-generic/bitops/generic-non-atomic.h:156:9: sparse: sparse: u=
nreplaced symbol 'val'
   include/asm-generic/bitops/generic-non-atomic.h:158:19: sparse: sparse: =
unreplaced symbol 'val'
   include/asm-generic/bitops/generic-non-atomic.h:158:25: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:158:9: sparse: sparse: t=
oo many warnings
--
   include/asm-generic/bitops/generic-non-atomic.h:32:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:27:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/sd_dif.c: note: in included file (through arch/sh/include/a=
sm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:51:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:52:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:24: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:40:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/sd_dif.c: note: in included file (through include/linux/bit=
ops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:38:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:39:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:36:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/sd_dif.c: note: in included file (through arch/sh/include/a=
sm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:79:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:80:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:23: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:68:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/sd_dif.c: note: in included file (through include/linux/bit=
ops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:56:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:57:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:15: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:54:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/sd_dif.c: note: in included file (through arch/sh/include/a=
sm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:98:9: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/sh/include/asm/bitops-op32.h:99:9: sparse: sparse: unreplaced symbo=
l 'p'
   arch/sh/include/asm/bitops-op32.h:100:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:102:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:102:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:102:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:103:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:96:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/sd_dif.c: note: in included file (through include/linux/bit=
ops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:74:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:75:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:76:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:78:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:20: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:79:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:72:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/sd_dif.c: note: in included file (through arch/sh/include/a=
sm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:118:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:119:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:120:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:122:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:122:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:122:21: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:123:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:116:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/sd_dif.c: note: in included file (through include/linux/bit=
ops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:94:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:95:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:96:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:98:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:21: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:99:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:92:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/sd_dif.c: note: in included file (through arch/sh/include/a=
sm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:130:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:131:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:132:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:134:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:134:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:134:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:135:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:128:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/sd_dif.c: note: in included file (through include/linux/bit=
ops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:106:9: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:107:9: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:108:9: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:10: sparse: sparse: =
unreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:110:14: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:20: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:17: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:111:23: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:104:1: sparse: sparse: u=
nreplaced symbol 'return'
   drivers/scsi/sd_dif.c: note: in included file (through arch/sh/include/a=
sm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:146:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:144:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/sd_dif.c: note: in included file (through include/linux/bit=
ops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:154:9: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:155:9: sparse: sparse: u=
nreplaced symbol 'mask'
>> include/asm-generic/bitops/generic-non-atomic.h:156:9: sparse: sparse: u=
nreplaced symbol 'val'
   include/asm-generic/bitops/generic-non-atomic.h:158:19: sparse: sparse: =
unreplaced symbol 'val'
   include/asm-generic/bitops/generic-non-atomic.h:158:25: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:158:9: sparse: sparse: t=
oo many warnings
--
   include/asm-generic/bitops/generic-non-atomic.h:32:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:27:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/scsi_scan.c: note: in included file (through arch/sh/includ=
e/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:51:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:52:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:24: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:40:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/scsi_scan.c: note: in included file (through include/linux/=
bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:38:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:39:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:36:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/scsi_scan.c: note: in included file (through arch/sh/includ=
e/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:79:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:80:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:23: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:68:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/scsi_scan.c: note: in included file (through include/linux/=
bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:56:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:57:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:15: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:54:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/scsi_scan.c: note: in included file (through arch/sh/includ=
e/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:98:9: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/sh/include/asm/bitops-op32.h:99:9: sparse: sparse: unreplaced symbo=
l 'p'
   arch/sh/include/asm/bitops-op32.h:100:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:102:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:102:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:102:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:103:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:96:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/scsi_scan.c: note: in included file (through include/linux/=
bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:74:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:75:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:76:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:78:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:20: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:79:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:72:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/scsi_scan.c: note: in included file (through arch/sh/includ=
e/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:118:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:119:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:120:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:122:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:122:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:122:21: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:123:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:116:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/scsi_scan.c: note: in included file (through include/linux/=
bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:94:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:95:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:96:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:98:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:21: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:99:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:92:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/scsi_scan.c: note: in included file (through arch/sh/includ=
e/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:130:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:131:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:132:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:134:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:134:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:134:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:135:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:128:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/scsi_scan.c: note: in included file (through include/linux/=
bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:106:9: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:107:9: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:108:9: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:10: sparse: sparse: =
unreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:110:14: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:20: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:17: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:111:23: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:104:1: sparse: sparse: u=
nreplaced symbol 'return'
   drivers/scsi/scsi_scan.c: note: in included file (through arch/sh/includ=
e/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:146:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:144:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/scsi_scan.c: note: in included file (through include/linux/=
bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:154:9: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:155:9: sparse: sparse: u=
nreplaced symbol 'mask'
>> include/asm-generic/bitops/generic-non-atomic.h:156:9: sparse: sparse: u=
nreplaced symbol 'val'
   include/asm-generic/bitops/generic-non-atomic.h:158:19: sparse: sparse: =
unreplaced symbol 'val'
   include/asm-generic/bitops/generic-non-atomic.h:158:25: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:158:9: sparse: sparse: t=
oo many warnings
--
   include/asm-generic/bitops/generic-non-atomic.h:32:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:27:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/scsi_transport_sas.c: note: in included file (through arch/=
sh/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:51:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:52:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:24: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:40:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/scsi_transport_sas.c: note: in included file (through inclu=
de/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:38:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:39:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:36:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/scsi_transport_sas.c: note: in included file (through arch/=
sh/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:79:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:80:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:23: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:68:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/scsi_transport_sas.c: note: in included file (through inclu=
de/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:56:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:57:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:15: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:54:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/scsi_transport_sas.c: note: in included file (through arch/=
sh/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:98:9: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/sh/include/asm/bitops-op32.h:99:9: sparse: sparse: unreplaced symbo=
l 'p'
   arch/sh/include/asm/bitops-op32.h:100:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:102:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:102:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:102:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:103:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:96:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/scsi_transport_sas.c: note: in included file (through inclu=
de/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:74:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:75:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:76:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:78:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:20: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:79:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:72:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/scsi_transport_sas.c: note: in included file (through arch/=
sh/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:118:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:119:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:120:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:122:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:122:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:122:21: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:123:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:116:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/scsi_transport_sas.c: note: in included file (through inclu=
de/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:94:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:95:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:96:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:98:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:21: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:99:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:92:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/scsi_transport_sas.c: note: in included file (through arch/=
sh/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:130:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:131:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:132:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:134:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:134:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:134:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:135:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:128:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/scsi_transport_sas.c: note: in included file (through inclu=
de/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:106:9: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:107:9: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:108:9: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:10: sparse: sparse: =
unreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:110:14: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:20: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:17: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:111:23: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:104:1: sparse: sparse: u=
nreplaced symbol 'return'
   drivers/scsi/scsi_transport_sas.c: note: in included file (through arch/=
sh/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:146:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:144:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/scsi_transport_sas.c: note: in included file (through inclu=
de/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:154:9: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:155:9: sparse: sparse: u=
nreplaced symbol 'mask'
>> include/asm-generic/bitops/generic-non-atomic.h:156:9: sparse: sparse: u=
nreplaced symbol 'val'
   include/asm-generic/bitops/generic-non-atomic.h:158:19: sparse: sparse: =
unreplaced symbol 'val'
   include/asm-generic/bitops/generic-non-atomic.h:158:25: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:158:9: sparse: sparse: t=
oo many warnings
--
   include/asm-generic/bitops/generic-non-atomic.h:32:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:27:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/scsi_lib.c: note: in included file (through arch/sh/include=
/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:51:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:52:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:24: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:40:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/scsi_lib.c: note: in included file (through include/linux/b=
itops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:38:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:39:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:36:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/scsi_lib.c: note: in included file (through arch/sh/include=
/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:79:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:80:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:23: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:68:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/scsi_lib.c: note: in included file (through include/linux/b=
itops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:56:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:57:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:15: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:54:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/scsi_lib.c: note: in included file (through arch/sh/include=
/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:98:9: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/sh/include/asm/bitops-op32.h:99:9: sparse: sparse: unreplaced symbo=
l 'p'
   arch/sh/include/asm/bitops-op32.h:100:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:102:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:102:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:102:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:103:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:96:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/scsi_lib.c: note: in included file (through include/linux/b=
itops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:74:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:75:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:76:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:78:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:20: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:79:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:72:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/scsi_lib.c: note: in included file (through arch/sh/include=
/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:118:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:119:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:120:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:122:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:122:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:122:21: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:123:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:116:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/scsi_lib.c: note: in included file (through include/linux/b=
itops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:94:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:95:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:96:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:98:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:21: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:99:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:92:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/scsi_lib.c: note: in included file (through arch/sh/include=
/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:130:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:131:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:132:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:134:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:134:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:134:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:135:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:128:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/scsi_lib.c: note: in included file (through include/linux/b=
itops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:106:9: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:107:9: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:108:9: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:10: sparse: sparse: =
unreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:110:14: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:20: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:17: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:111:23: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:104:1: sparse: sparse: u=
nreplaced symbol 'return'
   drivers/scsi/scsi_lib.c: note: in included file (through arch/sh/include=
/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:146:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:144:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/scsi_lib.c: note: in included file (through include/linux/b=
itops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:154:9: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:155:9: sparse: sparse: u=
nreplaced symbol 'mask'
>> include/asm-generic/bitops/generic-non-atomic.h:156:9: sparse: sparse: u=
nreplaced symbol 'val'
   include/asm-generic/bitops/generic-non-atomic.h:158:19: sparse: sparse: =
unreplaced symbol 'val'
   include/asm-generic/bitops/generic-non-atomic.h:158:25: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:158:9: sparse: sparse: t=
oo many warnings
--
   include/asm-generic/bitops/generic-non-atomic.h:32:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:27:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/sd_zbc.c: note: in included file (through arch/sh/include/a=
sm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:51:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:52:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:24: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:40:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/sd_zbc.c: note: in included file (through include/linux/bit=
ops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:38:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:39:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:36:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/sd_zbc.c: note: in included file (through arch/sh/include/a=
sm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:79:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:80:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:23: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:68:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/sd_zbc.c: note: in included file (through include/linux/bit=
ops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:56:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:57:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:15: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:54:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/sd_zbc.c: note: in included file (through arch/sh/include/a=
sm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:98:9: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/sh/include/asm/bitops-op32.h:99:9: sparse: sparse: unreplaced symbo=
l 'p'
   arch/sh/include/asm/bitops-op32.h:100:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:102:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:102:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:102:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:103:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:96:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/sd_zbc.c: note: in included file (through include/linux/bit=
ops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:74:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:75:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:76:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:78:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:20: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:79:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:72:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/sd_zbc.c: note: in included file (through arch/sh/include/a=
sm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:118:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:119:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:120:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:122:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:122:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:122:21: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:123:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:116:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/sd_zbc.c: note: in included file (through include/linux/bit=
ops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:94:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:95:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:96:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:98:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:21: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:99:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:92:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/sd_zbc.c: note: in included file (through arch/sh/include/a=
sm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:130:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:131:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:132:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:134:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:134:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:134:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:135:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:128:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/sd_zbc.c: note: in included file (through include/linux/bit=
ops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:106:9: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:107:9: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:108:9: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:10: sparse: sparse: =
unreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:110:14: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:20: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:17: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:111:23: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:104:1: sparse: sparse: u=
nreplaced symbol 'return'
   drivers/scsi/sd_zbc.c: note: in included file (through arch/sh/include/a=
sm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:146:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:144:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/sd_zbc.c: note: in included file (through include/linux/bit=
ops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:154:9: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:155:9: sparse: sparse: u=
nreplaced symbol 'mask'
>> include/asm-generic/bitops/generic-non-atomic.h:156:9: sparse: sparse: u=
nreplaced symbol 'val'
   include/asm-generic/bitops/generic-non-atomic.h:158:19: sparse: sparse: =
unreplaced symbol 'val'
   include/asm-generic/bitops/generic-non-atomic.h:158:25: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:158:9: sparse: sparse: t=
oo many warnings
--
   include/asm-generic/bitops/generic-non-atomic.h:32:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:27:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/scsi_sysfs.c: note: in included file (through arch/sh/inclu=
de/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:51:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:52:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:24: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:40:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/scsi_sysfs.c: note: in included file (through include/linux=
/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:38:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:39:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:36:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/scsi_sysfs.c: note: in included file (through arch/sh/inclu=
de/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:79:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:80:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:23: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:68:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/scsi_sysfs.c: note: in included file (through include/linux=
/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:56:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:57:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:15: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:54:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/scsi_sysfs.c: note: in included file (through arch/sh/inclu=
de/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:98:9: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/sh/include/asm/bitops-op32.h:99:9: sparse: sparse: unreplaced symbo=
l 'p'
   arch/sh/include/asm/bitops-op32.h:100:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:102:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:102:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:102:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:103:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:96:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/scsi_sysfs.c: note: in included file (through include/linux=
/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:74:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:75:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:76:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:78:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:20: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:79:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:72:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/scsi_sysfs.c: note: in included file (through arch/sh/inclu=
de/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:118:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:119:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:120:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:122:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:122:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:122:21: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:123:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:116:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/scsi_sysfs.c: note: in included file (through include/linux=
/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:94:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:95:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:96:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:98:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:21: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:99:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:92:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/scsi_sysfs.c: note: in included file (through arch/sh/inclu=
de/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:130:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:131:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:132:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:134:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:134:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:134:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:135:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:128:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/scsi_sysfs.c: note: in included file (through include/linux=
/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:106:9: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:107:9: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:108:9: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:10: sparse: sparse: =
unreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:110:14: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:20: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:17: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:111:23: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:104:1: sparse: sparse: u=
nreplaced symbol 'return'
   drivers/scsi/scsi_sysfs.c: note: in included file (through arch/sh/inclu=
de/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:146:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:144:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/scsi_sysfs.c: note: in included file (through include/linux=
/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:154:9: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:155:9: sparse: sparse: u=
nreplaced symbol 'mask'
>> include/asm-generic/bitops/generic-non-atomic.h:156:9: sparse: sparse: u=
nreplaced symbol 'val'
   include/asm-generic/bitops/generic-non-atomic.h:158:19: sparse: sparse: =
unreplaced symbol 'val'
   include/asm-generic/bitops/generic-non-atomic.h:158:25: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:158:9: sparse: sparse: t=
oo many warnings
--
   include/asm-generic/bitops/generic-non-atomic.h:32:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:27:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/sd.c: note: in included file (through arch/sh/include/asm/b=
itops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:51:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:52:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:24: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:40:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/sd.c: note: in included file (through include/linux/bitops.=
h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:38:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:39:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:36:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/sd.c: note: in included file (through arch/sh/include/asm/b=
itops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:79:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:80:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:23: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:68:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/sd.c: note: in included file (through include/linux/bitops.=
h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:56:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:57:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:15: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:54:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/sd.c: note: in included file (through arch/sh/include/asm/b=
itops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:98:9: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/sh/include/asm/bitops-op32.h:99:9: sparse: sparse: unreplaced symbo=
l 'p'
   arch/sh/include/asm/bitops-op32.h:100:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:102:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:102:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:102:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:103:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:96:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/sd.c: note: in included file (through include/linux/bitops.=
h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:74:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:75:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:76:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:78:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:20: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:79:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:72:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/sd.c: note: in included file (through arch/sh/include/asm/b=
itops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:118:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:119:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:120:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:122:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:122:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:122:21: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:123:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:116:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/sd.c: note: in included file (through include/linux/bitops.=
h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:94:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:95:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:96:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:98:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:21: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:99:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:92:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/sd.c: note: in included file (through arch/sh/include/asm/b=
itops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:130:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:131:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:132:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:134:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:134:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:134:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:135:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:128:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/sd.c: note: in included file (through include/linux/bitops.=
h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:106:9: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:107:9: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:108:9: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:10: sparse: sparse: =
unreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:110:14: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:20: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:17: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:111:23: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:104:1: sparse: sparse: u=
nreplaced symbol 'return'
   drivers/scsi/sd.c: note: in included file (through arch/sh/include/asm/b=
itops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:146:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:144:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/sd.c: note: in included file (through include/linux/bitops.=
h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:154:9: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:155:9: sparse: sparse: u=
nreplaced symbol 'mask'
>> include/asm-generic/bitops/generic-non-atomic.h:156:9: sparse: sparse: u=
nreplaced symbol 'val'
   include/asm-generic/bitops/generic-non-atomic.h:158:19: sparse: sparse: =
unreplaced symbol 'val'
   include/asm-generic/bitops/generic-non-atomic.h:158:25: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:158:9: sparse: sparse: t=
oo many warnings
--
   include/asm-generic/bitops/generic-non-atomic.h:32:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:27:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/st.c: note: in included file (through arch/sh/include/asm/b=
itops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:51:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:52:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:24: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:40:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/st.c: note: in included file (through include/linux/bitops.=
h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:38:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:39:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:36:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/st.c: note: in included file (through arch/sh/include/asm/b=
itops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:79:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:80:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:23: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:68:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/st.c: note: in included file (through include/linux/bitops.=
h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:56:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:57:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:15: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:54:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/st.c: note: in included file (through arch/sh/include/asm/b=
itops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:98:9: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/sh/include/asm/bitops-op32.h:99:9: sparse: sparse: unreplaced symbo=
l 'p'
   arch/sh/include/asm/bitops-op32.h:100:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:102:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:102:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:102:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:103:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:96:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/st.c: note: in included file (through include/linux/bitops.=
h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:74:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:75:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:76:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:78:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:20: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:79:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:72:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/st.c: note: in included file (through arch/sh/include/asm/b=
itops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:118:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:119:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:120:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:122:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:122:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:122:21: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:123:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:116:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/st.c: note: in included file (through include/linux/bitops.=
h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:94:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:95:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:96:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:98:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:21: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:99:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:92:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/st.c: note: in included file (through arch/sh/include/asm/b=
itops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:130:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:131:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:132:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:134:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:134:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:134:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:135:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:128:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/st.c: note: in included file (through include/linux/bitops.=
h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:106:9: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:107:9: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:108:9: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:10: sparse: sparse: =
unreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:110:14: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:20: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:17: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:111:23: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:104:1: sparse: sparse: u=
nreplaced symbol 'return'
   drivers/scsi/st.c: note: in included file (through arch/sh/include/asm/b=
itops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:146:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:144:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/st.c: note: in included file (through include/linux/bitops.=
h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:154:9: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:155:9: sparse: sparse: u=
nreplaced symbol 'mask'
>> include/asm-generic/bitops/generic-non-atomic.h:156:9: sparse: sparse: u=
nreplaced symbol 'val'
   include/asm-generic/bitops/generic-non-atomic.h:158:19: sparse: sparse: =
unreplaced symbol 'val'
   include/asm-generic/bitops/generic-non-atomic.h:158:25: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:158:9: sparse: sparse: t=
oo many warnings
--
   include/asm-generic/bitops/generic-non-atomic.h:32:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:27:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/scsi_transport_iscsi.c: note: in included file (through arc=
h/sh/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ..=
.):
   arch/sh/include/asm/bitops-op32.h:51:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:52:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:24: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:40:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/scsi_transport_iscsi.c: note: in included file (through inc=
lude/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...=
):
   include/asm-generic/bitops/generic-non-atomic.h:38:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:39:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:36:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/scsi_transport_iscsi.c: note: in included file (through arc=
h/sh/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ..=
.):
   arch/sh/include/asm/bitops-op32.h:79:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:80:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:23: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:68:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/scsi_transport_iscsi.c: note: in included file (through inc=
lude/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...=
):
   include/asm-generic/bitops/generic-non-atomic.h:56:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:57:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:15: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:54:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/scsi_transport_iscsi.c: note: in included file (through arc=
h/sh/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ..=
.):
   arch/sh/include/asm/bitops-op32.h:98:9: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/sh/include/asm/bitops-op32.h:99:9: sparse: sparse: unreplaced symbo=
l 'p'
   arch/sh/include/asm/bitops-op32.h:100:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:102:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:102:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:102:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:103:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:96:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/scsi_transport_iscsi.c: note: in included file (through inc=
lude/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...=
):
   include/asm-generic/bitops/generic-non-atomic.h:74:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:75:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:76:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:78:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:20: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:79:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:72:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/scsi_transport_iscsi.c: note: in included file (through arc=
h/sh/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ..=
.):
   arch/sh/include/asm/bitops-op32.h:118:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:119:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:120:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:122:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:122:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:122:21: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:123:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:116:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/scsi_transport_iscsi.c: note: in included file (through inc=
lude/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...=
):
   include/asm-generic/bitops/generic-non-atomic.h:94:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:95:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:96:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:98:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:21: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:99:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:92:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/scsi_transport_iscsi.c: note: in included file (through arc=
h/sh/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ..=
.):
   arch/sh/include/asm/bitops-op32.h:130:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:131:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:132:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:134:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:134:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:134:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:135:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:128:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/scsi_transport_iscsi.c: note: in included file (through inc=
lude/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...=
):
   include/asm-generic/bitops/generic-non-atomic.h:106:9: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:107:9: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:108:9: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:10: sparse: sparse: =
unreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:110:14: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:20: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:17: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:111:23: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:104:1: sparse: sparse: u=
nreplaced symbol 'return'
   drivers/scsi/scsi_transport_iscsi.c: note: in included file (through arc=
h/sh/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ..=
.):
   arch/sh/include/asm/bitops-op32.h:146:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:144:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/scsi_transport_iscsi.c: note: in included file (through inc=
lude/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...=
):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:154:9: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:155:9: sparse: sparse: u=
nreplaced symbol 'mask'
>> include/asm-generic/bitops/generic-non-atomic.h:156:9: sparse: sparse: u=
nreplaced symbol 'val'
   include/asm-generic/bitops/generic-non-atomic.h:158:19: sparse: sparse: =
unreplaced symbol 'val'
   include/asm-generic/bitops/generic-non-atomic.h:158:25: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:158:9: sparse: sparse: t=
oo many warnings
--
   include/asm-generic/bitops/generic-non-atomic.h:32:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:27:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/libsas/sas_host_smp.c: note: in included file (through arch=
/sh/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...=
):
   arch/sh/include/asm/bitops-op32.h:51:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:52:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:24: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:40:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/libsas/sas_host_smp.c: note: in included file (through incl=
ude/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:38:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:39:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:36:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/libsas/sas_host_smp.c: note: in included file (through arch=
/sh/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...=
):
   arch/sh/include/asm/bitops-op32.h:79:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:80:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:23: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:68:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/libsas/sas_host_smp.c: note: in included file (through incl=
ude/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:56:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:57:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:15: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:54:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/libsas/sas_host_smp.c: note: in included file (through arch=
/sh/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...=
):
   arch/sh/include/asm/bitops-op32.h:98:9: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/sh/include/asm/bitops-op32.h:99:9: sparse: sparse: unreplaced symbo=
l 'p'
   arch/sh/include/asm/bitops-op32.h:100:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:102:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:102:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:102:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:103:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:96:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/libsas/sas_host_smp.c: note: in included file (through incl=
ude/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:74:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:75:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:76:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:78:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:20: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:79:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:72:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/libsas/sas_host_smp.c: note: in included file (through arch=
/sh/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...=
):
   arch/sh/include/asm/bitops-op32.h:118:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:119:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:120:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:122:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:122:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:122:21: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:123:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:116:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/libsas/sas_host_smp.c: note: in included file (through incl=
ude/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:94:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:95:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:96:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:98:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:21: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:99:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:92:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/libsas/sas_host_smp.c: note: in included file (through arch=
/sh/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...=
):
   arch/sh/include/asm/bitops-op32.h:130:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:131:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:132:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:134:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:134:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:134:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:135:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:128:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/libsas/sas_host_smp.c: note: in included file (through incl=
ude/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:106:9: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:107:9: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:108:9: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:10: sparse: sparse: =
unreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:110:14: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:20: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:17: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:111:23: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:104:1: sparse: sparse: u=
nreplaced symbol 'return'
   drivers/scsi/libsas/sas_host_smp.c: note: in included file (through arch=
/sh/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...=
):
   arch/sh/include/asm/bitops-op32.h:146:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:144:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/libsas/sas_host_smp.c: note: in included file (through incl=
ude/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:154:9: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:155:9: sparse: sparse: u=
nreplaced symbol 'mask'
>> include/asm-generic/bitops/generic-non-atomic.h:156:9: sparse: sparse: u=
nreplaced symbol 'val'
   include/asm-generic/bitops/generic-non-atomic.h:158:19: sparse: sparse: =
unreplaced symbol 'val'
   include/asm-generic/bitops/generic-non-atomic.h:158:25: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:158:9: sparse: sparse: t=
oo many warnings
--
   include/asm-generic/bitops/generic-non-atomic.h:32:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:27:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/libsas/sas_event.c: note: in included file (through arch/sh=
/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:51:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:52:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:24: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:40:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/libsas/sas_event.c: note: in included file (through include=
/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:38:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:39:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:36:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/libsas/sas_event.c: note: in included file (through arch/sh=
/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:79:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:80:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:23: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:68:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/libsas/sas_event.c: note: in included file (through include=
/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:56:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:57:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:15: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:54:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/libsas/sas_event.c: note: in included file (through arch/sh=
/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:98:9: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/sh/include/asm/bitops-op32.h:99:9: sparse: sparse: unreplaced symbo=
l 'p'
   arch/sh/include/asm/bitops-op32.h:100:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:102:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:102:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:102:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:103:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:96:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/libsas/sas_event.c: note: in included file (through include=
/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:74:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:75:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:76:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:78:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:20: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:79:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:72:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/libsas/sas_event.c: note: in included file (through arch/sh=
/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:118:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:119:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:120:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:122:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:122:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:122:21: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:123:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:116:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/libsas/sas_event.c: note: in included file (through include=
/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:94:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:95:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:96:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:98:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:21: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:99:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:92:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/libsas/sas_event.c: note: in included file (through arch/sh=
/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:130:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:131:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:132:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:134:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:134:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:134:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:135:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:128:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/libsas/sas_event.c: note: in included file (through include=
/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:106:9: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:107:9: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:108:9: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:10: sparse: sparse: =
unreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:110:14: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:20: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:17: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:111:23: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:104:1: sparse: sparse: u=
nreplaced symbol 'return'
   drivers/scsi/libsas/sas_event.c: note: in included file (through arch/sh=
/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:146:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:144:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/libsas/sas_event.c: note: in included file (through include=
/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:154:9: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:155:9: sparse: sparse: u=
nreplaced symbol 'mask'
>> include/asm-generic/bitops/generic-non-atomic.h:156:9: sparse: sparse: u=
nreplaced symbol 'val'
   include/asm-generic/bitops/generic-non-atomic.h:158:19: sparse: sparse: =
unreplaced symbol 'val'
   include/asm-generic/bitops/generic-non-atomic.h:158:25: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:158:9: sparse: sparse: t=
oo many warnings
--
   include/asm-generic/bitops/generic-non-atomic.h:32:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:27:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/libsas/sas_task.c: note: in included file (through arch/sh/=
include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:51:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:52:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:24: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:40:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/libsas/sas_task.c: note: in included file (through include/=
linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:38:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:39:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:36:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/libsas/sas_task.c: note: in included file (through arch/sh/=
include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:79:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:80:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:23: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:68:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/libsas/sas_task.c: note: in included file (through include/=
linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:56:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:57:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:15: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:54:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/libsas/sas_task.c: note: in included file (through arch/sh/=
include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:98:9: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/sh/include/asm/bitops-op32.h:99:9: sparse: sparse: unreplaced symbo=
l 'p'
   arch/sh/include/asm/bitops-op32.h:100:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:102:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:102:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:102:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:103:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:96:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/libsas/sas_task.c: note: in included file (through include/=
linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:74:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:75:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:76:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:78:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:20: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:79:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:72:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/libsas/sas_task.c: note: in included file (through arch/sh/=
include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:118:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:119:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:120:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:122:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:122:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:122:21: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:123:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:116:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/libsas/sas_task.c: note: in included file (through include/=
linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:94:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:95:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:96:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:98:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:21: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:99:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:92:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/libsas/sas_task.c: note: in included file (through arch/sh/=
include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:130:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:131:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:132:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:134:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:134:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:134:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:135:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:128:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/libsas/sas_task.c: note: in included file (through include/=
linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:106:9: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:107:9: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:108:9: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:10: sparse: sparse: =
unreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:110:14: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:20: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:17: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:111:23: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:104:1: sparse: sparse: u=
nreplaced symbol 'return'
   drivers/scsi/libsas/sas_task.c: note: in included file (through arch/sh/=
include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:146:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:144:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/libsas/sas_task.c: note: in included file (through include/=
linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:154:9: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:155:9: sparse: sparse: u=
nreplaced symbol 'mask'
>> include/asm-generic/bitops/generic-non-atomic.h:156:9: sparse: sparse: u=
nreplaced symbol 'val'
   include/asm-generic/bitops/generic-non-atomic.h:158:19: sparse: sparse: =
unreplaced symbol 'val'
   include/asm-generic/bitops/generic-non-atomic.h:158:25: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:158:9: sparse: sparse: t=
oo many warnings
--
   include/asm-generic/bitops/generic-non-atomic.h:32:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:27:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/libsas/sas_init.c: note: in included file (through arch/sh/=
include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:51:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:52:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:24: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:40:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/libsas/sas_init.c: note: in included file (through include/=
linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:38:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:39:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:36:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/libsas/sas_init.c: note: in included file (through arch/sh/=
include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:79:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:80:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:23: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:68:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/libsas/sas_init.c: note: in included file (through include/=
linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:56:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:57:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:15: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:54:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/libsas/sas_init.c: note: in included file (through arch/sh/=
include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:98:9: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/sh/include/asm/bitops-op32.h:99:9: sparse: sparse: unreplaced symbo=
l 'p'
   arch/sh/include/asm/bitops-op32.h:100:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:102:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:102:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:102:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:103:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:96:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/libsas/sas_init.c: note: in included file (through include/=
linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:74:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:75:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:76:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:78:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:20: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:79:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:72:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/libsas/sas_init.c: note: in included file (through arch/sh/=
include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:118:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:119:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:120:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:122:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:122:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:122:21: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:123:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:116:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/libsas/sas_init.c: note: in included file (through include/=
linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:94:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:95:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:96:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:98:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:21: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:99:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:92:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/libsas/sas_init.c: note: in included file (through arch/sh/=
include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:130:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:131:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:132:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:134:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:134:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:134:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:135:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:128:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/libsas/sas_init.c: note: in included file (through include/=
linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:106:9: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:107:9: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:108:9: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:10: sparse: sparse: =
unreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:110:14: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:20: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:17: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:111:23: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:104:1: sparse: sparse: u=
nreplaced symbol 'return'
   drivers/scsi/libsas/sas_init.c: note: in included file (through arch/sh/=
include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:146:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:144:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/libsas/sas_init.c: note: in included file (through include/=
linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:154:9: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:155:9: sparse: sparse: u=
nreplaced symbol 'mask'
>> include/asm-generic/bitops/generic-non-atomic.h:156:9: sparse: sparse: u=
nreplaced symbol 'val'
   include/asm-generic/bitops/generic-non-atomic.h:158:19: sparse: sparse: =
unreplaced symbol 'val'
   include/asm-generic/bitops/generic-non-atomic.h:158:25: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:158:9: sparse: sparse: t=
oo many warnings
--
   include/asm-generic/bitops/generic-non-atomic.h:32:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:27:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/libsas/sas_phy.c: note: in included file (through arch/sh/i=
nclude/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:51:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:52:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:24: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:40:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/libsas/sas_phy.c: note: in included file (through include/l=
inux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:38:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:39:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:36:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/libsas/sas_phy.c: note: in included file (through arch/sh/i=
nclude/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:79:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:80:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:23: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:68:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/libsas/sas_phy.c: note: in included file (through include/l=
inux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:56:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:57:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:15: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:54:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/libsas/sas_phy.c: note: in included file (through arch/sh/i=
nclude/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:98:9: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/sh/include/asm/bitops-op32.h:99:9: sparse: sparse: unreplaced symbo=
l 'p'
   arch/sh/include/asm/bitops-op32.h:100:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:102:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:102:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:102:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:103:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:96:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/libsas/sas_phy.c: note: in included file (through include/l=
inux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:74:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:75:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:76:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:78:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:20: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:79:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:72:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/libsas/sas_phy.c: note: in included file (through arch/sh/i=
nclude/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:118:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:119:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:120:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:122:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:122:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:122:21: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:123:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:116:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/libsas/sas_phy.c: note: in included file (through include/l=
inux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:94:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:95:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:96:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:98:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:21: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:99:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:92:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/libsas/sas_phy.c: note: in included file (through arch/sh/i=
nclude/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:130:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:131:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:132:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:134:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:134:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:134:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:135:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:128:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/libsas/sas_phy.c: note: in included file (through include/l=
inux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:106:9: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:107:9: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:108:9: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:10: sparse: sparse: =
unreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:110:14: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:20: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:17: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:111:23: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:104:1: sparse: sparse: u=
nreplaced symbol 'return'
   drivers/scsi/libsas/sas_phy.c: note: in included file (through arch/sh/i=
nclude/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:146:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:144:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/libsas/sas_phy.c: note: in included file (through include/l=
inux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:154:9: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:155:9: sparse: sparse: u=
nreplaced symbol 'mask'
>> include/asm-generic/bitops/generic-non-atomic.h:156:9: sparse: sparse: u=
nreplaced symbol 'val'
   include/asm-generic/bitops/generic-non-atomic.h:158:19: sparse: sparse: =
unreplaced symbol 'val'
   include/asm-generic/bitops/generic-non-atomic.h:158:25: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:158:9: sparse: sparse: t=
oo many warnings
--
   include/asm-generic/bitops/generic-non-atomic.h:32:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:27:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/libsas/sas_discover.c: note: in included file (through arch=
/sh/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...=
):
   arch/sh/include/asm/bitops-op32.h:51:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:52:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:24: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:40:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/libsas/sas_discover.c: note: in included file (through incl=
ude/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:38:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:39:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:36:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/libsas/sas_discover.c: note: in included file (through arch=
/sh/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...=
):
   arch/sh/include/asm/bitops-op32.h:79:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:80:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:23: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:68:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/libsas/sas_discover.c: note: in included file (through incl=
ude/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:56:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:57:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:15: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:54:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/libsas/sas_discover.c: note: in included file (through arch=
/sh/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...=
):
   arch/sh/include/asm/bitops-op32.h:98:9: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/sh/include/asm/bitops-op32.h:99:9: sparse: sparse: unreplaced symbo=
l 'p'
   arch/sh/include/asm/bitops-op32.h:100:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:102:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:102:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:102:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:103:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:96:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/libsas/sas_discover.c: note: in included file (through incl=
ude/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:74:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:75:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:76:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:78:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:20: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:79:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:72:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/libsas/sas_discover.c: note: in included file (through arch=
/sh/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...=
):
   arch/sh/include/asm/bitops-op32.h:118:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:119:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:120:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:122:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:122:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:122:21: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:123:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:116:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/libsas/sas_discover.c: note: in included file (through incl=
ude/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:94:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:95:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:96:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:98:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:21: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:99:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:92:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/libsas/sas_discover.c: note: in included file (through arch=
/sh/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...=
):
   arch/sh/include/asm/bitops-op32.h:130:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:131:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:132:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:134:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:134:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:134:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:135:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:128:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/libsas/sas_discover.c: note: in included file (through incl=
ude/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:106:9: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:107:9: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:108:9: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:10: sparse: sparse: =
unreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:110:14: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:20: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:17: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:111:23: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:104:1: sparse: sparse: u=
nreplaced symbol 'return'
   drivers/scsi/libsas/sas_discover.c: note: in included file (through arch=
/sh/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...=
):
   arch/sh/include/asm/bitops-op32.h:146:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:144:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/libsas/sas_discover.c: note: in included file (through incl=
ude/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:154:9: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:155:9: sparse: sparse: u=
nreplaced symbol 'mask'
>> include/asm-generic/bitops/generic-non-atomic.h:156:9: sparse: sparse: u=
nreplaced symbol 'val'
   include/asm-generic/bitops/generic-non-atomic.h:158:19: sparse: sparse: =
unreplaced symbol 'val'
   include/asm-generic/bitops/generic-non-atomic.h:158:25: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:158:9: sparse: sparse: t=
oo many warnings
--
   include/asm-generic/bitops/generic-non-atomic.h:32:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:27:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/libsas/sas_scsi_host.c: note: in included file (through arc=
h/sh/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ..=
.):
   arch/sh/include/asm/bitops-op32.h:51:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:52:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:24: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:40:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/libsas/sas_scsi_host.c: note: in included file (through inc=
lude/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...=
):
   include/asm-generic/bitops/generic-non-atomic.h:38:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:39:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:36:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/libsas/sas_scsi_host.c: note: in included file (through arc=
h/sh/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ..=
.):
   arch/sh/include/asm/bitops-op32.h:79:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:80:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:23: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:68:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/libsas/sas_scsi_host.c: note: in included file (through inc=
lude/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...=
):
   include/asm-generic/bitops/generic-non-atomic.h:56:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:57:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:15: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:54:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/libsas/sas_scsi_host.c: note: in included file (through arc=
h/sh/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ..=
.):
   arch/sh/include/asm/bitops-op32.h:98:9: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/sh/include/asm/bitops-op32.h:99:9: sparse: sparse: unreplaced symbo=
l 'p'
   arch/sh/include/asm/bitops-op32.h:100:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:102:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:102:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:102:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:103:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:96:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/libsas/sas_scsi_host.c: note: in included file (through inc=
lude/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...=
):
   include/asm-generic/bitops/generic-non-atomic.h:74:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:75:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:76:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:78:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:20: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:79:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:72:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/libsas/sas_scsi_host.c: note: in included file (through arc=
h/sh/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ..=
.):
   arch/sh/include/asm/bitops-op32.h:118:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:119:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:120:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:122:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:122:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:122:21: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:123:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:116:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/libsas/sas_scsi_host.c: note: in included file (through inc=
lude/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...=
):
   include/asm-generic/bitops/generic-non-atomic.h:94:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:95:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:96:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:98:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:21: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:99:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:92:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/libsas/sas_scsi_host.c: note: in included file (through arc=
h/sh/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ..=
.):
   arch/sh/include/asm/bitops-op32.h:130:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:131:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:132:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:134:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:134:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:134:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:135:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:128:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/libsas/sas_scsi_host.c: note: in included file (through inc=
lude/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...=
):
   include/asm-generic/bitops/generic-non-atomic.h:106:9: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:107:9: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:108:9: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:10: sparse: sparse: =
unreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:110:14: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:20: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:17: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:111:23: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:104:1: sparse: sparse: u=
nreplaced symbol 'return'
   drivers/scsi/libsas/sas_scsi_host.c: note: in included file (through arc=
h/sh/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ..=
.):
   arch/sh/include/asm/bitops-op32.h:146:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:144:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/libsas/sas_scsi_host.c: note: in included file (through inc=
lude/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...=
):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:154:9: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:155:9: sparse: sparse: u=
nreplaced symbol 'mask'
>> include/asm-generic/bitops/generic-non-atomic.h:156:9: sparse: sparse: u=
nreplaced symbol 'val'
   include/asm-generic/bitops/generic-non-atomic.h:158:19: sparse: sparse: =
unreplaced symbol 'val'
   include/asm-generic/bitops/generic-non-atomic.h:158:25: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:158:9: sparse: sparse: t=
oo many warnings
--
   include/asm-generic/bitops/generic-non-atomic.h:32:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:27:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/libsas/sas_port.c: note: in included file (through arch/sh/=
include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:51:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:52:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:24: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:40:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/libsas/sas_port.c: note: in included file (through include/=
linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:38:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:39:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:36:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/libsas/sas_port.c: note: in included file (through arch/sh/=
include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:79:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:80:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:23: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:68:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/libsas/sas_port.c: note: in included file (through include/=
linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:56:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:57:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:15: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:54:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/libsas/sas_port.c: note: in included file (through arch/sh/=
include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:98:9: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/sh/include/asm/bitops-op32.h:99:9: sparse: sparse: unreplaced symbo=
l 'p'
   arch/sh/include/asm/bitops-op32.h:100:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:102:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:102:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:102:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:103:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:96:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/libsas/sas_port.c: note: in included file (through include/=
linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:74:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:75:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:76:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:78:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:20: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:79:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:72:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/libsas/sas_port.c: note: in included file (through arch/sh/=
include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:118:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:119:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:120:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:122:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:122:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:122:21: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:123:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:116:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/libsas/sas_port.c: note: in included file (through include/=
linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:94:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:95:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:96:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:98:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:21: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:99:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:92:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/libsas/sas_port.c: note: in included file (through arch/sh/=
include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:130:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:131:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:132:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:134:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:134:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:134:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:135:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:128:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/libsas/sas_port.c: note: in included file (through include/=
linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:106:9: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:107:9: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:108:9: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:10: sparse: sparse: =
unreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:110:14: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:20: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:17: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:111:23: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:104:1: sparse: sparse: u=
nreplaced symbol 'return'
   drivers/scsi/libsas/sas_port.c: note: in included file (through arch/sh/=
include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...):
   arch/sh/include/asm/bitops-op32.h:146:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:144:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/libsas/sas_port.c: note: in included file (through include/=
linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:154:9: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:155:9: sparse: sparse: u=
nreplaced symbol 'mask'
>> include/asm-generic/bitops/generic-non-atomic.h:156:9: sparse: sparse: u=
nreplaced symbol 'val'
   include/asm-generic/bitops/generic-non-atomic.h:158:19: sparse: sparse: =
unreplaced symbol 'val'
   include/asm-generic/bitops/generic-non-atomic.h:158:25: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:158:9: sparse: sparse: t=
oo many warnings
--
   include/asm-generic/bitops/generic-non-atomic.h:32:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:27:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/libsas/sas_expander.c: note: in included file (through arch=
/sh/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...=
):
   arch/sh/include/asm/bitops-op32.h:51:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:52:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:54:24: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:40:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/libsas/sas_expander.c: note: in included file (through incl=
ude/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:38:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:39:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:41:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:36:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/libsas/sas_expander.c: note: in included file (through arch=
/sh/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...=
):
   arch/sh/include/asm/bitops-op32.h:79:17: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:80:17: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:18: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:82:23: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:68:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/libsas/sas_expander.c: note: in included file (through incl=
ude/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:56:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:57:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:59:15: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:54:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/libsas/sas_expander.c: note: in included file (through arch=
/sh/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...=
):
   arch/sh/include/asm/bitops-op32.h:98:9: sparse: sparse: unreplaced symbo=
l 'mask'
   arch/sh/include/asm/bitops-op32.h:99:9: sparse: sparse: unreplaced symbo=
l 'p'
   arch/sh/include/asm/bitops-op32.h:100:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:102:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:102:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:102:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:103:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:103:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:96:1: sparse: sparse: unreplaced symbo=
l 'return'
   drivers/scsi/libsas/sas_expander.c: note: in included file (through incl=
ude/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:74:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:75:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:76:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:78:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:78:20: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:79:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:79:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:72:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/libsas/sas_expander.c: note: in included file (through arch=
/sh/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...=
):
   arch/sh/include/asm/bitops-op32.h:118:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:119:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:120:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:122:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:122:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:122:21: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:123:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:123:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:116:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/libsas/sas_expander.c: note: in included file (through incl=
ude/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:94:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:95:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:96:9: sparse: sparse: un=
replaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:98:14: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:98:21: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:17: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:99:23: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:99:9: sparse: sparse: un=
replaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:92:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/scsi/libsas/sas_expander.c: note: in included file (through arch=
/sh/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...=
):
   arch/sh/include/asm/bitops-op32.h:130:9: sparse: sparse: unreplaced symb=
ol 'mask'
   arch/sh/include/asm/bitops-op32.h:131:9: sparse: sparse: unreplaced symb=
ol 'p'
   arch/sh/include/asm/bitops-op32.h:132:9: sparse: sparse: unreplaced symb=
ol 'old'
   arch/sh/include/asm/bitops-op32.h:134:10: sparse: sparse: unreplaced sym=
bol 'p'
   arch/sh/include/asm/bitops-op32.h:134:14: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:134:20: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:17: sparse: sparse: unreplaced sym=
bol 'old'
   arch/sh/include/asm/bitops-op32.h:135:23: sparse: sparse: unreplaced sym=
bol 'mask'
   arch/sh/include/asm/bitops-op32.h:135:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:128:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/libsas/sas_expander.c: note: in included file (through incl=
ude/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:106:9: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:107:9: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:108:9: sparse: sparse: u=
nreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:10: sparse: sparse: =
unreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:110:14: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:110:20: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:17: sparse: sparse: =
unreplaced symbol 'old'
   include/asm-generic/bitops/generic-non-atomic.h:111:23: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:111:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:104:1: sparse: sparse: u=
nreplaced symbol 'return'
   drivers/scsi/libsas/sas_expander.c: note: in included file (through arch=
/sh/include/asm/bitops.h, include/linux/bitops.h, include/linux/log2.h, ...=
):
   arch/sh/include/asm/bitops-op32.h:146:9: sparse: sparse: unreplaced symb=
ol 'return'
   arch/sh/include/asm/bitops-op32.h:144:1: sparse: sparse: unreplaced symb=
ol 'return'
   drivers/scsi/libsas/sas_expander.c: note: in included file (through incl=
ude/linux/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:154:9: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:155:9: sparse: sparse: u=
nreplaced symbol 'mask'
>> include/asm-generic/bitops/generic-non-atomic.h:156:9: sparse: sparse: u=
nreplaced symbol 'val'
   include/asm-generic/bitops/generic-non-atomic.h:158:19: sparse: sparse: =
unreplaced symbol 'val'
   include/asm-generic/bitops/generic-non-atomic.h:158:25: sparse: sparse: =
unreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:158:9: sparse: sparse: t=
oo many warnings

vim +/val +156 include/asm-generic/bitops/generic-non-atomic.h

b9944c14c86ab2 Alexander Lobakin 2022-05-07  101  =

b9944c14c86ab2 Alexander Lobakin 2022-05-07  102  /* WARNING: non atomic an=
d it can be reordered! */
521611f961a7dd Alexander Lobakin 2022-05-09  103  static __always_inline bo=
ol
521611f961a7dd Alexander Lobakin 2022-05-09 @104  generic___test_and_change=
_bit(unsigned long nr, volatile unsigned long *addr)
b9944c14c86ab2 Alexander Lobakin 2022-05-07  105  {
b9944c14c86ab2 Alexander Lobakin 2022-05-07  106  	unsigned long mask =3D B=
IT_MASK(nr);
b9944c14c86ab2 Alexander Lobakin 2022-05-07  107  	unsigned long *p =3D ((u=
nsigned long *)addr) + BIT_WORD(nr);
b9944c14c86ab2 Alexander Lobakin 2022-05-07  108  	unsigned long old =3D *p;
b9944c14c86ab2 Alexander Lobakin 2022-05-07  109  =

b9944c14c86ab2 Alexander Lobakin 2022-05-07  110  	*p =3D old ^ mask;
b9944c14c86ab2 Alexander Lobakin 2022-05-07  111  	return (old & mask) !=3D=
 0;
b9944c14c86ab2 Alexander Lobakin 2022-05-07  112  }
b9944c14c86ab2 Alexander Lobakin 2022-05-07  113  =

b9944c14c86ab2 Alexander Lobakin 2022-05-07  114  /**
b9944c14c86ab2 Alexander Lobakin 2022-05-07  115   * generic_test_bit - Det=
ermine whether a bit is set
b9944c14c86ab2 Alexander Lobakin 2022-05-07  116   * @nr: bit number to test
b9944c14c86ab2 Alexander Lobakin 2022-05-07  117   * @addr: Address to star=
t counting from
b9944c14c86ab2 Alexander Lobakin 2022-05-07  118   */
521611f961a7dd Alexander Lobakin 2022-05-09  119  static __always_inline bo=
ol
521611f961a7dd Alexander Lobakin 2022-05-09  120  generic_test_bit(unsigned=
 long nr, const volatile unsigned long *addr)
b9944c14c86ab2 Alexander Lobakin 2022-05-07  121  {
b9944c14c86ab2 Alexander Lobakin 2022-05-07  122  	/*
b9944c14c86ab2 Alexander Lobakin 2022-05-07  123  	 * Unlike the bitops wit=
h the '__' prefix above, this one *is* atomic,
b9944c14c86ab2 Alexander Lobakin 2022-05-07  124  	 * so `volatile` must al=
ways stay here with no cast-aways. See
b9944c14c86ab2 Alexander Lobakin 2022-05-07  125  	 * `Documentation/atomic=
_bitops.txt` for the details.
b9944c14c86ab2 Alexander Lobakin 2022-05-07  126  	 */
b9944c14c86ab2 Alexander Lobakin 2022-05-07  127  	return 1UL & (addr[BIT_W=
ORD(nr)] >> (nr & (BITS_PER_LONG-1)));
b9944c14c86ab2 Alexander Lobakin 2022-05-07  128  }
b9944c14c86ab2 Alexander Lobakin 2022-05-07  129  =

c6d1f21e05b033 Alexander Lobakin 2022-06-07  130  /*
c6d1f21e05b033 Alexander Lobakin 2022-06-07  131   * const_*() definitions =
provide good compile-time optimizations when
c6d1f21e05b033 Alexander Lobakin 2022-06-07  132   * the passed arguments c=
an be resolved at compile time.
c6d1f21e05b033 Alexander Lobakin 2022-06-07  133   */
c6d1f21e05b033 Alexander Lobakin 2022-06-07  134  #define const___set_bit		=
	generic___set_bit
c6d1f21e05b033 Alexander Lobakin 2022-06-07  135  #define const___clear_bit=
		generic___clear_bit
c6d1f21e05b033 Alexander Lobakin 2022-06-07  136  #define const___change_bi=
t		generic___change_bit
c6d1f21e05b033 Alexander Lobakin 2022-06-07  137  #define const___test_and_=
set_bit	generic___test_and_set_bit
c6d1f21e05b033 Alexander Lobakin 2022-06-07  138  #define const___test_and_=
clear_bit	generic___test_and_clear_bit
c6d1f21e05b033 Alexander Lobakin 2022-06-07  139  #define const___test_and_=
change_bit	generic___test_and_change_bit
c6d1f21e05b033 Alexander Lobakin 2022-06-07  140  =

c6d1f21e05b033 Alexander Lobakin 2022-06-07  141  /**
c6d1f21e05b033 Alexander Lobakin 2022-06-07  142   * const_test_bit - Deter=
mine whether a bit is set
c6d1f21e05b033 Alexander Lobakin 2022-06-07  143   * @nr: bit number to test
c6d1f21e05b033 Alexander Lobakin 2022-06-07  144   * @addr: Address to star=
t counting from
c6d1f21e05b033 Alexander Lobakin 2022-06-07  145   *
c6d1f21e05b033 Alexander Lobakin 2022-06-07  146   * A version of generic_t=
est_bit() which discards the `volatile` qualifier to
c6d1f21e05b033 Alexander Lobakin 2022-06-07  147   * allow a compiler to op=
timize code harder. Non-atomic and to be called only
c6d1f21e05b033 Alexander Lobakin 2022-06-07  148   * for testing compile-ti=
me constants, e.g. by the corresponding macros, not
c6d1f21e05b033 Alexander Lobakin 2022-06-07  149   * directly from "regular=
" code.
c6d1f21e05b033 Alexander Lobakin 2022-06-07  150   */
c6d1f21e05b033 Alexander Lobakin 2022-06-07  151  static __always_inline bo=
ol
c6d1f21e05b033 Alexander Lobakin 2022-06-07  152  const_test_bit(unsigned l=
ong nr, const volatile unsigned long *addr)
c6d1f21e05b033 Alexander Lobakin 2022-06-07  153  {
c6d1f21e05b033 Alexander Lobakin 2022-06-07  154  	const unsigned long *p =
=3D (const unsigned long *)addr + BIT_WORD(nr);
c6d1f21e05b033 Alexander Lobakin 2022-06-07  155  	unsigned long mask =3D B=
IT_MASK(nr);
c6d1f21e05b033 Alexander Lobakin 2022-06-07 @156  	unsigned long val =3D *p;
c6d1f21e05b033 Alexander Lobakin 2022-06-07  157  =

c6d1f21e05b033 Alexander Lobakin 2022-06-07  158  	return !!(val & mask);
c6d1f21e05b033 Alexander Lobakin 2022-06-07  159  }
c6d1f21e05b033 Alexander Lobakin 2022-06-07  160  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8559189559442365048==--

