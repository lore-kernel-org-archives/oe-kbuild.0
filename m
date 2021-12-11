Content-Type: multipart/mixed; boundary="===============2878835899161159305=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 5422/6579] arch/arm64/kvm/vgic/vgic-mmio-v3.c:769:15: warning: Unsigned variable 'c' can't be negative so it is unnecessary to test it. [unsignedPositive]
Date: Sun, 12 Dec 2021 05:34:21 +0800
Message-ID: <202112120513.K5TwjZWa-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2878835899161159305==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Marc Zyngier <maz@kernel.org>
CC: Paolo Bonzini <pbonzini@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   ea922272cbe547bdf58da2aaf240d59782c6a009
commit: 46808a4cb89708c2e5b264eb9d1035762581921b [5422/6579] KVM: Use 'unsi=
gned long' as kvm_for_each_vcpu()'s index
:::::: branch date: 24 hours ago
:::::: commit date: 4 days ago
compiler: aarch64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> arch/arm64/kvm/vgic/vgic-mmio-v3.c:769:15: warning: Unsigned variable 'c=
' can't be negative so it is unnecessary to test it. [unsignedPositive]
     for (c--; c >=3D 0; c--) {
                 ^

vim +769 arch/arm64/kvm/vgic/vgic-mmio-v3.c

7fadcd3a859b21 virt/kvm/arm/vgic/vgic-mmio-v3.c   Christoffer Dall 2017-05-=
08  753  =

1aab6f468c10a1 virt/kvm/arm/vgic/vgic-mmio-v3.c   Christoffer Dall 2017-05-=
08  754  static int vgic_register_all_redist_iodevs(struct kvm *kvm)
7fadcd3a859b21 virt/kvm/arm/vgic/vgic-mmio-v3.c   Christoffer Dall 2017-05-=
08  755  {
7fadcd3a859b21 virt/kvm/arm/vgic/vgic-mmio-v3.c   Christoffer Dall 2017-05-=
08  756  	struct kvm_vcpu *vcpu;
46808a4cb89708 arch/arm64/kvm/vgic/vgic-mmio-v3.c Marc Zyngier     2021-11-=
16  757  	unsigned long c;
46808a4cb89708 arch/arm64/kvm/vgic/vgic-mmio-v3.c Marc Zyngier     2021-11-=
16  758  	int ret =3D 0;
7fadcd3a859b21 virt/kvm/arm/vgic/vgic-mmio-v3.c   Christoffer Dall 2017-05-=
08  759  =

7fadcd3a859b21 virt/kvm/arm/vgic/vgic-mmio-v3.c   Christoffer Dall 2017-05-=
08  760  	kvm_for_each_vcpu(c, vcpu, kvm) {
7fadcd3a859b21 virt/kvm/arm/vgic/vgic-mmio-v3.c   Christoffer Dall 2017-05-=
08  761  		ret =3D vgic_register_redist_iodev(vcpu);
7fadcd3a859b21 virt/kvm/arm/vgic/vgic-mmio-v3.c   Christoffer Dall 2017-05-=
08  762  		if (ret)
7fadcd3a859b21 virt/kvm/arm/vgic/vgic-mmio-v3.c   Christoffer Dall 2017-05-=
08  763  			break;
ed9b8cefa91695 virt/kvm/arm/vgic/vgic-mmio-v3.c   Andre Przywara   2015-12-=
01  764  	}
ed9b8cefa91695 virt/kvm/arm/vgic/vgic-mmio-v3.c   Andre Przywara   2015-12-=
01  765  =

ed9b8cefa91695 virt/kvm/arm/vgic/vgic-mmio-v3.c   Andre Przywara   2015-12-=
01  766  	if (ret) {
ed9b8cefa91695 virt/kvm/arm/vgic/vgic-mmio-v3.c   Andre Przywara   2015-12-=
01  767  		/* The current c failed, so we start with the previous one. */
fa472fa91a5a0b virt/kvm/arm/vgic/vgic-mmio-v3.c   Christoffer Dall 2017-05-=
17  768  		mutex_lock(&kvm->slots_lock);
ed9b8cefa91695 virt/kvm/arm/vgic/vgic-mmio-v3.c   Andre Przywara   2015-12-=
01 @769  		for (c--; c >=3D 0; c--) {
8f6cdc1c2eec20 virt/kvm/arm/vgic/vgic-mmio-v3.c   Andre Przywara   2016-07-=
15  770  			vcpu =3D kvm_get_vcpu(kvm, c);
7fadcd3a859b21 virt/kvm/arm/vgic/vgic-mmio-v3.c   Christoffer Dall 2017-05-=
08  771  			vgic_unregister_redist_iodev(vcpu);
ed9b8cefa91695 virt/kvm/arm/vgic/vgic-mmio-v3.c   Andre Przywara   2015-12-=
01  772  		}
fa472fa91a5a0b virt/kvm/arm/vgic/vgic-mmio-v3.c   Christoffer Dall 2017-05-=
17  773  		mutex_unlock(&kvm->slots_lock);
ed9b8cefa91695 virt/kvm/arm/vgic/vgic-mmio-v3.c   Andre Przywara   2015-12-=
01  774  	}
ed9b8cefa91695 virt/kvm/arm/vgic/vgic-mmio-v3.c   Andre Przywara   2015-12-=
01  775  =

ed9b8cefa91695 virt/kvm/arm/vgic/vgic-mmio-v3.c   Andre Przywara   2015-12-=
01  776  	return ret;
ed9b8cefa91695 virt/kvm/arm/vgic/vgic-mmio-v3.c   Andre Przywara   2015-12-=
01  777  }
621ecd8d2123bc virt/kvm/arm/vgic/vgic-mmio-v3.c   Andre Przywara   2016-01-=
26  778  =


:::::: The code at line 769 was first introduced by commit
:::::: ed9b8cefa91695119e634979db6090d0700a21f8 KVM: arm/arm64: vgic-new: A=
dd GICv3 MMIO handling framework

:::::: TO: Andre Przywara <andre.przywara@arm.com>
:::::: CC: Christoffer Dall <christoffer.dall@linaro.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2878835899161159305==--

