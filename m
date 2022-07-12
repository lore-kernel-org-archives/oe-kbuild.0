Content-Type: multipart/mixed; boundary="===============2318474082293612552=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 3432/9472] arch/x86/kvm/mmu/paging_tmpl.h:106:24: sparse: sparse: cast truncates bits from constant value (ffffffffff000 becomes fffff000)
Date: Tue, 12 Jul 2022 13:29:25 +0800
Message-ID: <202207121333.AfJIvD9y-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2318474082293612552==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "commit no functional change"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Sean Christopherson <seanjc@google.com>
CC: Paolo Bonzini <pbonzini@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   4112a8699ae2eac797415b9be1d7901b3f79e772
commit: 70e41c31bc7776b262cd9f524df3dfc2b5869a0a [3432/9472] KVM: x86/mmu: =
Use common logic for computing the 32/64-bit base PA mask
:::::: branch date: 18 hours ago
:::::: commit date: 3 weeks ago
config: x86_64-rhel-8.3-kselftests (https://download.01.org/0day-ci/archive=
/20220712/202207121333.AfJIvD9y-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.g=
it/commit/?id=3D70e41c31bc7776b262cd9f524df3dfc2b5869a0a
        git remote add linux-next https://git.kernel.org/pub/scm/linux/kern=
el/git/next/linux-next.git
        git fetch --no-tags linux-next master
        git checkout 70e41c31bc7776b262cd9f524df3dfc2b5869a0a
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=3D1 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3D=
build_dir ARCH=3Dx86_64 SHELL=3D/bin/bash arch/x86/kvm/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
   arch/x86/kvm/mmu/mmu.c:610:9: sparse: sparse: context imbalance in 'walk=
_shadow_page_lockless_begin' - different lock contexts for basic block
   arch/x86/kvm/mmu/mmu.c: note: in included file (through include/linux/rb=
tree.h, include/linux/mm_types.h, arch/x86/kvm/irq.h):
   include/linux/rcupdate.h:726:9: sparse: sparse: context imbalance in 'wa=
lk_shadow_page_lockless_end' - unexpected unlock
   arch/x86/kvm/mmu/mmu.c:2550:9: sparse: sparse: context imbalance in 'mmu=
_try_to_unsync_pages' - different lock contexts for basic block
   arch/x86/kvm/mmu/mmu.c: note: in included file:
>> arch/x86/kvm/mmu/paging_tmpl.h:106:24: sparse: sparse: cast truncates bi=
ts from constant value (ffffffffff000 becomes fffff000)
   arch/x86/kvm/mmu/paging_tmpl.h:426:24: sparse: sparse: cast truncates bi=
ts from constant value (ffffffffff000 becomes fffff000)
   arch/x86/kvm/mmu/mmu.c:4618:57: sparse: sparse: cast truncates bits from=
 constant value (ffffff33 becomes 33)
   arch/x86/kvm/mmu/mmu.c:4620:56: sparse: sparse: cast truncates bits from=
 constant value (ffffff0f becomes f)
   arch/x86/kvm/mmu/mmu.c:4622:57: sparse: sparse: cast truncates bits from=
 constant value (ffffff55 becomes 55)

vim +106 arch/x86/kvm/mmu/paging_tmpl.h

b3fcdb04a98035 arch/x86/kvm/mmu/paging_tmpl.h Sean Christopherson 2022-06-1=
4  103  =

e04da980c35d75 arch/x86/kvm/paging_tmpl.h     Joerg Roedel        2009-07-2=
7  104  static gfn_t gpte_to_gfn_lvl(pt_element_t gpte, int lvl)
5fb07ddb183eb4 drivers/kvm/paging_tmpl.h      Avi Kivity          2007-11-2=
1  105  {
e04da980c35d75 arch/x86/kvm/paging_tmpl.h     Joerg Roedel        2009-07-2=
7 @106  	return (gpte & PT_LVL_ADDR_MASK(lvl)) >> PAGE_SHIFT;
5fb07ddb183eb4 drivers/kvm/paging_tmpl.h      Avi Kivity          2007-11-2=
1  107  }
5fb07ddb183eb4 drivers/kvm/paging_tmpl.h      Avi Kivity          2007-11-2=
1  108  =


:::::: The code at line 106 was first introduced by commit
:::::: e04da980c35d75fa050ba4009ad99025432d8d7d KVM: MMU: make page walker =
aware of mapping levels

:::::: TO: Joerg Roedel <joerg.roedel@amd.com>
:::::: CC: Avi Kivity <avi@redhat.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============2318474082293612552==--

