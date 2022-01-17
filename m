Content-Type: multipart/mixed; boundary="===============2332556965684604669=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/vdpa/vdpa_user/iova_domain.c:305 vduse_domain_alloc_iova() warn: should 'iova_pfn << shift' be a 64 bit type?
Date: Mon, 17 Jan 2022 14:13:20 +0800
Message-ID: <202201171409.rqbXNHlz-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============2332556965684604669==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Xie Yongji <xieyongji@bytedance.com>
CC: "Michael S. Tsirkin" <mst@redhat.com>

Hi Xie,

First bad commit (maybe !=3D root cause):

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   79e06c4c4950be2abd8ca5d2428a8c915aa62c24
commit: c8a6153b6c59d95c0e091f053f6f180952ade91e vduse: Introduce VDUSE - v=
DPA Device in Userspace
date:   4 months ago
:::::: branch date: 16 hours ago
:::::: commit date: 4 months ago
config: arm-randconfig-m031-20220116 (https://download.01.org/0day-ci/archi=
ve/20220117/202201171409.rqbXNHlz-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/vdpa/vdpa_user/iova_domain.c:305 vduse_domain_alloc_iova() warn: sh=
ould 'iova_pfn << shift' be a 64 bit type?

vim +305 drivers/vdpa/vdpa_user/iova_domain.c

8c773d53fb7b64 Xie Yongji 2021-08-31  286  =

8c773d53fb7b64 Xie Yongji 2021-08-31  287  static dma_addr_t
8c773d53fb7b64 Xie Yongji 2021-08-31  288  vduse_domain_alloc_iova(struct i=
ova_domain *iovad,
8c773d53fb7b64 Xie Yongji 2021-08-31  289  			unsigned long size, unsigned =
long limit)
8c773d53fb7b64 Xie Yongji 2021-08-31  290  {
8c773d53fb7b64 Xie Yongji 2021-08-31  291  	unsigned long shift =3D iova_sh=
ift(iovad);
8c773d53fb7b64 Xie Yongji 2021-08-31  292  	unsigned long iova_len =3D iova=
_align(iovad, size) >> shift;
8c773d53fb7b64 Xie Yongji 2021-08-31  293  	unsigned long iova_pfn;
8c773d53fb7b64 Xie Yongji 2021-08-31  294  =

8c773d53fb7b64 Xie Yongji 2021-08-31  295  	/*
8c773d53fb7b64 Xie Yongji 2021-08-31  296  	 * Freeing non-power-of-two-siz=
ed allocations back into the IOVA caches
8c773d53fb7b64 Xie Yongji 2021-08-31  297  	 * will come back to bite us ba=
dly, so we have to waste a bit of space
8c773d53fb7b64 Xie Yongji 2021-08-31  298  	 * rounding up anything cacheab=
le to make sure that can't happen. The
8c773d53fb7b64 Xie Yongji 2021-08-31  299  	 * order of the unadjusted size=
 will still match upon freeing.
8c773d53fb7b64 Xie Yongji 2021-08-31  300  	 */
8c773d53fb7b64 Xie Yongji 2021-08-31  301  	if (iova_len < (1 << (IOVA_RANG=
E_CACHE_MAX_SIZE - 1)))
8c773d53fb7b64 Xie Yongji 2021-08-31  302  		iova_len =3D roundup_pow_of_tw=
o(iova_len);
8c773d53fb7b64 Xie Yongji 2021-08-31  303  	iova_pfn =3D alloc_iova_fast(io=
vad, iova_len, limit >> shift, true);
8c773d53fb7b64 Xie Yongji 2021-08-31  304  =

8c773d53fb7b64 Xie Yongji 2021-08-31 @305  	return iova_pfn << shift;
8c773d53fb7b64 Xie Yongji 2021-08-31  306  }
8c773d53fb7b64 Xie Yongji 2021-08-31  307  =


:::::: The code@line 305 was first introduced by commit
:::::: 8c773d53fb7b64267b0f55c1d3517cb8c5e29b3c vduse: Implement an MMU-bas=
ed software IOTLB

:::::: TO: Xie Yongji <xieyongji@bytedance.com>
:::::: CC: Michael S. Tsirkin <mst@redhat.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============2332556965684604669==--

