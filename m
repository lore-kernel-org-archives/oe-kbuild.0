Content-Type: multipart/mixed; boundary="===============7330573497504762933=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-stable-rc:linux-5.16.y 706/1693] vmlinux.o: warning: objtool: pv_ops[25]: xen_read_msr_safe
Date: Thu, 17 Feb 2022 17:51:08 +0800
Message-ID: <202202171738.d4lsxQwE-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7330573497504762933==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Borislav Petkov <bp@suse.de>
CC: "Greg Kroah-Hartman" <gregkh@linuxfoundation.org>
CC: Sasha Levin <sashal@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable=
-rc.git linux-5.16.y
head:   528cecfa5af09631f0589efe9eacbd543c8c9db1
commit: a9d8885178ce1444e799e98211da909515326648 [706/1693] x86/mce: Preven=
t severity computation from being instrumented
:::::: branch date: 22 hours ago
:::::: commit date: 3 weeks ago
config: x86_64-randconfig-s021 (https://download.01.org/0day-ci/archive/202=
20217/202202171738.d4lsxQwE-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stab=
le-rc.git/commit/?id=3Da9d8885178ce1444e799e98211da909515326648
        git remote add linux-stable-rc https://git.kernel.org/pub/scm/linux=
/kernel/git/stable/linux-stable-rc.git
        git fetch --no-tags linux-stable-rc linux-5.16.y
        git checkout a9d8885178ce1444e799e98211da909515326648
        # save the config file to linux build tree
        mkdir build_dir
        make W=3D1 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3D=
build_dir ARCH=3Dx86_64 SHELL=3D/bin/bash

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

   vmlinux.o: warning: objtool: pv_ops[22]: xen_cpuid
   vmlinux.o: warning: objtool: pv_ops[22]: native_cpuid
   vmlinux.o: warning: objtool: mce_setup()+0x8f: call to pv_ops[22]() leav=
es .noinstr.text section
   vmlinux.o: warning: objtool: do_machine_check()+0x109b: call to fortify_=
panic() leaves .noinstr.text section
>> vmlinux.o: warning: objtool: pv_ops[25]: xen_read_msr_safe
>> vmlinux.o: warning: objtool: pv_ops[25]: native_read_msr_safe
>> vmlinux.o: warning: objtool: mce_severity_amd.constprop.0()+0xab: call t=
o pv_ops[25]() leaves .noinstr.text section

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7330573497504762933==--

