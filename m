Content-Type: multipart/mixed; boundary="===============8038378361358793791=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH v9 07/14] KVM: Don't allocate dirty bitmap if dirty ring is enabled
Date: Tue, 26 May 2020 04:22:42 +0800
Message-ID: <202005260449.kPT8am4i%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8038378361358793791==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20200523225659.1027044-8-peterx@redhat.com>
References: <20200523225659.1027044-8-peterx@redhat.com>
TO: Peter Xu <peterx@redhat.com>
TO: linux-kernel(a)vger.kernel.org
TO: kvm(a)vger.kernel.org
CC: Vitaly Kuznetsov <vkuznets@redhat.com>
CC: Alex Williamson <alex.williamson@redhat.com>
CC: "Michael S . Tsirkin" <mst@redhat.com>
CC: Paolo Bonzini <pbonzini@redhat.com>
CC: "Dr . David Alan Gilbert" <dgilbert@redhat.com>
CC: Christophe de Dinechin <dinechin@redhat.com>
CC: Jason Wang <jasowang@redhat.com>
CC: Kevin Tian <kevin.tian@intel.com>
CC: peterx(a)redhat.com

Hi Peter,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on vhost/linux-next]
[also build test WARNING on linus/master v5.7-rc7]
[cannot apply to kvm/linux-next tip/auto-latest linux/master next-20200522]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Peter-Xu/KVM-Dirty-ring-in=
terface/20200524-070926
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git linux=
-next
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
compiler: gcc-7 (Ubuntu 7.5.0-6ubuntu2) 7.5.0
reproduce (this is a W=3D1 build):
        # save the attached .config to linux build tree
        make W=3D1 ARCH=3Dx86_64 =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> arch/x86/kvm/mmu/mmu.c:1280:3: warning: Returning an integer in a functi=
on with pointer return type is not portable. [CastIntegerToAddressAtReturn]
     return false;
     ^
   arch/x86/kvm/mmu/mmu.c:3725:9: warning: Redundant initialization for 'ro=
ot'. The initialized value is overwritten before it is read. [redundantInit=
ialization]
      root =3D __pa(sp->spt);
           ^
   arch/x86/kvm/mmu/mmu.c:3715:15: note: root is initialized
      hpa_t root =3D vcpu->arch.mmu->pae_root[i];
                 ^
   arch/x86/kvm/mmu/mmu.c:3725:9: note: root is overwritten
      root =3D __pa(sp->spt);
           ^
   arch/x86/kvm/mmu/mmu.c:3769:8: warning: Redundant initialization for 'ro=
ot'. The initialized value is overwritten before it is read. [redundantInit=
ialization]
     root =3D __pa(sp->spt);
          ^
   arch/x86/kvm/mmu/mmu.c:3758:14: note: root is initialized
     hpa_t root =3D vcpu->arch.mmu->root_hpa;
                ^
   arch/x86/kvm/mmu/mmu.c:3769:8: note: root is overwritten
     root =3D __pa(sp->spt);
          ^
   arch/x86/kvm/mmu/mmu.c:4670:15: warning: Clarify calculation precedence =
for '&' and '?'. [clarifyCalculation]
    const u8 x =3D BYTE_MASK(ACC_EXEC_MASK);
                 ^
   arch/x86/kvm/mmu/mmu.c:4671:15: warning: Clarify calculation precedence =
for '&' and '?'. [clarifyCalculation]
    const u8 w =3D BYTE_MASK(ACC_WRITE_MASK);
                 ^
   arch/x86/kvm/mmu/mmu.c:4672:15: warning: Clarify calculation precedence =
for '&' and '?'. [clarifyCalculation]
    const u8 u =3D BYTE_MASK(ACC_USER_MASK);

# https://github.com/0day-ci/linux/commit/2c23bd2b96e30ae3814e3e56f01a62341=
31cb531
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout 2c23bd2b96e30ae3814e3e56f01a6234131cb531
vim +1280 arch/x86/kvm/mmu/mmu.c

b8e8c8303ff28c arch/x86/kvm/mmu.c     Paolo Bonzini   2019-11-04  1269  =

5d163b1c9d6e55 arch/x86/kvm/mmu.c     Xiao Guangrong  2011-03-09  1270  sta=
tic struct kvm_memory_slot *
5d163b1c9d6e55 arch/x86/kvm/mmu.c     Xiao Guangrong  2011-03-09  1271  gfn=
_to_memslot_dirty_bitmap(struct kvm_vcpu *vcpu, gfn_t gfn,
5d163b1c9d6e55 arch/x86/kvm/mmu.c     Xiao Guangrong  2011-03-09  1272  			=
    bool no_dirty_log)
05da45583de9b3 arch/x86/kvm/mmu.c     Marcelo Tosatti 2008-02-23  1273  {
05da45583de9b3 arch/x86/kvm/mmu.c     Marcelo Tosatti 2008-02-23  1274  	st=
ruct kvm_memory_slot *slot;
5d163b1c9d6e55 arch/x86/kvm/mmu.c     Xiao Guangrong  2011-03-09  1275  =

54bf36aac52031 arch/x86/kvm/mmu.c     Paolo Bonzini   2015-04-08  1276  	sl=
ot =3D kvm_vcpu_gfn_to_memslot(vcpu, gfn);
91b0d268a59dd9 arch/x86/kvm/mmu/mmu.c Paolo Bonzini   2020-01-21  1277  	if=
 (!slot || slot->flags & KVM_MEMSLOT_INVALID)
91b0d268a59dd9 arch/x86/kvm/mmu/mmu.c Paolo Bonzini   2020-01-21  1278  		r=
eturn NULL;
2c23bd2b96e30a arch/x86/kvm/mmu/mmu.c Peter Xu        2020-05-23  1279  	if=
 (no_dirty_log && kvm_slot_dirty_track_enabled(slot))
2c23bd2b96e30a arch/x86/kvm/mmu/mmu.c Peter Xu        2020-05-23 @1280  		r=
eturn false;
5d163b1c9d6e55 arch/x86/kvm/mmu.c     Xiao Guangrong  2011-03-09  1281  =

5d163b1c9d6e55 arch/x86/kvm/mmu.c     Xiao Guangrong  2011-03-09  1282  	re=
turn slot;
5d163b1c9d6e55 arch/x86/kvm/mmu.c     Xiao Guangrong  2011-03-09  1283  }
5d163b1c9d6e55 arch/x86/kvm/mmu.c     Xiao Guangrong  2011-03-09  1284  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8038378361358793791==--

