Content-Type: multipart/mixed; boundary="===============1156201676171040487=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v8 10/11] DO NOT MERGE: ARM: dts: Add RPi's official PoE hat support
Date: Sat, 13 Mar 2021 04:05:45 +0800
Message-ID: <202103130418.1bd0n73a-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1156201676171040487==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20210312122454.24480-11-nsaenzjulienne@suse.de>
References: <20210312122454.24480-11-nsaenzjulienne@suse.de>
TO: Nicolas Saenz Julienne <nsaenzjulienne@suse.de>

Hi Nicolas,

I love your patch! Perhaps something to improve:

[auto build test WARNING on pwm/for-next]
[also build test WARNING on robh/for-next staging/staging-testing linus/mas=
ter v5.12-rc2 next-20210312]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch]

url:    https://github.com/0day-ci/linux/commits/Nicolas-Saenz-Julienne/Ras=
pberry-Pi-PoE-HAT-fan-support/20210312-202716
base:   https://git.kernel.org/pub/scm/linux/kernel/git/thierry.reding/linu=
x-pwm.git for-next
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
compiler: arm-linux-gnueabi-gcc (GCC) 9.3.0
reproduce: make ARCH=3Darm dtbs_check

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


"dtcheck warnings: (new ones prefixed by >>)"

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1156201676171040487==--

