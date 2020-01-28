Content-Type: multipart/mixed; boundary="===============1154310624915608288=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH 5/5] vdpasim: vDPA device simulator
Date: Tue, 28 Jan 2020 06:32:15 +0300
Message-ID: <20200128033215.GO1870@kadam>
In-Reply-To: <20200116124231.20253-6-jasowang@redhat.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1154310624915608288==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Jason,

url:    https://github.com/0day-ci/linux/commits/Jason-Wang/vDPA-support/20=
200117-170243
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mst/vhost.git linux=
-next

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/virtio/vdpa/vdpa_sim.c:288 vdpasim_alloc_coherent() warn: returning=
 freed memory 'addr'

# https://github.com/0day-ci/linux/commit/55047769b3e974d68b2aab5ce0022459b=
172a23f
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout 55047769b3e974d68b2aab5ce0022459b172a23f
vim +/addr +288 drivers/virtio/vdpa/vdpa_sim.c

55047769b3e974 Jason Wang 2020-01-16  263  static void *vdpasim_alloc_coher=
ent(struct device *dev, size_t size,
55047769b3e974 Jason Wang 2020-01-16  264  				    dma_addr_t *dma_addr, gf=
p_t flag,
55047769b3e974 Jason Wang 2020-01-16  265  				    unsigned long attrs)
55047769b3e974 Jason Wang 2020-01-16  266  {
55047769b3e974 Jason Wang 2020-01-16  267  	struct vdpa_device *vdpa =3D de=
v_to_vdpa(dev);
55047769b3e974 Jason Wang 2020-01-16  268  	struct vdpasim *vdpasim =3D vdp=
a_to_sim(vdpa);
55047769b3e974 Jason Wang 2020-01-16  269  	struct vhost_iotlb *iommu =3D v=
dpasim->iommu;
55047769b3e974 Jason Wang 2020-01-16  270  	void *addr =3D kmalloc(size, fl=
ag);
55047769b3e974 Jason Wang 2020-01-16  271  	int ret;
55047769b3e974 Jason Wang 2020-01-16  272  =

55047769b3e974 Jason Wang 2020-01-16  273  	if (!addr)
55047769b3e974 Jason Wang 2020-01-16  274  		*dma_addr =3D DMA_MAPPING_ERRO=
R;
55047769b3e974 Jason Wang 2020-01-16  275  	else {
55047769b3e974 Jason Wang 2020-01-16  276  		u64 pa =3D virt_to_phys(addr);
55047769b3e974 Jason Wang 2020-01-16  277  =

55047769b3e974 Jason Wang 2020-01-16  278  		ret =3D vhost_iotlb_add_range(=
iommu, (u64)pa,
55047769b3e974 Jason Wang 2020-01-16  279  					    (u64)pa + size - 1,
55047769b3e974 Jason Wang 2020-01-16  280  					    pa, VHOST_MAP_RW);
55047769b3e974 Jason Wang 2020-01-16  281  		if (ret) {
55047769b3e974 Jason Wang 2020-01-16  282  			kfree(addr);
                                                                ^^^^^^^^^^^
55047769b3e974 Jason Wang 2020-01-16  283  			*dma_addr =3D DMA_MAPPING_ERR=
OR;
55047769b3e974 Jason Wang 2020-01-16  284  		} else
55047769b3e974 Jason Wang 2020-01-16  285  			*dma_addr =3D (dma_addr_t)pa;
55047769b3e974 Jason Wang 2020-01-16  286  	}
55047769b3e974 Jason Wang 2020-01-16  287  =

55047769b3e974 Jason Wang 2020-01-16 @288  	return addr;
                                                ^^^^^^^^^^^^
55047769b3e974 Jason Wang 2020-01-16  289  }

---
0-DAY kernel test infrastructure                 Open Source Technology Cen=
ter
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org Intel Corpor=
ation
--===============1154310624915608288==--

