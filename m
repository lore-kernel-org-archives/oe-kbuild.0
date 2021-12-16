Content-Type: multipart/mixed; boundary="===============7388513797696400327=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/vdpa/vdpa_user/iova_domain.c:305 vduse_domain_alloc_iova() warn: should 'iova_pfn << shift' be a 64 bit type?
Date: Fri, 17 Dec 2021 02:11:01 +0800
Message-ID: <202112170217.0LXGLvEY-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7388513797696400327==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Xie Yongji <xieyongji@bytedance.com>
CC: "Michael S. Tsirkin" <mst@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   2b14864acbaaf03d9c01982e243a84632524c3ac
commit: c8a6153b6c59d95c0e091f053f6f180952ade91e vduse: Introduce VDUSE - v=
DPA Device in Userspace
date:   3 months ago
:::::: branch date: 23 hours ago
:::::: commit date: 3 months ago
config: i386-randconfig-m021-20211216 (https://download.01.org/0day-ci/arch=
ive/20211217/202112170217.0LXGLvEY-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/vdpa/vdpa_user/iova_domain.c:305 vduse_domain_alloc_iova() warn: sh=
ould 'iova_pfn << shift' be a 64 bit type?

vim +305 drivers/vdpa/vdpa_user/iova_domain.c

8c773d53fb7b642 Xie Yongji 2021-08-31  286  =

8c773d53fb7b642 Xie Yongji 2021-08-31  287  static dma_addr_t
8c773d53fb7b642 Xie Yongji 2021-08-31  288  vduse_domain_alloc_iova(struct =
iova_domain *iovad,
8c773d53fb7b642 Xie Yongji 2021-08-31  289  			unsigned long size, unsigned=
 long limit)
8c773d53fb7b642 Xie Yongji 2021-08-31  290  {
8c773d53fb7b642 Xie Yongji 2021-08-31  291  	unsigned long shift =3D iova_s=
hift(iovad);
8c773d53fb7b642 Xie Yongji 2021-08-31  292  	unsigned long iova_len =3D iov=
a_align(iovad, size) >> shift;
8c773d53fb7b642 Xie Yongji 2021-08-31  293  	unsigned long iova_pfn;
8c773d53fb7b642 Xie Yongji 2021-08-31  294  =

8c773d53fb7b642 Xie Yongji 2021-08-31  295  	/*
8c773d53fb7b642 Xie Yongji 2021-08-31  296  	 * Freeing non-power-of-two-si=
zed allocations back into the IOVA caches
8c773d53fb7b642 Xie Yongji 2021-08-31  297  	 * will come back to bite us b=
adly, so we have to waste a bit of space
8c773d53fb7b642 Xie Yongji 2021-08-31  298  	 * rounding up anything cachea=
ble to make sure that can't happen. The
8c773d53fb7b642 Xie Yongji 2021-08-31  299  	 * order of the unadjusted siz=
e will still match upon freeing.
8c773d53fb7b642 Xie Yongji 2021-08-31  300  	 */
8c773d53fb7b642 Xie Yongji 2021-08-31  301  	if (iova_len < (1 << (IOVA_RAN=
GE_CACHE_MAX_SIZE - 1)))
8c773d53fb7b642 Xie Yongji 2021-08-31  302  		iova_len =3D roundup_pow_of_t=
wo(iova_len);
8c773d53fb7b642 Xie Yongji 2021-08-31  303  	iova_pfn =3D alloc_iova_fast(i=
ovad, iova_len, limit >> shift, true);
8c773d53fb7b642 Xie Yongji 2021-08-31  304  =

8c773d53fb7b642 Xie Yongji 2021-08-31 @305  	return iova_pfn << shift;
8c773d53fb7b642 Xie Yongji 2021-08-31  306  }
8c773d53fb7b642 Xie Yongji 2021-08-31  307  =


:::::: The code@line 305 was first introduced by commit
:::::: 8c773d53fb7b64267b0f55c1d3517cb8c5e29b3c vduse: Implement an MMU-bas=
ed software IOTLB

:::::: TO: Xie Yongji <xieyongji@bytedance.com>
:::::: CC: Michael S. Tsirkin <mst@redhat.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7388513797696400327==--

