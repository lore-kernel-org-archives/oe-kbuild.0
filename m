Content-Type: multipart/mixed; boundary="===============8769215718822277505=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/vhost/vdpa.c:677 vhost_vdpa_pa_map() warn: should '(last_pfn - map_pfn + 1) << 12' be a 64 bit type?
Date: Thu, 24 Mar 2022 03:43:31 +0800
Message-ID: <202203240326.PAIO922m-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8769215718822277505==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Xie Yongji <xieyongji@bytedance.com>
CC: "Michael S. Tsirkin" <mst@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   6b1f86f8e9c7f9de7ca1cb987b2cf25e99b1ae3a
commit: 22af48cf91aae5f2fd32fe811d9be1c52d7a801b vdpa: factor out vhost_vdp=
a_pa_map() and vhost_vdpa_pa_unmap()
date:   7 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 7 months ago
config: m68k-randconfig-m031-20220323 (https://download.01.org/0day-ci/arch=
ive/20220324/202203240326.PAIO922m-lkp(a)intel.com/config)
compiler: m68k-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
drivers/vhost/vdpa.c:677 vhost_vdpa_pa_map() warn: should '(last_pfn - map_=
pfn + 1) << 12' be a 64 bit type?
drivers/vhost/vdpa.c:679 vhost_vdpa_pa_map() warn: should 'map_pfn << 12' b=
e a 64 bit type?

Old smatch warnings:
drivers/vhost/vdpa.c:708 vhost_vdpa_pa_map() warn: should '(last_pfn - map_=
pfn + 1) << 12' be a 64 bit type?
drivers/vhost/vdpa.c:709 vhost_vdpa_pa_map() warn: should 'map_pfn << 12' b=
e a 64 bit type?

vim +677 drivers/vhost/vdpa.c

4c8cf31885f69e8 Tiwei Bie          2020-03-26  613  =

22af48cf91aae5f Xie Yongji         2021-08-31  614  static int vhost_vdpa_p=
a_map(struct vhost_vdpa *v,
22af48cf91aae5f Xie Yongji         2021-08-31  615  			     u64 iova, u64 s=
ize, u64 uaddr, u32 perm)
4c8cf31885f69e8 Tiwei Bie          2020-03-26  616  {
4c8cf31885f69e8 Tiwei Bie          2020-03-26  617  	struct vhost_dev *dev =
=3D &v->vdev;
4c8cf31885f69e8 Tiwei Bie          2020-03-26  618  	struct page **page_lis=
t;
5e1a3149eec8675 Michael S. Tsirkin 2020-10-29  619  	unsigned long list_siz=
e =3D PAGE_SIZE / sizeof(struct page *);
4c8cf31885f69e8 Tiwei Bie          2020-03-26  620  	unsigned int gup_flags=
 =3D FOLL_LONGTERM;
5e1a3149eec8675 Michael S. Tsirkin 2020-10-29  621  	unsigned long npages, =
cur_base, map_pfn, last_pfn =3D 0;
ad89653f79f1882 Si-Wei Liu         2020-11-05  622  	unsigned long lock_lim=
it, sz2pin, nchunks, i;
22af48cf91aae5f Xie Yongji         2021-08-31  623  	u64 start =3D iova;
ad89653f79f1882 Si-Wei Liu         2020-11-05  624  	long pinned;
4c8cf31885f69e8 Tiwei Bie          2020-03-26  625  	int ret =3D 0;
4c8cf31885f69e8 Tiwei Bie          2020-03-26  626  =

ad89653f79f1882 Si-Wei Liu         2020-11-05  627  	/* Limit the use of me=
mory for bookkeeping */
5e1a3149eec8675 Michael S. Tsirkin 2020-10-29  628  	page_list =3D (struct =
page **) __get_free_page(GFP_KERNEL);
5e1a3149eec8675 Michael S. Tsirkin 2020-10-29  629  	if (!page_list)
5e1a3149eec8675 Michael S. Tsirkin 2020-10-29  630  		return -ENOMEM;
5e1a3149eec8675 Michael S. Tsirkin 2020-10-29  631  =

22af48cf91aae5f Xie Yongji         2021-08-31  632  	if (perm & VHOST_ACCES=
S_WO)
4c8cf31885f69e8 Tiwei Bie          2020-03-26  633  		gup_flags |=3D FOLL_W=
RITE;
4c8cf31885f69e8 Tiwei Bie          2020-03-26  634  =

22af48cf91aae5f Xie Yongji         2021-08-31  635  	npages =3D PFN_UP(size=
 + (iova & ~PAGE_MASK));
ad89653f79f1882 Si-Wei Liu         2020-11-05  636  	if (!npages) {
ad89653f79f1882 Si-Wei Liu         2020-11-05  637  		ret =3D -EINVAL;
ad89653f79f1882 Si-Wei Liu         2020-11-05  638  		goto free;
ad89653f79f1882 Si-Wei Liu         2020-11-05  639  	}
4c8cf31885f69e8 Tiwei Bie          2020-03-26  640  =

d8ed45c5dcd455f Michel Lespinasse  2020-06-08  641  	mmap_read_lock(dev->mm=
);
4c8cf31885f69e8 Tiwei Bie          2020-03-26  642  =

729ce5a5bd6fda5 Cai Huoqing        2021-08-02  643  	lock_limit =3D PFN_DOW=
N(rlimit(RLIMIT_MEMLOCK));
ad89653f79f1882 Si-Wei Liu         2020-11-05  644  	if (npages + atomic64_=
read(&dev->mm->pinned_vm) > lock_limit) {
4c8cf31885f69e8 Tiwei Bie          2020-03-26  645  		ret =3D -ENOMEM;
ad89653f79f1882 Si-Wei Liu         2020-11-05  646  		goto unlock;
4c8cf31885f69e8 Tiwei Bie          2020-03-26  647  	}
4c8cf31885f69e8 Tiwei Bie          2020-03-26  648  =

22af48cf91aae5f Xie Yongji         2021-08-31  649  	cur_base =3D uaddr & P=
AGE_MASK;
4c8cf31885f69e8 Tiwei Bie          2020-03-26  650  	iova &=3D PAGE_MASK;
ad89653f79f1882 Si-Wei Liu         2020-11-05  651  	nchunks =3D 0;
5e1a3149eec8675 Michael S. Tsirkin 2020-10-29  652  =

5e1a3149eec8675 Michael S. Tsirkin 2020-10-29  653  	while (npages) {
ad89653f79f1882 Si-Wei Liu         2020-11-05  654  		sz2pin =3D min_t(unsi=
gned long, npages, list_size);
ad89653f79f1882 Si-Wei Liu         2020-11-05  655  		pinned =3D pin_user_p=
ages(cur_base, sz2pin,
5e1a3149eec8675 Michael S. Tsirkin 2020-10-29  656  					gup_flags, page_li=
st, NULL);
ad89653f79f1882 Si-Wei Liu         2020-11-05  657  		if (sz2pin !=3D pinne=
d) {
ad89653f79f1882 Si-Wei Liu         2020-11-05  658  			if (pinned < 0) {
ad89653f79f1882 Si-Wei Liu         2020-11-05  659  				ret =3D pinned;
ad89653f79f1882 Si-Wei Liu         2020-11-05  660  			} else {
ad89653f79f1882 Si-Wei Liu         2020-11-05  661  				unpin_user_pages(pa=
ge_list, pinned);
ad89653f79f1882 Si-Wei Liu         2020-11-05  662  				ret =3D -ENOMEM;
ad89653f79f1882 Si-Wei Liu         2020-11-05  663  			}
5e1a3149eec8675 Michael S. Tsirkin 2020-10-29  664  			goto out;
ad89653f79f1882 Si-Wei Liu         2020-11-05  665  		}
ad89653f79f1882 Si-Wei Liu         2020-11-05  666  		nchunks++;
5e1a3149eec8675 Michael S. Tsirkin 2020-10-29  667  =

5e1a3149eec8675 Michael S. Tsirkin 2020-10-29  668  		if (!last_pfn)
4c8cf31885f69e8 Tiwei Bie          2020-03-26  669  			map_pfn =3D page_to_=
pfn(page_list[0]);
4c8cf31885f69e8 Tiwei Bie          2020-03-26  670  =

ad89653f79f1882 Si-Wei Liu         2020-11-05  671  		for (i =3D 0; i < pin=
ned; i++) {
5e1a3149eec8675 Michael S. Tsirkin 2020-10-29  672  			unsigned long this_p=
fn =3D page_to_pfn(page_list[i]);
4c8cf31885f69e8 Tiwei Bie          2020-03-26  673  			u64 csize;
4c8cf31885f69e8 Tiwei Bie          2020-03-26  674  =

5e1a3149eec8675 Michael S. Tsirkin 2020-10-29  675  			if (last_pfn && (thi=
s_pfn !=3D last_pfn + 1)) {
4c8cf31885f69e8 Tiwei Bie          2020-03-26  676  				/* Pin a contiguous=
 chunk of memory */
729ce5a5bd6fda5 Cai Huoqing        2021-08-02 @677  				csize =3D PFN_PHYS(=
last_pfn - map_pfn + 1);
ad89653f79f1882 Si-Wei Liu         2020-11-05  678  				ret =3D vhost_vdpa_=
map(v, iova, csize,
729ce5a5bd6fda5 Cai Huoqing        2021-08-02 @679  						     PFN_PHYS(map=
_pfn),
22af48cf91aae5f Xie Yongji         2021-08-31  680  						     perm);
ad89653f79f1882 Si-Wei Liu         2020-11-05  681  				if (ret) {
ad89653f79f1882 Si-Wei Liu         2020-11-05  682  					/*
ad89653f79f1882 Si-Wei Liu         2020-11-05  683  					 * Unpin the pages=
 that are left unmapped
ad89653f79f1882 Si-Wei Liu         2020-11-05  684  					 * from this point=
 on in the current
ad89653f79f1882 Si-Wei Liu         2020-11-05  685  					 * page_list. The =
remaining outstanding
ad89653f79f1882 Si-Wei Liu         2020-11-05  686  					 * ones which may =
stride across several
ad89653f79f1882 Si-Wei Liu         2020-11-05  687  					 * chunks will be =
covered in the common
ad89653f79f1882 Si-Wei Liu         2020-11-05  688  					 * error path subs=
equently.
ad89653f79f1882 Si-Wei Liu         2020-11-05  689  					 */
ad89653f79f1882 Si-Wei Liu         2020-11-05  690  					unpin_user_pages(&=
page_list[i],
ad89653f79f1882 Si-Wei Liu         2020-11-05  691  							 pinned - i);
4c8cf31885f69e8 Tiwei Bie          2020-03-26  692  					goto out;
ad89653f79f1882 Si-Wei Liu         2020-11-05  693  				}
ad89653f79f1882 Si-Wei Liu         2020-11-05  694  =

4c8cf31885f69e8 Tiwei Bie          2020-03-26  695  				map_pfn =3D this_pf=
n;
5e1a3149eec8675 Michael S. Tsirkin 2020-10-29  696  				iova +=3D csize;
ad89653f79f1882 Si-Wei Liu         2020-11-05  697  				nchunks =3D 0;
4c8cf31885f69e8 Tiwei Bie          2020-03-26  698  			}
5e1a3149eec8675 Michael S. Tsirkin 2020-10-29  699  =

4c8cf31885f69e8 Tiwei Bie          2020-03-26  700  			last_pfn =3D this_pf=
n;
4c8cf31885f69e8 Tiwei Bie          2020-03-26  701  		}
4c8cf31885f69e8 Tiwei Bie          2020-03-26  702  =

729ce5a5bd6fda5 Cai Huoqing        2021-08-02  703  		cur_base +=3D PFN_PHY=
S(pinned);
ad89653f79f1882 Si-Wei Liu         2020-11-05  704  		npages -=3D pinned;
5e1a3149eec8675 Michael S. Tsirkin 2020-10-29  705  	}
5e1a3149eec8675 Michael S. Tsirkin 2020-10-29  706  =

5e1a3149eec8675 Michael S. Tsirkin 2020-10-29  707  	/* Pin the rest chunk =
*/
729ce5a5bd6fda5 Cai Huoqing        2021-08-02  708  	ret =3D vhost_vdpa_map=
(v, iova, PFN_PHYS(last_pfn - map_pfn + 1),
22af48cf91aae5f Xie Yongji         2021-08-31  709  			     PFN_PHYS(map_pf=
n), perm);
4c8cf31885f69e8 Tiwei Bie          2020-03-26  710  out:
5e1a3149eec8675 Michael S. Tsirkin 2020-10-29  711  	if (ret) {
ad89653f79f1882 Si-Wei Liu         2020-11-05  712  		if (nchunks) {
ad89653f79f1882 Si-Wei Liu         2020-11-05  713  			unsigned long pfn;
ad89653f79f1882 Si-Wei Liu         2020-11-05  714  =

ad89653f79f1882 Si-Wei Liu         2020-11-05  715  			/*
ad89653f79f1882 Si-Wei Liu         2020-11-05  716  			 * Unpin the outstan=
ding pages which are yet to be
ad89653f79f1882 Si-Wei Liu         2020-11-05  717  			 * mapped but haven'=
t due to vdpa_map() or
ad89653f79f1882 Si-Wei Liu         2020-11-05  718  			 * pin_user_pages() =
failure.
ad89653f79f1882 Si-Wei Liu         2020-11-05  719  			 *
ad89653f79f1882 Si-Wei Liu         2020-11-05  720  			 * Mapped pages are =
accounted in vdpa_map(), hence
ad89653f79f1882 Si-Wei Liu         2020-11-05  721  			 * the corresponding=
 unpinning will be handled by
ad89653f79f1882 Si-Wei Liu         2020-11-05  722  			 * vdpa_unmap().
ad89653f79f1882 Si-Wei Liu         2020-11-05  723  			 */
ad89653f79f1882 Si-Wei Liu         2020-11-05  724  			WARN_ON(!last_pfn);
ad89653f79f1882 Si-Wei Liu         2020-11-05  725  			for (pfn =3D map_pfn=
; pfn <=3D last_pfn; pfn++)
ad89653f79f1882 Si-Wei Liu         2020-11-05  726  				unpin_user_page(pfn=
_to_page(pfn));
ad89653f79f1882 Si-Wei Liu         2020-11-05  727  		}
22af48cf91aae5f Xie Yongji         2021-08-31  728  		vhost_vdpa_unmap(v, s=
tart, size);
5e1a3149eec8675 Michael S. Tsirkin 2020-10-29  729  	}
ad89653f79f1882 Si-Wei Liu         2020-11-05  730  unlock:
d8ed45c5dcd455f Michel Lespinasse  2020-06-08  731  	mmap_read_unlock(dev->=
mm);
ad89653f79f1882 Si-Wei Liu         2020-11-05  732  free:
5e1a3149eec8675 Michael S. Tsirkin 2020-10-29  733  	free_page((unsigned lo=
ng)page_list);
4c8cf31885f69e8 Tiwei Bie          2020-03-26  734  	return ret;
22af48cf91aae5f Xie Yongji         2021-08-31  735  =


:::::: The code at line 677 was first introduced by commit
:::::: 729ce5a5bd6fda5eb2322a39db2287f1f26f92f3 vdpa: Make use of PFN_PHYS/=
PFN_UP/PFN_DOWN helper macro

:::::: TO: Cai Huoqing <caihuoqing@baidu.com>
:::::: CC: Michael S. Tsirkin <mst@redhat.com>

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8769215718822277505==--

