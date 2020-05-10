Content-Type: multipart/mixed; boundary="===============7728705725236361923=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH v11 12/18] x86/fsgsbase/64: move save_fsgs to header file
Date: Sun, 10 May 2020 16:14:00 +0800
Message-ID: <202005101639.lNSWYzcC%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7728705725236361923==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20200509173655.13977-13-sashal@kernel.org>
References: <20200509173655.13977-13-sashal@kernel.org>
TO: Sasha Levin <alexander.levin@microsoft.com>
TO: linux-kernel(a)vger.kernel.org
TO: tglx(a)linutronix.de
TO: bp(a)alien8.de
TO: luto(a)kernel.org
CC: hpa(a)zytor.com
CC: dave.hansen(a)intel.com
CC: tony.luck(a)intel.com
CC: ak(a)linux.intel.com
CC: ravi.v.shankar(a)intel.com
CC: chang.seok.bae(a)intel.com
CC: Sasha Levin <alexander.levin@microsoft.com>

Hi Sasha,

I love your patch! Perhaps something to improve:

[auto build test WARNING on tip/x86/asm]
[also build test WARNING on tip/auto-latest linus/master tip/x86/core v5.7-=
rc4 next-20200508]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Sasha-Levin/Enable-FSGSBAS=
E-instructions/20200510-032805
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git 2ce0d7f=
9766f0e49bb54f149c77bae89464932fb
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.1-191-gc51a0382-dirty
        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> arch/x86/kernel/process.h:42:9: sparse: sparse: empty enum definition
   arch/x86/kernel/process.h:42:9: sparse: sparse: Expected } at end of str=
uct-union-enum-specifier
   arch/x86/kernel/process.h:42:9: sparse: sparse: got 9

# https://github.com/0day-ci/linux/commit/9e719afbb12b0236d01454efaac424c14=
f46bf69
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout 9e719afbb12b0236d01454efaac424c14f46bf69
vim +42 arch/x86/kernel/process.h

9e719afbb12b02 Sasha Levin 2020-05-09  40  =

9e719afbb12b02 Sasha Levin 2020-05-09  41  enum which_selector {
9e719afbb12b02 Sasha Levin 2020-05-09 @42  	FS,
9e719afbb12b02 Sasha Levin 2020-05-09  43  	GS
9e719afbb12b02 Sasha Levin 2020-05-09  44  };
9e719afbb12b02 Sasha Levin 2020-05-09  45  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7728705725236361923==--

