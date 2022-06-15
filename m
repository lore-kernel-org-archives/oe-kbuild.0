Content-Type: multipart/mixed; boundary="===============5416325129021891903=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: arch/arm64/kvm/vgic/vgic-mmio-v3.c:800 vgic_v3_alloc_redist_region() warn: check sign expansion for 'nr_vcpus * (2 * 65536)'
Date: Thu, 16 Jun 2022 00:52:12 +0800
Message-ID: <202206160000.wUzARcDA-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5416325129021891903==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Ricardo Koller <ricarkol@google.com>
CC: Marc Zyngier <maz@kernel.org>
CC: Eric Auger <eric.auger@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   018ab4fabddd94f1c96f3b59e180691b9e88d5d8
commit: 4612d98f58c73ad63928200fd332f75c8e524dae KVM: arm64: vgic-v3: Check=
 redist region is not above the VM IPA size
date:   8 months ago
:::::: branch date: 23 hours ago
:::::: commit date: 8 months ago
config: arm64-randconfig-m031-20220615 (https://download.01.org/0day-ci/arc=
hive/20220616/202206160000.wUzARcDA-lkp(a)intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
arch/arm64/kvm/vgic/vgic-mmio-v3.c:800 vgic_v3_alloc_redist_region() warn: =
check sign expansion for 'nr_vcpus * (2 * 65536)'

vim +800 arch/arm64/kvm/vgic/vgic-mmio-v3.c

621ecd8d2123bc virt/kvm/arm/vgic/vgic-mmio-v3.c   Andre Przywara   2016-01-=
26  777  =

ccc27bf5be7b78 virt/kvm/arm/vgic/vgic-mmio-v3.c   Eric Auger       2018-05-=
22  778  /**
e5a35635464bc5 arch/arm64/kvm/vgic/vgic-mmio-v3.c Eric Auger       2021-04-=
05  779   * vgic_v3_alloc_redist_region - Allocate a new redistributor regi=
on
ccc27bf5be7b78 virt/kvm/arm/vgic/vgic-mmio-v3.c   Eric Auger       2018-05-=
22  780   *
ccc27bf5be7b78 virt/kvm/arm/vgic/vgic-mmio-v3.c   Eric Auger       2018-05-=
22  781   * Performs various checks before inserting the rdist region in th=
e list.
ccc27bf5be7b78 virt/kvm/arm/vgic/vgic-mmio-v3.c   Eric Auger       2018-05-=
22  782   * Those tests depend on whether the size of the rdist region is k=
nown
ccc27bf5be7b78 virt/kvm/arm/vgic/vgic-mmio-v3.c   Eric Auger       2018-05-=
22  783   * (ie. count !=3D 0). The list is sorted by rdist region index.
ccc27bf5be7b78 virt/kvm/arm/vgic/vgic-mmio-v3.c   Eric Auger       2018-05-=
22  784   *
ccc27bf5be7b78 virt/kvm/arm/vgic/vgic-mmio-v3.c   Eric Auger       2018-05-=
22  785   * @kvm: kvm handle
ccc27bf5be7b78 virt/kvm/arm/vgic/vgic-mmio-v3.c   Eric Auger       2018-05-=
22  786   * @index: redist region index
ccc27bf5be7b78 virt/kvm/arm/vgic/vgic-mmio-v3.c   Eric Auger       2018-05-=
22  787   * @base: base of the new rdist region
ccc27bf5be7b78 virt/kvm/arm/vgic/vgic-mmio-v3.c   Eric Auger       2018-05-=
22  788   * @count: number of redistributors the region is made of (0 in th=
e old style
ccc27bf5be7b78 virt/kvm/arm/vgic/vgic-mmio-v3.c   Eric Auger       2018-05-=
22  789   * single region, whose size is induced from the number of vcpus)
ccc27bf5be7b78 virt/kvm/arm/vgic/vgic-mmio-v3.c   Eric Auger       2018-05-=
22  790   *
ccc27bf5be7b78 virt/kvm/arm/vgic/vgic-mmio-v3.c   Eric Auger       2018-05-=
22  791   * Return 0 on success, < 0 otherwise
ccc27bf5be7b78 virt/kvm/arm/vgic/vgic-mmio-v3.c   Eric Auger       2018-05-=
22  792   */
e5a35635464bc5 arch/arm64/kvm/vgic/vgic-mmio-v3.c Eric Auger       2021-04-=
05  793  static int vgic_v3_alloc_redist_region(struct kvm *kvm, uint32_t i=
ndex,
ccc27bf5be7b78 virt/kvm/arm/vgic/vgic-mmio-v3.c   Eric Auger       2018-05-=
22  794  				       gpa_t base, uint32_t count)
1aab6f468c10a1 virt/kvm/arm/vgic/vgic-mmio-v3.c   Christoffer Dall 2017-05-=
08  795  {
ccc27bf5be7b78 virt/kvm/arm/vgic/vgic-mmio-v3.c   Eric Auger       2018-05-=
22  796  	struct vgic_dist *d =3D &kvm->arch.vgic;
dbd9733ab6742d virt/kvm/arm/vgic/vgic-mmio-v3.c   Eric Auger       2018-05-=
22  797  	struct vgic_redist_region *rdreg;
ccc27bf5be7b78 virt/kvm/arm/vgic/vgic-mmio-v3.c   Eric Auger       2018-05-=
22  798  	struct list_head *rd_regions =3D &d->rd_regions;
4612d98f58c73a arch/arm64/kvm/vgic/vgic-mmio-v3.c Ricardo Koller   2021-10-=
04  799  	int nr_vcpus =3D atomic_read(&kvm->online_vcpus);
4612d98f58c73a arch/arm64/kvm/vgic/vgic-mmio-v3.c Ricardo Koller   2021-10-=
04 @800  	size_t size =3D count ? count * KVM_VGIC_V3_REDIST_SIZE
4612d98f58c73a arch/arm64/kvm/vgic/vgic-mmio-v3.c Ricardo Koller   2021-10-=
04  801  			    : nr_vcpus * KVM_VGIC_V3_REDIST_SIZE;
1aab6f468c10a1 virt/kvm/arm/vgic/vgic-mmio-v3.c   Christoffer Dall 2017-05-=
08  802  	int ret;
1aab6f468c10a1 virt/kvm/arm/vgic/vgic-mmio-v3.c   Christoffer Dall 2017-05-=
08  803  =

ccc27bf5be7b78 virt/kvm/arm/vgic/vgic-mmio-v3.c   Eric Auger       2018-05-=
22  804  	/* cross the end of memory ? */
ccc27bf5be7b78 virt/kvm/arm/vgic/vgic-mmio-v3.c   Eric Auger       2018-05-=
22  805  	if (base + size < base)
ccc27bf5be7b78 virt/kvm/arm/vgic/vgic-mmio-v3.c   Eric Auger       2018-05-=
22  806  		return -EINVAL;
ccc27bf5be7b78 virt/kvm/arm/vgic/vgic-mmio-v3.c   Eric Auger       2018-05-=
22  807  =

ccc27bf5be7b78 virt/kvm/arm/vgic/vgic-mmio-v3.c   Eric Auger       2018-05-=
22  808  	if (list_empty(rd_regions)) {
ccc27bf5be7b78 virt/kvm/arm/vgic/vgic-mmio-v3.c   Eric Auger       2018-05-=
22  809  		if (index !=3D 0)
ccc27bf5be7b78 virt/kvm/arm/vgic/vgic-mmio-v3.c   Eric Auger       2018-05-=
22  810  			return -EINVAL;
ccc27bf5be7b78 virt/kvm/arm/vgic/vgic-mmio-v3.c   Eric Auger       2018-05-=
22  811  	} else {
ccc27bf5be7b78 virt/kvm/arm/vgic/vgic-mmio-v3.c   Eric Auger       2018-05-=
22  812  		rdreg =3D list_last_entry(rd_regions,
ccc27bf5be7b78 virt/kvm/arm/vgic/vgic-mmio-v3.c   Eric Auger       2018-05-=
22  813  					struct vgic_redist_region, list);
d9b201e99c6160 arch/arm64/kvm/vgic/vgic-mmio-v3.c Eric Auger       2021-04-=
05  814  =

d9b201e99c6160 arch/arm64/kvm/vgic/vgic-mmio-v3.c Eric Auger       2021-04-=
05  815  		/* Don't mix single region and discrete redist regions */
d9b201e99c6160 arch/arm64/kvm/vgic/vgic-mmio-v3.c Eric Auger       2021-04-=
05  816  		if (!count && rdreg->count)
ccc27bf5be7b78 virt/kvm/arm/vgic/vgic-mmio-v3.c   Eric Auger       2018-05-=
22  817  			return -EINVAL;
ccc27bf5be7b78 virt/kvm/arm/vgic/vgic-mmio-v3.c   Eric Auger       2018-05-=
22  818  =

d9b201e99c6160 arch/arm64/kvm/vgic/vgic-mmio-v3.c Eric Auger       2021-04-=
05  819  		if (!count)
d9b201e99c6160 arch/arm64/kvm/vgic/vgic-mmio-v3.c Eric Auger       2021-04-=
05  820  			return -EEXIST;
d9b201e99c6160 arch/arm64/kvm/vgic/vgic-mmio-v3.c Eric Auger       2021-04-=
05  821  =

d9b201e99c6160 arch/arm64/kvm/vgic/vgic-mmio-v3.c Eric Auger       2021-04-=
05  822  		if (index !=3D rdreg->index + 1)
ccc27bf5be7b78 virt/kvm/arm/vgic/vgic-mmio-v3.c   Eric Auger       2018-05-=
22  823  			return -EINVAL;
ccc27bf5be7b78 virt/kvm/arm/vgic/vgic-mmio-v3.c   Eric Auger       2018-05-=
22  824  	}
ccc27bf5be7b78 virt/kvm/arm/vgic/vgic-mmio-v3.c   Eric Auger       2018-05-=
22  825  =

ccc27bf5be7b78 virt/kvm/arm/vgic/vgic-mmio-v3.c   Eric Auger       2018-05-=
22  826  	/*
ccc27bf5be7b78 virt/kvm/arm/vgic/vgic-mmio-v3.c   Eric Auger       2018-05-=
22  827  	 * For legacy single-region redistributor regions (!count),
ccc27bf5be7b78 virt/kvm/arm/vgic/vgic-mmio-v3.c   Eric Auger       2018-05-=
22  828  	 * check that the redistributor region does not overlap with the
ccc27bf5be7b78 virt/kvm/arm/vgic/vgic-mmio-v3.c   Eric Auger       2018-05-=
22  829  	 * distributor's address space.
ccc27bf5be7b78 virt/kvm/arm/vgic/vgic-mmio-v3.c   Eric Auger       2018-05-=
22  830  	 */
ccc27bf5be7b78 virt/kvm/arm/vgic/vgic-mmio-v3.c   Eric Auger       2018-05-=
22  831  	if (!count && !IS_VGIC_ADDR_UNDEF(d->vgic_dist_base) &&
ccc27bf5be7b78 virt/kvm/arm/vgic/vgic-mmio-v3.c   Eric Auger       2018-05-=
22  832  		vgic_dist_overlap(kvm, base, size))
ccc27bf5be7b78 virt/kvm/arm/vgic/vgic-mmio-v3.c   Eric Auger       2018-05-=
22  833  		return -EINVAL;
ccc27bf5be7b78 virt/kvm/arm/vgic/vgic-mmio-v3.c   Eric Auger       2018-05-=
22  834  =

ccc27bf5be7b78 virt/kvm/arm/vgic/vgic-mmio-v3.c   Eric Auger       2018-05-=
22  835  	/* collision with any other rdist region? */
ccc27bf5be7b78 virt/kvm/arm/vgic/vgic-mmio-v3.c   Eric Auger       2018-05-=
22  836  	if (vgic_v3_rdist_overlap(kvm, base, size))
dbd9733ab6742d virt/kvm/arm/vgic/vgic-mmio-v3.c   Eric Auger       2018-05-=
22  837  		return -EINVAL;
dbd9733ab6742d virt/kvm/arm/vgic/vgic-mmio-v3.c   Eric Auger       2018-05-=
22  838  =

dbd9733ab6742d virt/kvm/arm/vgic/vgic-mmio-v3.c   Eric Auger       2018-05-=
22  839  	rdreg =3D kzalloc(sizeof(*rdreg), GFP_KERNEL);
dbd9733ab6742d virt/kvm/arm/vgic/vgic-mmio-v3.c   Eric Auger       2018-05-=
22  840  	if (!rdreg)
dbd9733ab6742d virt/kvm/arm/vgic/vgic-mmio-v3.c   Eric Auger       2018-05-=
22  841  		return -ENOMEM;
dbd9733ab6742d virt/kvm/arm/vgic/vgic-mmio-v3.c   Eric Auger       2018-05-=
22  842  =

dbd9733ab6742d virt/kvm/arm/vgic/vgic-mmio-v3.c   Eric Auger       2018-05-=
22  843  	rdreg->base =3D VGIC_ADDR_UNDEF;
dbd9733ab6742d virt/kvm/arm/vgic/vgic-mmio-v3.c   Eric Auger       2018-05-=
22  844  =

4612d98f58c73a arch/arm64/kvm/vgic/vgic-mmio-v3.c Ricardo Koller   2021-10-=
04  845  	ret =3D vgic_check_iorange(kvm, rdreg->base, base, SZ_64K, size);
1aab6f468c10a1 virt/kvm/arm/vgic/vgic-mmio-v3.c   Christoffer Dall 2017-05-=
08  846  	if (ret)
ccc27bf5be7b78 virt/kvm/arm/vgic/vgic-mmio-v3.c   Eric Auger       2018-05-=
22  847  		goto free;
1aab6f468c10a1 virt/kvm/arm/vgic/vgic-mmio-v3.c   Christoffer Dall 2017-05-=
08  848  =

ccc27bf5be7b78 virt/kvm/arm/vgic/vgic-mmio-v3.c   Eric Auger       2018-05-=
22  849  	rdreg->base =3D base;
ccc27bf5be7b78 virt/kvm/arm/vgic/vgic-mmio-v3.c   Eric Auger       2018-05-=
22  850  	rdreg->count =3D count;
ccc27bf5be7b78 virt/kvm/arm/vgic/vgic-mmio-v3.c   Eric Auger       2018-05-=
22  851  	rdreg->free_index =3D 0;
ccc27bf5be7b78 virt/kvm/arm/vgic/vgic-mmio-v3.c   Eric Auger       2018-05-=
22  852  	rdreg->index =3D index;
ccc27bf5be7b78 virt/kvm/arm/vgic/vgic-mmio-v3.c   Eric Auger       2018-05-=
22  853  =

ccc27bf5be7b78 virt/kvm/arm/vgic/vgic-mmio-v3.c   Eric Auger       2018-05-=
22  854  	list_add_tail(&rdreg->list, rd_regions);
ccc27bf5be7b78 virt/kvm/arm/vgic/vgic-mmio-v3.c   Eric Auger       2018-05-=
22  855  	return 0;
ccc27bf5be7b78 virt/kvm/arm/vgic/vgic-mmio-v3.c   Eric Auger       2018-05-=
22  856  free:
ccc27bf5be7b78 virt/kvm/arm/vgic/vgic-mmio-v3.c   Eric Auger       2018-05-=
22  857  	kfree(rdreg);
ccc27bf5be7b78 virt/kvm/arm/vgic/vgic-mmio-v3.c   Eric Auger       2018-05-=
22  858  	return ret;
1aab6f468c10a1 virt/kvm/arm/vgic/vgic-mmio-v3.c   Christoffer Dall 2017-05-=
08  859  }
1aab6f468c10a1 virt/kvm/arm/vgic/vgic-mmio-v3.c   Christoffer Dall 2017-05-=
08  860  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5416325129021891903==--

