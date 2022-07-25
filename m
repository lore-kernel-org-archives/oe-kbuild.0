Content-Type: multipart/mixed; boundary="===============0226618760421465475=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [sashal-stable:pending-5.4 72/73] arch/x86/kernel/cpu/mce/core.o: warning: objtool: ex_handler_rdmsr_fault()+0xf: unreachable instruction
Date: Tue, 26 Jul 2022 07:10:19 +0800
Message-ID: <202207260737.0WDu9Il7-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0226618760421465475==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "commit no functional change"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: Sasha Levin <sashal@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stable=
.git pending-5.4
head:   65cfdc20bb4e6de48be401ccb970442fb894c4de
commit: 07657800f1d4a5d78e2e14f1e6d75da834a0feb2 [72/73] x86/mce: Deduplica=
te exception handling
:::::: branch date: 7 hours ago
:::::: commit date: 7 hours ago
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20220726/2=
02207260737.0WDu9Il7-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0
reproduce (this is a W=3D1 build):
        # https://git.kernel.org/pub/scm/linux/kernel/git/sashal/linux-stab=
le.git/commit/?id=3D07657800f1d4a5d78e2e14f1e6d75da834a0feb2
        git remote add sashal-stable https://git.kernel.org/pub/scm/linux/k=
ernel/git/sashal/linux-stable.git
        git fetch --no-tags sashal-stable pending-5.4
        git checkout 07657800f1d4a5d78e2e14f1e6d75da834a0feb2
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=3D1 O=3Dbuild_dir ARCH=3Dx86_64 SHELL=3D/bin/bash arch/x86/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All warnings (new ones prefixed by >>):

>> arch/x86/kernel/cpu/mce/core.o: warning: objtool: ex_handler_rdmsr_fault=
()+0xf: unreachable instruction


objdump-func vmlinux.o ex_handler_rdmsr_fault:
0000 0000000000002df4 <ex_handler_rdmsr_fault>:
0000     2df4:	e8 00 00 00 00       	call   2df9 <ex_handler_rdmsr_fault+0x=
5>	2df5: R_X86_64_PLT32	__fentry__-0x4
0005     2df9:	48 89 f7             	mov    %rsi,%rdi
0008     2dfc:	31 f6                	xor    %esi,%esi
000a     2dfe:	e8 35 fe ff ff       	call   2c38 <ex_handler_msr_mce>
000f     2e03:	b0 01                	mov    $0x1,%al
0011     2e05:	c3                   	ret    =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============0226618760421465475==--

