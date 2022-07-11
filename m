Content-Type: multipart/mixed; boundary="===============7778598783035356680=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 8919/9472] mm/khugepaged.c:2409 madvise_collapse() warn: possible memory leak of 'cc'
Date: Tue, 12 Jul 2022 04:20:06 +0800
Message-ID: <202207120432.NHLYEOI5-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7778598783035356680==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: "Zach O'Keefe" <zokeefe@google.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   4112a8699ae2eac797415b9be1d7901b3f79e772
commit: 9f626ffb1d1c5c26b4a8e0fdffec784a5f773274 [8919/9472] mm/madvise: in=
troduce MADV_COLLAPSE sync hugepage collapse
:::::: branch date: 9 hours ago
:::::: commit date: 3 days ago
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20220=
712/202207120432.NHLYEOI5-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
mm/khugepaged.c:2409 madvise_collapse() warn: possible memory leak of 'cc'

vim +/cc +2409 mm/khugepaged.c

9f626ffb1d1c5c Zach O'Keefe 2022-07-06  2386  =

9f626ffb1d1c5c Zach O'Keefe 2022-07-06  2387  int madvise_collapse(struct v=
m_area_struct *vma, struct vm_area_struct **prev,
9f626ffb1d1c5c Zach O'Keefe 2022-07-06  2388  		     unsigned long start, u=
nsigned long end)
9f626ffb1d1c5c Zach O'Keefe 2022-07-06  2389  {
9f626ffb1d1c5c Zach O'Keefe 2022-07-06  2390  	struct collapse_control *cc;
9f626ffb1d1c5c Zach O'Keefe 2022-07-06  2391  	struct mm_struct *mm =3D vma=
->vm_mm;
9f626ffb1d1c5c Zach O'Keefe 2022-07-06  2392  	unsigned long hstart, hend, =
addr;
9f626ffb1d1c5c Zach O'Keefe 2022-07-06  2393  	int thps =3D 0, last_fail =
=3D SCAN_FAIL;
9f626ffb1d1c5c Zach O'Keefe 2022-07-06  2394  	bool mmap_locked =3D true;
9f626ffb1d1c5c Zach O'Keefe 2022-07-06  2395  =

9f626ffb1d1c5c Zach O'Keefe 2022-07-06  2396  	BUG_ON(vma->vm_start > start=
);
9f626ffb1d1c5c Zach O'Keefe 2022-07-06  2397  	BUG_ON(vma->vm_end < end);
9f626ffb1d1c5c Zach O'Keefe 2022-07-06  2398  =

9f626ffb1d1c5c Zach O'Keefe 2022-07-06  2399  	cc =3D kmalloc(sizeof(*cc), =
GFP_KERNEL);
9f626ffb1d1c5c Zach O'Keefe 2022-07-06  2400  	if (!cc)
9f626ffb1d1c5c Zach O'Keefe 2022-07-06  2401  		return -ENOMEM;
9f626ffb1d1c5c Zach O'Keefe 2022-07-06  2402  	cc->is_khugepaged =3D false;
9f626ffb1d1c5c Zach O'Keefe 2022-07-06  2403  	cc->last_target_node =3D NUM=
A_NO_NODE;
9f626ffb1d1c5c Zach O'Keefe 2022-07-06  2404  =

9f626ffb1d1c5c Zach O'Keefe 2022-07-06  2405  	*prev =3D vma;
9f626ffb1d1c5c Zach O'Keefe 2022-07-06  2406  =

9f626ffb1d1c5c Zach O'Keefe 2022-07-06  2407  	/* TODO: Support file/shmem =
*/
9f626ffb1d1c5c Zach O'Keefe 2022-07-06  2408  	if (!vma->anon_vma || !vma_i=
s_anonymous(vma))
9f626ffb1d1c5c Zach O'Keefe 2022-07-06 @2409  		return -EINVAL;

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============7778598783035356680==--

