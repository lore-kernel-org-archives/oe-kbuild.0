Content-Type: multipart/mixed; boundary="===============2264779698181096832=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [alobakin:bitops 3/7] arch/m68k/include/asm/bitops.h:69:1: sparse: sparse: unreplaced symbol 'return'
Date: Sat, 18 Jun 2022 05:11:30 +0800
Message-ID: <202206180506.Ne3rzjxl-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2264779698181096832==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: arch/m68k=
/include/asm/bitops.h:69:1: sparse: sparse: unreplaced symbol 'return'"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Alexander Lobakin <alexandr.lobakin@intel.com>
CC: Yury Norov <yury.norov@gmail.com>

tree:   https://github.com/alobakin/linux bitops
head:   9bd39b17ce49d350eed93a031e0da6389067013e
commit: 521611f961a7dda92eefa26e1afd3914c06af64e [3/7] bitops: unify non-at=
omic bitops prototypes across architectures
:::::: branch date: 7 hours ago
:::::: commit date: 9 hours ago
config: m68k-randconfig-s031-20220617 (https://download.01.org/0day-ci/arch=
ive/20220618/202206180506.Ne3rzjxl-lkp(a)intel.com/config)
compiler: m68k-linux-gcc (GCC) 11.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-30-g92122700-dirty
        # https://github.com/alobakin/linux/commit/521611f961a7dda92eefa26e=
1afd3914c06af64e
        git remote add alobakin https://github.com/alobakin/linux
        git fetch --no-tags alobakin bitops
        git checkout 521611f961a7dda92eefa26e1afd3914c06af64e
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-11.3.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Dm=
68k SHELL=3D/bin/bash drivers/usb/dwc2/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
   drivers/usb/dwc2/debugfs.c: note: in included file (through include/linu=
x/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
>> arch/m68k/include/asm/bitops.h:69:1: sparse: sparse: unreplaced symbol '=
return'
   drivers/usb/dwc2/debugfs.c: note: in included file (through include/linu=
x/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:29:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:30:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:27:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/usb/dwc2/debugfs.c: note: in included file (through include/linu=
x/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   arch/m68k/include/asm/bitops.h:112:1: sparse: sparse: unreplaced symbol =
'return'
   drivers/usb/dwc2/debugfs.c: note: in included file (through include/linu=
x/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
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
   drivers/usb/dwc2/debugfs.c: note: in included file (through include/linu=
x/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   arch/m68k/include/asm/bitops.h:155:1: sparse: sparse: unreplaced symbol =
'return'
   drivers/usb/dwc2/debugfs.c: note: in included file (through include/linu=
x/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
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
   drivers/usb/dwc2/debugfs.c: note: in included file (through include/linu=
x/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   arch/m68k/include/asm/bitops.h:216:9: sparse: sparse: unreplaced symbol =
'return'
   arch/m68k/include/asm/bitops.h:214:1: sparse: sparse: unreplaced symbol =
'return'
   drivers/usb/dwc2/debugfs.c: note: in included file (through include/linu=
x/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
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
   drivers/usb/dwc2/debugfs.c: note: in included file (through include/linu=
x/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   arch/m68k/include/asm/bitops.h:269:9: sparse: sparse: unreplaced symbol =
'return'
   arch/m68k/include/asm/bitops.h:267:1: sparse: sparse: unreplaced symbol =
'return'
   drivers/usb/dwc2/debugfs.c: note: in included file (through include/linu=
x/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
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
   drivers/usb/dwc2/debugfs.c: note: in included file (through include/linu=
x/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   arch/m68k/include/asm/bitops.h:322:9: sparse: sparse: unreplaced symbol =
'return'
   arch/m68k/include/asm/bitops.h:320:1: sparse: sparse: unreplaced symbol =
'return'
   drivers/usb/dwc2/debugfs.c: note: in included file (through include/linu=
x/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
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
   drivers/usb/dwc2/debugfs.c: note: in included file (through include/linu=
x/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   arch/m68k/include/asm/bitops.h:163:9: sparse: sparse: unreplaced symbol =
'return'
   arch/m68k/include/asm/bitops.h:161:1: sparse: sparse: unreplaced symbol =
'return'
   drivers/usb/dwc2/debugfs.c: note: in included file (through include/linu=
x/bitops.h, include/linux/log2.h, include/asm-generic/div64.h, ...):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
--
   drivers/usb/dwc2/pci.c: note: in included file (through include/linux/bi=
tops.h, include/linux/kernel.h):
>> arch/m68k/include/asm/bitops.h:69:1: sparse: sparse: unreplaced symbol '=
return'
   drivers/usb/dwc2/pci.c: note: in included file (through include/linux/bi=
tops.h, include/linux/kernel.h):
   include/asm-generic/bitops/generic-non-atomic.h:29:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:30:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:27:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/usb/dwc2/pci.c: note: in included file (through include/linux/bi=
tops.h, include/linux/kernel.h):
   arch/m68k/include/asm/bitops.h:112:1: sparse: sparse: unreplaced symbol =
'return'
   drivers/usb/dwc2/pci.c: note: in included file (through include/linux/bi=
tops.h, include/linux/kernel.h):
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
   drivers/usb/dwc2/pci.c: note: in included file (through include/linux/bi=
tops.h, include/linux/kernel.h):
   arch/m68k/include/asm/bitops.h:155:1: sparse: sparse: unreplaced symbol =
'return'
   drivers/usb/dwc2/pci.c: note: in included file (through include/linux/bi=
tops.h, include/linux/kernel.h):
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
   drivers/usb/dwc2/pci.c: note: in included file (through include/linux/bi=
tops.h, include/linux/kernel.h):
   arch/m68k/include/asm/bitops.h:216:9: sparse: sparse: unreplaced symbol =
'return'
   arch/m68k/include/asm/bitops.h:214:1: sparse: sparse: unreplaced symbol =
'return'
   drivers/usb/dwc2/pci.c: note: in included file (through include/linux/bi=
tops.h, include/linux/kernel.h):
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
   drivers/usb/dwc2/pci.c: note: in included file (through include/linux/bi=
tops.h, include/linux/kernel.h):
   arch/m68k/include/asm/bitops.h:269:9: sparse: sparse: unreplaced symbol =
'return'
   arch/m68k/include/asm/bitops.h:267:1: sparse: sparse: unreplaced symbol =
'return'
   drivers/usb/dwc2/pci.c: note: in included file (through include/linux/bi=
tops.h, include/linux/kernel.h):
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
   drivers/usb/dwc2/pci.c: note: in included file (through include/linux/bi=
tops.h, include/linux/kernel.h):
   arch/m68k/include/asm/bitops.h:322:9: sparse: sparse: unreplaced symbol =
'return'
   arch/m68k/include/asm/bitops.h:320:1: sparse: sparse: unreplaced symbol =
'return'
   drivers/usb/dwc2/pci.c: note: in included file (through include/linux/bi=
tops.h, include/linux/kernel.h):
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
   drivers/usb/dwc2/pci.c: note: in included file (through include/linux/bi=
tops.h, include/linux/kernel.h):
   arch/m68k/include/asm/bitops.h:163:9: sparse: sparse: unreplaced symbol =
'return'
   arch/m68k/include/asm/bitops.h:161:1: sparse: sparse: unreplaced symbol =
'return'
   drivers/usb/dwc2/pci.c: note: in included file (through include/linux/bi=
tops.h, include/linux/kernel.h):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
--
   drivers/usb/dwc2/drd.c: note: in included file (through include/linux/bi=
tops.h, include/linux/kernel.h, include/linux/clk.h):
>> arch/m68k/include/asm/bitops.h:69:1: sparse: sparse: unreplaced symbol '=
return'
   drivers/usb/dwc2/drd.c: note: in included file (through include/linux/bi=
tops.h, include/linux/kernel.h, include/linux/clk.h):
   include/asm-generic/bitops/generic-non-atomic.h:29:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:30:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:27:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/usb/dwc2/drd.c: note: in included file (through include/linux/bi=
tops.h, include/linux/kernel.h, include/linux/clk.h):
   arch/m68k/include/asm/bitops.h:112:1: sparse: sparse: unreplaced symbol =
'return'
   drivers/usb/dwc2/drd.c: note: in included file (through include/linux/bi=
tops.h, include/linux/kernel.h, include/linux/clk.h):
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
   drivers/usb/dwc2/drd.c: note: in included file (through include/linux/bi=
tops.h, include/linux/kernel.h, include/linux/clk.h):
   arch/m68k/include/asm/bitops.h:155:1: sparse: sparse: unreplaced symbol =
'return'
   drivers/usb/dwc2/drd.c: note: in included file (through include/linux/bi=
tops.h, include/linux/kernel.h, include/linux/clk.h):
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
   drivers/usb/dwc2/drd.c: note: in included file (through include/linux/bi=
tops.h, include/linux/kernel.h, include/linux/clk.h):
   arch/m68k/include/asm/bitops.h:216:9: sparse: sparse: unreplaced symbol =
'return'
   arch/m68k/include/asm/bitops.h:214:1: sparse: sparse: unreplaced symbol =
'return'
   drivers/usb/dwc2/drd.c: note: in included file (through include/linux/bi=
tops.h, include/linux/kernel.h, include/linux/clk.h):
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
   drivers/usb/dwc2/drd.c: note: in included file (through include/linux/bi=
tops.h, include/linux/kernel.h, include/linux/clk.h):
   arch/m68k/include/asm/bitops.h:269:9: sparse: sparse: unreplaced symbol =
'return'
   arch/m68k/include/asm/bitops.h:267:1: sparse: sparse: unreplaced symbol =
'return'
   drivers/usb/dwc2/drd.c: note: in included file (through include/linux/bi=
tops.h, include/linux/kernel.h, include/linux/clk.h):
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
   drivers/usb/dwc2/drd.c: note: in included file (through include/linux/bi=
tops.h, include/linux/kernel.h, include/linux/clk.h):
   arch/m68k/include/asm/bitops.h:322:9: sparse: sparse: unreplaced symbol =
'return'
   arch/m68k/include/asm/bitops.h:320:1: sparse: sparse: unreplaced symbol =
'return'
   drivers/usb/dwc2/drd.c: note: in included file (through include/linux/bi=
tops.h, include/linux/kernel.h, include/linux/clk.h):
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
   drivers/usb/dwc2/drd.c: note: in included file (through include/linux/bi=
tops.h, include/linux/kernel.h, include/linux/clk.h):
   arch/m68k/include/asm/bitops.h:163:9: sparse: sparse: unreplaced symbol =
'return'
   arch/m68k/include/asm/bitops.h:161:1: sparse: sparse: unreplaced symbol =
'return'
   drivers/usb/dwc2/drd.c: note: in included file (through include/linux/bi=
tops.h, include/linux/kernel.h, include/linux/clk.h):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
--
   drivers/usb/dwc2/hcd_ddma.c: note: in included file (through include/lin=
ux/bitops.h, include/linux/kernel.h):
>> arch/m68k/include/asm/bitops.h:69:1: sparse: sparse: unreplaced symbol '=
return'
   drivers/usb/dwc2/hcd_ddma.c: note: in included file (through include/lin=
ux/bitops.h, include/linux/kernel.h):
   include/asm-generic/bitops/generic-non-atomic.h:29:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:30:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:27:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/usb/dwc2/hcd_ddma.c: note: in included file (through include/lin=
ux/bitops.h, include/linux/kernel.h):
   arch/m68k/include/asm/bitops.h:112:1: sparse: sparse: unreplaced symbol =
'return'
   drivers/usb/dwc2/hcd_ddma.c: note: in included file (through include/lin=
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
   drivers/usb/dwc2/hcd_ddma.c: note: in included file (through include/lin=
ux/bitops.h, include/linux/kernel.h):
   arch/m68k/include/asm/bitops.h:155:1: sparse: sparse: unreplaced symbol =
'return'
   drivers/usb/dwc2/hcd_ddma.c: note: in included file (through include/lin=
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
   drivers/usb/dwc2/hcd_ddma.c: note: in included file (through include/lin=
ux/bitops.h, include/linux/kernel.h):
   arch/m68k/include/asm/bitops.h:216:9: sparse: sparse: unreplaced symbol =
'return'
   arch/m68k/include/asm/bitops.h:214:1: sparse: sparse: unreplaced symbol =
'return'
   drivers/usb/dwc2/hcd_ddma.c: note: in included file (through include/lin=
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
   drivers/usb/dwc2/hcd_ddma.c: note: in included file (through include/lin=
ux/bitops.h, include/linux/kernel.h):
   arch/m68k/include/asm/bitops.h:269:9: sparse: sparse: unreplaced symbol =
'return'
   arch/m68k/include/asm/bitops.h:267:1: sparse: sparse: unreplaced symbol =
'return'
   drivers/usb/dwc2/hcd_ddma.c: note: in included file (through include/lin=
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
   drivers/usb/dwc2/hcd_ddma.c: note: in included file (through include/lin=
ux/bitops.h, include/linux/kernel.h):
   arch/m68k/include/asm/bitops.h:322:9: sparse: sparse: unreplaced symbol =
'return'
   arch/m68k/include/asm/bitops.h:320:1: sparse: sparse: unreplaced symbol =
'return'
   drivers/usb/dwc2/hcd_ddma.c: note: in included file (through include/lin=
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
   drivers/usb/dwc2/hcd_ddma.c: note: in included file (through include/lin=
ux/bitops.h, include/linux/kernel.h):
   arch/m68k/include/asm/bitops.h:163:9: sparse: sparse: unreplaced symbol =
'return'
   arch/m68k/include/asm/bitops.h:161:1: sparse: sparse: unreplaced symbol =
'return'
   drivers/usb/dwc2/hcd_ddma.c: note: in included file (through include/lin=
ux/bitops.h, include/linux/kernel.h):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
--
   drivers/usb/dwc2/hcd_queue.c: note: in included file (through include/li=
nux/bitops.h, include/linux/kernel.h):
>> arch/m68k/include/asm/bitops.h:69:1: sparse: sparse: unreplaced symbol '=
return'
   drivers/usb/dwc2/hcd_queue.c: note: in included file (through include/li=
nux/bitops.h, include/linux/kernel.h):
   include/asm-generic/bitops/generic-non-atomic.h:29:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:30:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:27:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/usb/dwc2/hcd_queue.c: note: in included file (through include/li=
nux/bitops.h, include/linux/kernel.h):
   arch/m68k/include/asm/bitops.h:112:1: sparse: sparse: unreplaced symbol =
'return'
   drivers/usb/dwc2/hcd_queue.c: note: in included file (through include/li=
nux/bitops.h, include/linux/kernel.h):
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
   drivers/usb/dwc2/hcd_queue.c: note: in included file (through include/li=
nux/bitops.h, include/linux/kernel.h):
   arch/m68k/include/asm/bitops.h:155:1: sparse: sparse: unreplaced symbol =
'return'
   drivers/usb/dwc2/hcd_queue.c: note: in included file (through include/li=
nux/bitops.h, include/linux/kernel.h):
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
   drivers/usb/dwc2/hcd_queue.c: note: in included file (through include/li=
nux/bitops.h, include/linux/kernel.h):
   arch/m68k/include/asm/bitops.h:216:9: sparse: sparse: unreplaced symbol =
'return'
   arch/m68k/include/asm/bitops.h:214:1: sparse: sparse: unreplaced symbol =
'return'
   drivers/usb/dwc2/hcd_queue.c: note: in included file (through include/li=
nux/bitops.h, include/linux/kernel.h):
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
   drivers/usb/dwc2/hcd_queue.c: note: in included file (through include/li=
nux/bitops.h, include/linux/kernel.h):
   arch/m68k/include/asm/bitops.h:269:9: sparse: sparse: unreplaced symbol =
'return'
   arch/m68k/include/asm/bitops.h:267:1: sparse: sparse: unreplaced symbol =
'return'
   drivers/usb/dwc2/hcd_queue.c: note: in included file (through include/li=
nux/bitops.h, include/linux/kernel.h):
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
   drivers/usb/dwc2/hcd_queue.c: note: in included file (through include/li=
nux/bitops.h, include/linux/kernel.h):
   arch/m68k/include/asm/bitops.h:322:9: sparse: sparse: unreplaced symbol =
'return'
   arch/m68k/include/asm/bitops.h:320:1: sparse: sparse: unreplaced symbol =
'return'
   drivers/usb/dwc2/hcd_queue.c: note: in included file (through include/li=
nux/bitops.h, include/linux/kernel.h):
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
   drivers/usb/dwc2/hcd_queue.c: note: in included file (through include/li=
nux/bitops.h, include/linux/kernel.h):
   arch/m68k/include/asm/bitops.h:163:9: sparse: sparse: unreplaced symbol =
'return'
   arch/m68k/include/asm/bitops.h:161:1: sparse: sparse: unreplaced symbol =
'return'
   drivers/usb/dwc2/hcd_queue.c: note: in included file (through include/li=
nux/bitops.h, include/linux/kernel.h):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
--
   drivers/usb/dwc2/core_intr.c: note: in included file (through include/li=
nux/bitops.h, include/linux/kernel.h):
>> arch/m68k/include/asm/bitops.h:69:1: sparse: sparse: unreplaced symbol '=
return'
   drivers/usb/dwc2/core_intr.c: note: in included file (through include/li=
nux/bitops.h, include/linux/kernel.h):
   include/asm-generic/bitops/generic-non-atomic.h:29:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:30:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:27:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/usb/dwc2/core_intr.c: note: in included file (through include/li=
nux/bitops.h, include/linux/kernel.h):
   arch/m68k/include/asm/bitops.h:112:1: sparse: sparse: unreplaced symbol =
'return'
   drivers/usb/dwc2/core_intr.c: note: in included file (through include/li=
nux/bitops.h, include/linux/kernel.h):
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
   drivers/usb/dwc2/core_intr.c: note: in included file (through include/li=
nux/bitops.h, include/linux/kernel.h):
   arch/m68k/include/asm/bitops.h:155:1: sparse: sparse: unreplaced symbol =
'return'
   drivers/usb/dwc2/core_intr.c: note: in included file (through include/li=
nux/bitops.h, include/linux/kernel.h):
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
   drivers/usb/dwc2/core_intr.c: note: in included file (through include/li=
nux/bitops.h, include/linux/kernel.h):
   arch/m68k/include/asm/bitops.h:216:9: sparse: sparse: unreplaced symbol =
'return'
   arch/m68k/include/asm/bitops.h:214:1: sparse: sparse: unreplaced symbol =
'return'
   drivers/usb/dwc2/core_intr.c: note: in included file (through include/li=
nux/bitops.h, include/linux/kernel.h):
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
   drivers/usb/dwc2/core_intr.c: note: in included file (through include/li=
nux/bitops.h, include/linux/kernel.h):
   arch/m68k/include/asm/bitops.h:269:9: sparse: sparse: unreplaced symbol =
'return'
   arch/m68k/include/asm/bitops.h:267:1: sparse: sparse: unreplaced symbol =
'return'
   drivers/usb/dwc2/core_intr.c: note: in included file (through include/li=
nux/bitops.h, include/linux/kernel.h):
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
   drivers/usb/dwc2/core_intr.c: note: in included file (through include/li=
nux/bitops.h, include/linux/kernel.h):
   arch/m68k/include/asm/bitops.h:322:9: sparse: sparse: unreplaced symbol =
'return'
   arch/m68k/include/asm/bitops.h:320:1: sparse: sparse: unreplaced symbol =
'return'
   drivers/usb/dwc2/core_intr.c: note: in included file (through include/li=
nux/bitops.h, include/linux/kernel.h):
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
   drivers/usb/dwc2/core_intr.c: note: in included file (through include/li=
nux/bitops.h, include/linux/kernel.h):
   arch/m68k/include/asm/bitops.h:163:9: sparse: sparse: unreplaced symbol =
'return'
   arch/m68k/include/asm/bitops.h:161:1: sparse: sparse: unreplaced symbol =
'return'
   drivers/usb/dwc2/core_intr.c: note: in included file (through include/li=
nux/bitops.h, include/linux/kernel.h):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
--
   drivers/usb/dwc2/params.c: note: in included file (through include/linux=
/bitops.h, include/linux/kernel.h):
>> arch/m68k/include/asm/bitops.h:69:1: sparse: sparse: unreplaced symbol '=
return'
   drivers/usb/dwc2/params.c: note: in included file (through include/linux=
/bitops.h, include/linux/kernel.h):
   include/asm-generic/bitops/generic-non-atomic.h:29:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:30:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:27:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/usb/dwc2/params.c: note: in included file (through include/linux=
/bitops.h, include/linux/kernel.h):
   arch/m68k/include/asm/bitops.h:112:1: sparse: sparse: unreplaced symbol =
'return'
   drivers/usb/dwc2/params.c: note: in included file (through include/linux=
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
   drivers/usb/dwc2/params.c: note: in included file (through include/linux=
/bitops.h, include/linux/kernel.h):
   arch/m68k/include/asm/bitops.h:155:1: sparse: sparse: unreplaced symbol =
'return'
   drivers/usb/dwc2/params.c: note: in included file (through include/linux=
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
   drivers/usb/dwc2/params.c: note: in included file (through include/linux=
/bitops.h, include/linux/kernel.h):
   arch/m68k/include/asm/bitops.h:216:9: sparse: sparse: unreplaced symbol =
'return'
   arch/m68k/include/asm/bitops.h:214:1: sparse: sparse: unreplaced symbol =
'return'
   drivers/usb/dwc2/params.c: note: in included file (through include/linux=
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
   drivers/usb/dwc2/params.c: note: in included file (through include/linux=
/bitops.h, include/linux/kernel.h):
   arch/m68k/include/asm/bitops.h:269:9: sparse: sparse: unreplaced symbol =
'return'
   arch/m68k/include/asm/bitops.h:267:1: sparse: sparse: unreplaced symbol =
'return'
   drivers/usb/dwc2/params.c: note: in included file (through include/linux=
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
   drivers/usb/dwc2/params.c: note: in included file (through include/linux=
/bitops.h, include/linux/kernel.h):
   arch/m68k/include/asm/bitops.h:322:9: sparse: sparse: unreplaced symbol =
'return'
   arch/m68k/include/asm/bitops.h:320:1: sparse: sparse: unreplaced symbol =
'return'
   drivers/usb/dwc2/params.c: note: in included file (through include/linux=
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
   drivers/usb/dwc2/params.c: note: in included file (through include/linux=
/bitops.h, include/linux/kernel.h):
   arch/m68k/include/asm/bitops.h:163:9: sparse: sparse: unreplaced symbol =
'return'
   arch/m68k/include/asm/bitops.h:161:1: sparse: sparse: unreplaced symbol =
'return'
   drivers/usb/dwc2/params.c: note: in included file (through include/linux=
/bitops.h, include/linux/kernel.h):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
--
   drivers/usb/dwc2/core.c: note: in included file (through include/linux/b=
itops.h, include/linux/kernel.h):
>> arch/m68k/include/asm/bitops.h:69:1: sparse: sparse: unreplaced symbol '=
return'
   drivers/usb/dwc2/core.c: note: in included file (through include/linux/b=
itops.h, include/linux/kernel.h):
   include/asm-generic/bitops/generic-non-atomic.h:29:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:30:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:27:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/usb/dwc2/core.c: note: in included file (through include/linux/b=
itops.h, include/linux/kernel.h):
   arch/m68k/include/asm/bitops.h:112:1: sparse: sparse: unreplaced symbol =
'return'
   drivers/usb/dwc2/core.c: note: in included file (through include/linux/b=
itops.h, include/linux/kernel.h):
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
   drivers/usb/dwc2/core.c: note: in included file (through include/linux/b=
itops.h, include/linux/kernel.h):
   arch/m68k/include/asm/bitops.h:155:1: sparse: sparse: unreplaced symbol =
'return'
   drivers/usb/dwc2/core.c: note: in included file (through include/linux/b=
itops.h, include/linux/kernel.h):
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
   drivers/usb/dwc2/core.c: note: in included file (through include/linux/b=
itops.h, include/linux/kernel.h):
   arch/m68k/include/asm/bitops.h:216:9: sparse: sparse: unreplaced symbol =
'return'
   arch/m68k/include/asm/bitops.h:214:1: sparse: sparse: unreplaced symbol =
'return'
   drivers/usb/dwc2/core.c: note: in included file (through include/linux/b=
itops.h, include/linux/kernel.h):
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
   drivers/usb/dwc2/core.c: note: in included file (through include/linux/b=
itops.h, include/linux/kernel.h):
   arch/m68k/include/asm/bitops.h:269:9: sparse: sparse: unreplaced symbol =
'return'
   arch/m68k/include/asm/bitops.h:267:1: sparse: sparse: unreplaced symbol =
'return'
   drivers/usb/dwc2/core.c: note: in included file (through include/linux/b=
itops.h, include/linux/kernel.h):
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
   drivers/usb/dwc2/core.c: note: in included file (through include/linux/b=
itops.h, include/linux/kernel.h):
   arch/m68k/include/asm/bitops.h:322:9: sparse: sparse: unreplaced symbol =
'return'
   arch/m68k/include/asm/bitops.h:320:1: sparse: sparse: unreplaced symbol =
'return'
   drivers/usb/dwc2/core.c: note: in included file (through include/linux/b=
itops.h, include/linux/kernel.h):
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
   drivers/usb/dwc2/core.c: note: in included file (through include/linux/b=
itops.h, include/linux/kernel.h):
   arch/m68k/include/asm/bitops.h:163:9: sparse: sparse: unreplaced symbol =
'return'
   arch/m68k/include/asm/bitops.h:161:1: sparse: sparse: unreplaced symbol =
'return'
   drivers/usb/dwc2/core.c: note: in included file (through include/linux/b=
itops.h, include/linux/kernel.h):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
--
   drivers/usb/dwc2/platform.c: note: in included file (through include/lin=
ux/bitops.h, include/linux/kernel.h):
>> arch/m68k/include/asm/bitops.h:69:1: sparse: sparse: unreplaced symbol '=
return'
   drivers/usb/dwc2/platform.c: note: in included file (through include/lin=
ux/bitops.h, include/linux/kernel.h):
   include/asm-generic/bitops/generic-non-atomic.h:29:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:30:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:27:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/usb/dwc2/platform.c: note: in included file (through include/lin=
ux/bitops.h, include/linux/kernel.h):
   arch/m68k/include/asm/bitops.h:112:1: sparse: sparse: unreplaced symbol =
'return'
   drivers/usb/dwc2/platform.c: note: in included file (through include/lin=
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
   drivers/usb/dwc2/platform.c: note: in included file (through include/lin=
ux/bitops.h, include/linux/kernel.h):
   arch/m68k/include/asm/bitops.h:155:1: sparse: sparse: unreplaced symbol =
'return'
   drivers/usb/dwc2/platform.c: note: in included file (through include/lin=
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
   drivers/usb/dwc2/platform.c: note: in included file (through include/lin=
ux/bitops.h, include/linux/kernel.h):
   arch/m68k/include/asm/bitops.h:216:9: sparse: sparse: unreplaced symbol =
'return'
   arch/m68k/include/asm/bitops.h:214:1: sparse: sparse: unreplaced symbol =
'return'
   drivers/usb/dwc2/platform.c: note: in included file (through include/lin=
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
   drivers/usb/dwc2/platform.c: note: in included file (through include/lin=
ux/bitops.h, include/linux/kernel.h):
   arch/m68k/include/asm/bitops.h:269:9: sparse: sparse: unreplaced symbol =
'return'
   arch/m68k/include/asm/bitops.h:267:1: sparse: sparse: unreplaced symbol =
'return'
   drivers/usb/dwc2/platform.c: note: in included file (through include/lin=
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
   drivers/usb/dwc2/platform.c: note: in included file (through include/lin=
ux/bitops.h, include/linux/kernel.h):
   arch/m68k/include/asm/bitops.h:322:9: sparse: sparse: unreplaced symbol =
'return'
   arch/m68k/include/asm/bitops.h:320:1: sparse: sparse: unreplaced symbol =
'return'
   drivers/usb/dwc2/platform.c: note: in included file (through include/lin=
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
   drivers/usb/dwc2/platform.c: note: in included file (through include/lin=
ux/bitops.h, include/linux/kernel.h):
   arch/m68k/include/asm/bitops.h:163:9: sparse: sparse: unreplaced symbol =
'return'
   arch/m68k/include/asm/bitops.h:161:1: sparse: sparse: unreplaced symbol =
'return'
   drivers/usb/dwc2/platform.c: note: in included file (through include/lin=
ux/bitops.h, include/linux/kernel.h):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
--
   drivers/usb/dwc2/hcd_intr.c: note: in included file (through include/lin=
ux/bitops.h, include/linux/kernel.h):
>> arch/m68k/include/asm/bitops.h:69:1: sparse: sparse: unreplaced symbol '=
return'
   drivers/usb/dwc2/hcd_intr.c: note: in included file (through include/lin=
ux/bitops.h, include/linux/kernel.h):
   include/asm-generic/bitops/generic-non-atomic.h:29:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:30:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:27:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/usb/dwc2/hcd_intr.c: note: in included file (through include/lin=
ux/bitops.h, include/linux/kernel.h):
   arch/m68k/include/asm/bitops.h:112:1: sparse: sparse: unreplaced symbol =
'return'
   drivers/usb/dwc2/hcd_intr.c: note: in included file (through include/lin=
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
   drivers/usb/dwc2/hcd_intr.c: note: in included file (through include/lin=
ux/bitops.h, include/linux/kernel.h):
   arch/m68k/include/asm/bitops.h:155:1: sparse: sparse: unreplaced symbol =
'return'
   drivers/usb/dwc2/hcd_intr.c: note: in included file (through include/lin=
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
   drivers/usb/dwc2/hcd_intr.c: note: in included file (through include/lin=
ux/bitops.h, include/linux/kernel.h):
   arch/m68k/include/asm/bitops.h:216:9: sparse: sparse: unreplaced symbol =
'return'
   arch/m68k/include/asm/bitops.h:214:1: sparse: sparse: unreplaced symbol =
'return'
   drivers/usb/dwc2/hcd_intr.c: note: in included file (through include/lin=
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
   drivers/usb/dwc2/hcd_intr.c: note: in included file (through include/lin=
ux/bitops.h, include/linux/kernel.h):
   arch/m68k/include/asm/bitops.h:269:9: sparse: sparse: unreplaced symbol =
'return'
   arch/m68k/include/asm/bitops.h:267:1: sparse: sparse: unreplaced symbol =
'return'
   drivers/usb/dwc2/hcd_intr.c: note: in included file (through include/lin=
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
   drivers/usb/dwc2/hcd_intr.c: note: in included file (through include/lin=
ux/bitops.h, include/linux/kernel.h):
   arch/m68k/include/asm/bitops.h:322:9: sparse: sparse: unreplaced symbol =
'return'
   arch/m68k/include/asm/bitops.h:320:1: sparse: sparse: unreplaced symbol =
'return'
   drivers/usb/dwc2/hcd_intr.c: note: in included file (through include/lin=
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
   drivers/usb/dwc2/hcd_intr.c: note: in included file (through include/lin=
ux/bitops.h, include/linux/kernel.h):
   arch/m68k/include/asm/bitops.h:163:9: sparse: sparse: unreplaced symbol =
'return'
   arch/m68k/include/asm/bitops.h:161:1: sparse: sparse: unreplaced symbol =
'return'
   drivers/usb/dwc2/hcd_intr.c: note: in included file (through include/lin=
ux/bitops.h, include/linux/kernel.h):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'
--
   drivers/usb/dwc2/hcd.c: note: in included file (through include/linux/bi=
tops.h, include/linux/kernel.h):
>> arch/m68k/include/asm/bitops.h:69:1: sparse: sparse: unreplaced symbol '=
return'
   drivers/usb/dwc2/hcd.c: note: in included file (through include/linux/bi=
tops.h, include/linux/kernel.h):
   include/asm-generic/bitops/generic-non-atomic.h:29:9: sparse: sparse: un=
replaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:30:9: sparse: sparse: un=
replaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:10: sparse: sparse: u=
nreplaced symbol 'p'
   include/asm-generic/bitops/generic-non-atomic.h:32:16: sparse: sparse: u=
nreplaced symbol 'mask'
   include/asm-generic/bitops/generic-non-atomic.h:27:1: sparse: sparse: un=
replaced symbol 'return'
   drivers/usb/dwc2/hcd.c: note: in included file (through include/linux/bi=
tops.h, include/linux/kernel.h):
   arch/m68k/include/asm/bitops.h:112:1: sparse: sparse: unreplaced symbol =
'return'
   drivers/usb/dwc2/hcd.c: note: in included file (through include/linux/bi=
tops.h, include/linux/kernel.h):
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
   drivers/usb/dwc2/hcd.c: note: in included file (through include/linux/bi=
tops.h, include/linux/kernel.h):
   arch/m68k/include/asm/bitops.h:155:1: sparse: sparse: unreplaced symbol =
'return'
   drivers/usb/dwc2/hcd.c: note: in included file (through include/linux/bi=
tops.h, include/linux/kernel.h):
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
   drivers/usb/dwc2/hcd.c: note: in included file (through include/linux/bi=
tops.h, include/linux/kernel.h):
   arch/m68k/include/asm/bitops.h:216:9: sparse: sparse: unreplaced symbol =
'return'
   arch/m68k/include/asm/bitops.h:214:1: sparse: sparse: unreplaced symbol =
'return'
   drivers/usb/dwc2/hcd.c: note: in included file (through include/linux/bi=
tops.h, include/linux/kernel.h):
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
   drivers/usb/dwc2/hcd.c: note: in included file (through include/linux/bi=
tops.h, include/linux/kernel.h):
   arch/m68k/include/asm/bitops.h:269:9: sparse: sparse: unreplaced symbol =
'return'
   arch/m68k/include/asm/bitops.h:267:1: sparse: sparse: unreplaced symbol =
'return'
   drivers/usb/dwc2/hcd.c: note: in included file (through include/linux/bi=
tops.h, include/linux/kernel.h):
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
   drivers/usb/dwc2/hcd.c: note: in included file (through include/linux/bi=
tops.h, include/linux/kernel.h):
   arch/m68k/include/asm/bitops.h:322:9: sparse: sparse: unreplaced symbol =
'return'
   arch/m68k/include/asm/bitops.h:320:1: sparse: sparse: unreplaced symbol =
'return'
   drivers/usb/dwc2/hcd.c: note: in included file (through include/linux/bi=
tops.h, include/linux/kernel.h):
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
   drivers/usb/dwc2/hcd.c: note: in included file (through include/linux/bi=
tops.h, include/linux/kernel.h):
   arch/m68k/include/asm/bitops.h:163:9: sparse: sparse: unreplaced symbol =
'return'
   arch/m68k/include/asm/bitops.h:161:1: sparse: sparse: unreplaced symbol =
'return'
   drivers/usb/dwc2/hcd.c: note: in included file (through include/linux/bi=
tops.h, include/linux/kernel.h):
   include/asm-generic/bitops/generic-non-atomic.h:127:9: sparse: sparse: u=
nreplaced symbol 'return'
   include/asm-generic/bitops/generic-non-atomic.h:120:1: sparse: sparse: u=
nreplaced symbol 'return'

vim +/return +69 arch/m68k/include/asm/bitops.h

171d809df1896c1 Greg Ungerer      2011-05-17  67  =

521611f961a7dda Alexander Lobakin 2022-05-09  68  static __always_inline vo=
id
521611f961a7dda Alexander Lobakin 2022-05-09 @69  arch___set_bit(unsigned l=
ong nr, volatile unsigned long *addr)
521611f961a7dda Alexander Lobakin 2022-05-09  70  {
521611f961a7dda Alexander Lobakin 2022-05-09  71  	set_bit(nr, addr);
521611f961a7dda Alexander Lobakin 2022-05-09  72  }
171d809df1896c1 Greg Ungerer      2011-05-17  73  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2264779698181096832==--

