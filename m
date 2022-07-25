Content-Type: multipart/mixed; boundary="===============8295360175611773343=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH v3 4/5] vduse: Support registering userspace memory for IOVA regions
Date: Mon, 25 Jul 2022 16:58:21 +0000
Message-ID: <202207241607.U3jN5m08-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8295360175611773343==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220720044144.90-5-xieyongji@bytedance.com>
References: <20220720044144.90-5-xieyongji@bytedance.com>
TO: Xie Yongji <xieyongji@bytedance.com>
TO: mst(a)redhat.com
TO: jasowang(a)redhat.com
TO: xiaodong.liu(a)intel.com
TO: maxime.coquelin(a)redhat.com
TO: stefanha(a)redhat.com
CC: songmuchun(a)bytedance.com
CC: virtualization(a)lists.linux-foundation.org
CC: linux-kernel(a)vger.kernel.org

Hi Xie,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on linus/master]
[also build test WARNING on v5.19-rc7 next-20220722]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Xie-Yongji/VDUSE-Sup=
port-registering-userspace-memory-as-bounce-buffer/20220720-124408
base:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
ca85855bdcae8f84f1512e88b4c75009ea17ea2f
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: ia64-randconfig-m041-20220721 (https://download.01.org/0day-ci/arch=
ive/20220724/202207241607.U3jN5m08-lkp(a)intel.com/config)
compiler: ia64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/vdpa/vdpa_user/vduse_dev.c:1024 vduse_dev_reg_umem() warn: possible=
 memory leak of 'umem'

vim +/umem +1024 drivers/vdpa/vdpa_user/vduse_dev.c

adfe5defa068df Xie Yongji 2022-07-20   958  =

adfe5defa068df Xie Yongji 2022-07-20   959  static int vduse_dev_reg_umem(s=
truct vduse_dev *dev,
adfe5defa068df Xie Yongji 2022-07-20   960  			      u64 iova, u64 uaddr, u=
64 size)
adfe5defa068df Xie Yongji 2022-07-20   961  {
adfe5defa068df Xie Yongji 2022-07-20   962  	struct page **page_list =3D NU=
LL;
adfe5defa068df Xie Yongji 2022-07-20   963  	struct vduse_umem *umem =3D NU=
LL;
adfe5defa068df Xie Yongji 2022-07-20   964  	long pinned =3D 0;
adfe5defa068df Xie Yongji 2022-07-20   965  	unsigned long npages, lock_lim=
it;
adfe5defa068df Xie Yongji 2022-07-20   966  	int ret;
adfe5defa068df Xie Yongji 2022-07-20   967  =

adfe5defa068df Xie Yongji 2022-07-20   968  	if (!dev->domain->bounce_map ||
adfe5defa068df Xie Yongji 2022-07-20   969  	    size !=3D dev->domain->bou=
nce_size ||
adfe5defa068df Xie Yongji 2022-07-20   970  	    iova !=3D 0 || uaddr & ~PA=
GE_MASK)
adfe5defa068df Xie Yongji 2022-07-20   971  		return -EINVAL;
adfe5defa068df Xie Yongji 2022-07-20   972  =

adfe5defa068df Xie Yongji 2022-07-20   973  	mutex_lock(&dev->mem_lock);
adfe5defa068df Xie Yongji 2022-07-20   974  	ret =3D -EEXIST;
adfe5defa068df Xie Yongji 2022-07-20   975  	if (dev->umem)
adfe5defa068df Xie Yongji 2022-07-20   976  		goto unlock;
adfe5defa068df Xie Yongji 2022-07-20   977  =

adfe5defa068df Xie Yongji 2022-07-20   978  	ret =3D -ENOMEM;
adfe5defa068df Xie Yongji 2022-07-20   979  	npages =3D size >> PAGE_SHIFT;
adfe5defa068df Xie Yongji 2022-07-20   980  	page_list =3D __vmalloc(array_=
size(npages, sizeof(struct page *)),
adfe5defa068df Xie Yongji 2022-07-20   981  			      GFP_KERNEL_ACCOUNT);
adfe5defa068df Xie Yongji 2022-07-20   982  	umem =3D kzalloc(sizeof(*umem)=
, GFP_KERNEL);
adfe5defa068df Xie Yongji 2022-07-20   983  	if (!page_list || !umem)
adfe5defa068df Xie Yongji 2022-07-20   984  		goto unlock;
adfe5defa068df Xie Yongji 2022-07-20   985  =

adfe5defa068df Xie Yongji 2022-07-20   986  	mmap_read_lock(current->mm);
adfe5defa068df Xie Yongji 2022-07-20   987  =

adfe5defa068df Xie Yongji 2022-07-20   988  	lock_limit =3D PFN_DOWN(rlimit=
(RLIMIT_MEMLOCK));
adfe5defa068df Xie Yongji 2022-07-20   989  	if (npages + atomic64_read(&cu=
rrent->mm->pinned_vm) > lock_limit)
adfe5defa068df Xie Yongji 2022-07-20   990  		goto out;
adfe5defa068df Xie Yongji 2022-07-20   991  =

adfe5defa068df Xie Yongji 2022-07-20   992  	pinned =3D pin_user_pages(uadd=
r, npages, FOLL_LONGTERM | FOLL_WRITE,
adfe5defa068df Xie Yongji 2022-07-20   993  				page_list, NULL);
adfe5defa068df Xie Yongji 2022-07-20   994  	if (pinned !=3D npages) {
adfe5defa068df Xie Yongji 2022-07-20   995  		ret =3D pinned < 0 ? pinned :=
 -ENOMEM;
adfe5defa068df Xie Yongji 2022-07-20   996  		goto out;
adfe5defa068df Xie Yongji 2022-07-20   997  	}
adfe5defa068df Xie Yongji 2022-07-20   998  =

adfe5defa068df Xie Yongji 2022-07-20   999  	ret =3D vduse_domain_add_user_=
bounce_pages(dev->domain,
adfe5defa068df Xie Yongji 2022-07-20  1000  						 page_list, pinned);
adfe5defa068df Xie Yongji 2022-07-20  1001  	if (ret)
adfe5defa068df Xie Yongji 2022-07-20  1002  		goto out;
adfe5defa068df Xie Yongji 2022-07-20  1003  =

adfe5defa068df Xie Yongji 2022-07-20  1004  	atomic64_add(npages, &current-=
>mm->pinned_vm);
adfe5defa068df Xie Yongji 2022-07-20  1005  =

adfe5defa068df Xie Yongji 2022-07-20  1006  	umem->pages =3D page_list;
adfe5defa068df Xie Yongji 2022-07-20  1007  	umem->npages =3D pinned;
adfe5defa068df Xie Yongji 2022-07-20  1008  	umem->iova =3D iova;
adfe5defa068df Xie Yongji 2022-07-20  1009  	umem->mm =3D current->mm;
adfe5defa068df Xie Yongji 2022-07-20  1010  	mmgrab(current->mm);
adfe5defa068df Xie Yongji 2022-07-20  1011  =

adfe5defa068df Xie Yongji 2022-07-20  1012  	dev->umem =3D umem;
adfe5defa068df Xie Yongji 2022-07-20  1013  out:
adfe5defa068df Xie Yongji 2022-07-20  1014  	if (ret && pinned > 0)
adfe5defa068df Xie Yongji 2022-07-20  1015  		unpin_user_pages(page_list, p=
inned);
adfe5defa068df Xie Yongji 2022-07-20  1016  =

adfe5defa068df Xie Yongji 2022-07-20  1017  	mmap_read_unlock(current->mm);
adfe5defa068df Xie Yongji 2022-07-20  1018  unlock:
adfe5defa068df Xie Yongji 2022-07-20  1019  	if (ret) {
adfe5defa068df Xie Yongji 2022-07-20  1020  		vfree(page_list);
adfe5defa068df Xie Yongji 2022-07-20  1021  		kfree(umem);
adfe5defa068df Xie Yongji 2022-07-20  1022  	}
adfe5defa068df Xie Yongji 2022-07-20  1023  	mutex_unlock(&dev->mem_lock);
adfe5defa068df Xie Yongji 2022-07-20 @1024  	return ret;
adfe5defa068df Xie Yongji 2022-07-20  1025  }
adfe5defa068df Xie Yongji 2022-07-20  1026  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8295360175611773343==--

