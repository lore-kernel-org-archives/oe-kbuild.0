Content-Type: multipart/mixed; boundary="===============8946045826503281572=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH Kernel v18 5/7] vfio iommu: Update UNMAP_DMA ioctl to get dirty bitmap before unmap
Date: Wed, 06 May 2020 02:49:29 +0800
Message-ID: <202005060216.4Tk3rSPm%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8946045826503281572==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <1588607939-26441-6-git-send-email-kwankhede@nvidia.com>
References: <1588607939-26441-6-git-send-email-kwankhede@nvidia.com>
TO: Kirti Wankhede <kwankhede@nvidia.com>
TO: alex.williamson(a)redhat.com
TO: cjia(a)nvidia.com
CC: kevin.tian(a)intel.com
CC: ziye.yang(a)intel.com
CC: changpeng.liu(a)intel.com
CC: yi.l.liu(a)intel.com
CC: mlevitsk(a)redhat.com
CC: eskultet(a)redhat.com
CC: cohuck(a)redhat.com
CC: dgilbert(a)redhat.com
CC: jonathan.davies(a)nutanix.com

Hi Kirti,

I love your patch! Perhaps something to improve:

[auto build test WARNING on v5.7-rc4]
[also build test WARNING on next-20200505]
[cannot apply to vfio/next]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Kirti-Wankhede/KABIs-to-su=
pport-migration-for-VFIO-devices/20200505-084649
base:    0e698dfa282211e414076f9dc7e83c1c288314fd
reproduce:
        # apt-get install sparse
        # sparse version: =

        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'
:::::: branch date: 18 hours ago
:::::: commit date: 18 hours ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

   drivers/vfio/vfio_iommu_type1.c:1087:58: sparse: warning: incorrect type=
 in argument 5 (different address spaces)
>> drivers/vfio/vfio_iommu_type1.c:1087:58: sparse:    expected unsigned lo=
ng long [noderef] [usertype] <asn:1> *bitmap
>> drivers/vfio/vfio_iommu_type1.c:1087:58: sparse:    got unsigned long lo=
ng [usertype] *

# https://github.com/0day-ci/linux/commit/5935872fe363ec9158528a84142d4f3c9=
3da8383
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout 5935872fe363ec9158528a84142d4f3c93da8383
vim +1087 drivers/vfio/vfio_iommu_type1.c

352e6a6499fe9c Kirti Wankhede  2020-05-04   984  =

73fa0d10d077d9 Alex Williamson 2012-07-31   985  static int vfio_dma_do_unm=
ap(struct vfio_iommu *iommu,
5935872fe363ec Kirti Wankhede  2020-05-04   986  			     struct vfio_iommu_=
type1_dma_unmap *unmap,
5935872fe363ec Kirti Wankhede  2020-05-04   987  			     struct vfio_bitmap=
 *bitmap)
73fa0d10d077d9 Alex Williamson 2012-07-31   988  {
73fa0d10d077d9 Alex Williamson 2012-07-31   989  	uint64_t mask;
c086de818dd81c Kirti Wankhede  2016-11-17   990  	struct vfio_dma *dma, *dm=
a_last =3D NULL;
1ef3e2bc04223f Alex Williamson 2014-02-26   991  	size_t unmapped =3D 0;
c086de818dd81c Kirti Wankhede  2016-11-17   992  	int ret =3D 0, retries =
=3D 0;
5935872fe363ec Kirti Wankhede  2020-05-04   993  	unsigned long *final_bitm=
ap =3D NULL, *temp_bitmap =3D NULL;
73fa0d10d077d9 Alex Williamson 2012-07-31   994  =

1ef3e2bc04223f Alex Williamson 2014-02-26   995  	mask =3D ((uint64_t)1 << =
__ffs(vfio_pgsize_bitmap(iommu))) - 1;
73fa0d10d077d9 Alex Williamson 2012-07-31   996  =

73fa0d10d077d9 Alex Williamson 2012-07-31   997  	if (unmap->iova & mask)
73fa0d10d077d9 Alex Williamson 2012-07-31   998  		return -EINVAL;
f5bfdbf252ad54 Alex Williamson 2013-06-25   999  	if (!unmap->size || unmap=
->size & mask)
73fa0d10d077d9 Alex Williamson 2012-07-31  1000  		return -EINVAL;
58fec830fc1920 Alex Williamson 2019-01-07  1001  	if (unmap->iova + unmap->=
size - 1 < unmap->iova ||
71a7d3d78e3ca5 Dan Carpenter   2017-10-20  1002  	    unmap->size > SIZE_MA=
X)
71a7d3d78e3ca5 Dan Carpenter   2017-10-20  1003  		return -EINVAL;
73fa0d10d077d9 Alex Williamson 2012-07-31  1004  =

73fa0d10d077d9 Alex Williamson 2012-07-31  1005  	WARN_ON(mask & PAGE_MASK);
c086de818dd81c Kirti Wankhede  2016-11-17  1006  again:
73fa0d10d077d9 Alex Williamson 2012-07-31  1007  	mutex_lock(&iommu->lock);
73fa0d10d077d9 Alex Williamson 2012-07-31  1008  =

1ef3e2bc04223f Alex Williamson 2014-02-26  1009  	/*
1ef3e2bc04223f Alex Williamson 2014-02-26  1010  	 * vfio-iommu-type1 (v1) =
- User mappings were coalesced together to
1ef3e2bc04223f Alex Williamson 2014-02-26  1011  	 * avoid tracking individ=
ual mappings.  This means that the granularity
1ef3e2bc04223f Alex Williamson 2014-02-26  1012  	 * of the original mappin=
g was lost and the user was allowed to attempt
1ef3e2bc04223f Alex Williamson 2014-02-26  1013  	 * to unmap any range.  D=
epending on the contiguousness of physical
1ef3e2bc04223f Alex Williamson 2014-02-26  1014  	 * memory and page sizes =
supported by the IOMMU, arbitrary unmaps may
1ef3e2bc04223f Alex Williamson 2014-02-26  1015  	 * or may not have worked=
.  We only guaranteed unmap granularity
1ef3e2bc04223f Alex Williamson 2014-02-26  1016  	 * matching the original =
mapping; even though it was untracked here,
1ef3e2bc04223f Alex Williamson 2014-02-26  1017  	 * the original mappings =
are reflected in IOMMU mappings.  This
1ef3e2bc04223f Alex Williamson 2014-02-26  1018  	 * resulted in a couple u=
nusual behaviors.  First, if a range is not
1ef3e2bc04223f Alex Williamson 2014-02-26  1019  	 * able to be unmapped, e=
x. a set of 4k pages that was mapped as a
1ef3e2bc04223f Alex Williamson 2014-02-26  1020  	 * 2M hugepage into the I=
OMMU, the unmap ioctl returns success but with
1ef3e2bc04223f Alex Williamson 2014-02-26  1021  	 * a zero sized unmap.  A=
lso, if an unmap request overlaps the first
1ef3e2bc04223f Alex Williamson 2014-02-26  1022  	 * address of a hugepage,=
 the IOMMU will unmap the entire hugepage.
1ef3e2bc04223f Alex Williamson 2014-02-26  1023  	 * This also returns succ=
ess and the returned unmap size reflects the
1ef3e2bc04223f Alex Williamson 2014-02-26  1024  	 * actual size unmapped.
1ef3e2bc04223f Alex Williamson 2014-02-26  1025  	 *
1ef3e2bc04223f Alex Williamson 2014-02-26  1026  	 * We attempt to maintain=
 compatibility with this "v1" interface, but
1ef3e2bc04223f Alex Williamson 2014-02-26  1027  	 * we take control out of=
 the hands of the IOMMU.  Therefore, an unmap
1ef3e2bc04223f Alex Williamson 2014-02-26  1028  	 * request offset from th=
e beginning of the original mapping will
1ef3e2bc04223f Alex Williamson 2014-02-26  1029  	 * return success with ze=
ro sized unmap.  And an unmap request covering
1ef3e2bc04223f Alex Williamson 2014-02-26  1030  	 * the first iova of mapp=
ing will unmap the entire range.
1ef3e2bc04223f Alex Williamson 2014-02-26  1031  	 *
1ef3e2bc04223f Alex Williamson 2014-02-26  1032  	 * The v2 version of this=
 interface intends to be more deterministic.
1ef3e2bc04223f Alex Williamson 2014-02-26  1033  	 * Unmap requests must fu=
lly cover previous mappings.  Multiple
1ef3e2bc04223f Alex Williamson 2014-02-26  1034  	 * mappings may still be =
unmaped by specifying large ranges, but there
1ef3e2bc04223f Alex Williamson 2014-02-26  1035  	 * must not be any previo=
us mappings bisected by the range.  An error
1ef3e2bc04223f Alex Williamson 2014-02-26  1036  	 * will be returned if th=
ese conditions are not met.  The v2 interface
1ef3e2bc04223f Alex Williamson 2014-02-26  1037  	 * will only return succe=
ss and a size of zero if there were no
1ef3e2bc04223f Alex Williamson 2014-02-26  1038  	 * mappings within the ra=
nge.
1ef3e2bc04223f Alex Williamson 2014-02-26  1039  	 */
1ef3e2bc04223f Alex Williamson 2014-02-26  1040  	if (iommu->v2) {
7c03f428464333 Kirti Wankhede  2016-12-06  1041  		dma =3D vfio_find_dma(io=
mmu, unmap->iova, 1);
1ef3e2bc04223f Alex Williamson 2014-02-26  1042  		if (dma && dma->iova !=
=3D unmap->iova) {
1ef3e2bc04223f Alex Williamson 2014-02-26  1043  			ret =3D -EINVAL;
1ef3e2bc04223f Alex Williamson 2014-02-26  1044  			goto unlock;
1ef3e2bc04223f Alex Williamson 2014-02-26  1045  		}
5935872fe363ec Kirti Wankhede  2020-05-04  1046  =

1ef3e2bc04223f Alex Williamson 2014-02-26  1047  		dma =3D vfio_find_dma(io=
mmu, unmap->iova + unmap->size - 1, 0);
1ef3e2bc04223f Alex Williamson 2014-02-26  1048  		if (dma && dma->iova + d=
ma->size !=3D unmap->iova + unmap->size) {
1ef3e2bc04223f Alex Williamson 2014-02-26  1049  			ret =3D -EINVAL;
1ef3e2bc04223f Alex Williamson 2014-02-26  1050  			goto unlock;
1ef3e2bc04223f Alex Williamson 2014-02-26  1051  		}
1ef3e2bc04223f Alex Williamson 2014-02-26  1052  	}
1ef3e2bc04223f Alex Williamson 2014-02-26  1053  =

5935872fe363ec Kirti Wankhede  2020-05-04  1054  	if ((unmap->flags & VFIO_=
DMA_UNMAP_FLAG_GET_DIRTY_BITMAP) &&
5935872fe363ec Kirti Wankhede  2020-05-04  1055  	     iommu->dirty_page_tr=
acking) {
5935872fe363ec Kirti Wankhede  2020-05-04  1056  		final_bitmap =3D kvzallo=
c(bitmap->size, GFP_KERNEL);
5935872fe363ec Kirti Wankhede  2020-05-04  1057  		if (!final_bitmap) {
5935872fe363ec Kirti Wankhede  2020-05-04  1058  			ret =3D -ENOMEM;
5935872fe363ec Kirti Wankhede  2020-05-04  1059  			goto unlock;
5935872fe363ec Kirti Wankhede  2020-05-04  1060  		}
5935872fe363ec Kirti Wankhede  2020-05-04  1061  =

5935872fe363ec Kirti Wankhede  2020-05-04  1062  		temp_bitmap =3D kvzalloc=
(bitmap->size, GFP_KERNEL);
5935872fe363ec Kirti Wankhede  2020-05-04  1063  		if (!temp_bitmap) {
5935872fe363ec Kirti Wankhede  2020-05-04  1064  			ret =3D -ENOMEM;
5935872fe363ec Kirti Wankhede  2020-05-04  1065  			kfree(final_bitmap);
5935872fe363ec Kirti Wankhede  2020-05-04  1066  			goto unlock;
5935872fe363ec Kirti Wankhede  2020-05-04  1067  		}
5935872fe363ec Kirti Wankhede  2020-05-04  1068  	}
5935872fe363ec Kirti Wankhede  2020-05-04  1069  =

166fd7d94afdac Alex Williamson 2013-06-21  1070  	while ((dma =3D vfio_find=
_dma(iommu, unmap->iova, unmap->size))) {
1ef3e2bc04223f Alex Williamson 2014-02-26  1071  		if (!iommu->v2 && unmap-=
>iova > dma->iova)
166fd7d94afdac Alex Williamson 2013-06-21  1072  			break;
8f0d5bb95f763c Kirti Wankhede  2016-11-17  1073  		/*
8f0d5bb95f763c Kirti Wankhede  2016-11-17  1074  		 * Task with same addres=
s space who mapped this iova range is
8f0d5bb95f763c Kirti Wankhede  2016-11-17  1075  		 * allowed to unmap the =
iova range.
8f0d5bb95f763c Kirti Wankhede  2016-11-17  1076  		 */
8f0d5bb95f763c Kirti Wankhede  2016-11-17  1077  		if (dma->task->mm !=3D c=
urrent->mm)
8f0d5bb95f763c Kirti Wankhede  2016-11-17  1078  			break;
c086de818dd81c Kirti Wankhede  2016-11-17  1079  =

5935872fe363ec Kirti Wankhede  2020-05-04  1080  		if ((unmap->flags & VFIO=
_DMA_UNMAP_FLAG_GET_DIRTY_BITMAP) &&
5935872fe363ec Kirti Wankhede  2020-05-04  1081  		     iommu->dirty_page_t=
racking) {
5935872fe363ec Kirti Wankhede  2020-05-04  1082  			unsigned long pgshift =
=3D __ffs(bitmap->pgsize);
5935872fe363ec Kirti Wankhede  2020-05-04  1083  			unsigned int npages =3D=
 dma->size >> pgshift;
5935872fe363ec Kirti Wankhede  2020-05-04  1084  			unsigned int shift;
5935872fe363ec Kirti Wankhede  2020-05-04  1085  =

5935872fe363ec Kirti Wankhede  2020-05-04  1086  			vfio_iova_dirty_bitmap(=
iommu, dma->iova, dma->size,
5935872fe363ec Kirti Wankhede  2020-05-04 @1087  					bitmap->pgsize, (u64 =
*)temp_bitmap);
5935872fe363ec Kirti Wankhede  2020-05-04  1088  =

5935872fe363ec Kirti Wankhede  2020-05-04  1089  			shift =3D (dma->iova - =
unmap->iova) >> pgshift;
5935872fe363ec Kirti Wankhede  2020-05-04  1090  			if (shift)
5935872fe363ec Kirti Wankhede  2020-05-04  1091  				bitmap_shift_left(temp=
_bitmap, temp_bitmap,
5935872fe363ec Kirti Wankhede  2020-05-04  1092  						  shift, npages);
5935872fe363ec Kirti Wankhede  2020-05-04  1093  			bitmap_or(final_bitmap,=
 final_bitmap, temp_bitmap,
5935872fe363ec Kirti Wankhede  2020-05-04  1094  				  shift + npages);
5935872fe363ec Kirti Wankhede  2020-05-04  1095  			memset(temp_bitmap, 0, =
bitmap->size);
5935872fe363ec Kirti Wankhede  2020-05-04  1096  		}
5935872fe363ec Kirti Wankhede  2020-05-04  1097  =

c086de818dd81c Kirti Wankhede  2016-11-17  1098  		if (!RB_EMPTY_ROOT(&dma-=
>pfn_list)) {
c086de818dd81c Kirti Wankhede  2016-11-17  1099  			struct vfio_iommu_type1=
_dma_unmap nb_unmap;
c086de818dd81c Kirti Wankhede  2016-11-17  1100  =

c086de818dd81c Kirti Wankhede  2016-11-17  1101  			if (dma_last =3D=3D dma=
) {
c086de818dd81c Kirti Wankhede  2016-11-17  1102  				BUG_ON(++retries > 10);
c086de818dd81c Kirti Wankhede  2016-11-17  1103  			} else {
c086de818dd81c Kirti Wankhede  2016-11-17  1104  				dma_last =3D dma;
c086de818dd81c Kirti Wankhede  2016-11-17  1105  				retries =3D 0;
c086de818dd81c Kirti Wankhede  2016-11-17  1106  			}
c086de818dd81c Kirti Wankhede  2016-11-17  1107  =

c086de818dd81c Kirti Wankhede  2016-11-17  1108  			nb_unmap.iova =3D dma->=
iova;
c086de818dd81c Kirti Wankhede  2016-11-17  1109  			nb_unmap.size =3D dma->=
size;
c086de818dd81c Kirti Wankhede  2016-11-17  1110  =

c086de818dd81c Kirti Wankhede  2016-11-17  1111  			/*
c086de818dd81c Kirti Wankhede  2016-11-17  1112  			 * Notify anyone (mdev =
vendor drivers) to invalidate and
c086de818dd81c Kirti Wankhede  2016-11-17  1113  			 * unmap iovas within t=
he range we're about to unmap.
c086de818dd81c Kirti Wankhede  2016-11-17  1114  			 * Vendor drivers MUST =
unpin pages in response to an
c086de818dd81c Kirti Wankhede  2016-11-17  1115  			 * invalidation.
c086de818dd81c Kirti Wankhede  2016-11-17  1116  			 */
c086de818dd81c Kirti Wankhede  2016-11-17  1117  			mutex_unlock(&iommu->lo=
ck);
c086de818dd81c Kirti Wankhede  2016-11-17  1118  			blocking_notifier_call_=
chain(&iommu->notifier,
c086de818dd81c Kirti Wankhede  2016-11-17  1119  						    VFIO_IOMMU_NOTIF=
Y_DMA_UNMAP,
c086de818dd81c Kirti Wankhede  2016-11-17  1120  						    &nb_unmap);
c086de818dd81c Kirti Wankhede  2016-11-17  1121  			goto again;
c086de818dd81c Kirti Wankhede  2016-11-17  1122  		}
1ef3e2bc04223f Alex Williamson 2014-02-26  1123  		unmapped +=3D dma->size;
1ef3e2bc04223f Alex Williamson 2014-02-26  1124  		vfio_remove_dma(iommu, d=
ma);
166fd7d94afdac Alex Williamson 2013-06-21  1125  	}
cd9b22685e4ccd Alex Williamson 2013-06-21  1126  =

1ef3e2bc04223f Alex Williamson 2014-02-26  1127  unlock:
5935872fe363ec Kirti Wankhede  2020-05-04  1128  	if ((unmap->flags & VFIO_=
DMA_UNMAP_FLAG_GET_DIRTY_BITMAP) &&
5935872fe363ec Kirti Wankhede  2020-05-04  1129  	     iommu->dirty_page_tr=
acking && final_bitmap) {
5935872fe363ec Kirti Wankhede  2020-05-04  1130  		if (copy_to_user((void _=
_user *)bitmap->data, final_bitmap,
5935872fe363ec Kirti Wankhede  2020-05-04  1131  				 bitmap->size))
5935872fe363ec Kirti Wankhede  2020-05-04  1132  			ret =3D -EFAULT;
5935872fe363ec Kirti Wankhede  2020-05-04  1133  =

5935872fe363ec Kirti Wankhede  2020-05-04  1134  		kfree(final_bitmap);
5935872fe363ec Kirti Wankhede  2020-05-04  1135  		kfree(temp_bitmap);
5935872fe363ec Kirti Wankhede  2020-05-04  1136  	}
5935872fe363ec Kirti Wankhede  2020-05-04  1137  =

73fa0d10d077d9 Alex Williamson 2012-07-31  1138  	mutex_unlock(&iommu->lock=
);
166fd7d94afdac Alex Williamson 2013-06-21  1139  =

1ef3e2bc04223f Alex Williamson 2014-02-26  1140  	/* Report how much was un=
mapped */
166fd7d94afdac Alex Williamson 2013-06-21  1141  	unmap->size =3D unmapped;
166fd7d94afdac Alex Williamson 2013-06-21  1142  =

166fd7d94afdac Alex Williamson 2013-06-21  1143  	return ret;
166fd7d94afdac Alex Williamson 2013-06-21  1144  }
166fd7d94afdac Alex Williamson 2013-06-21  1145  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8946045826503281572==--

