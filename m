Content-Type: multipart/mixed; boundary="===============8934563933616975257=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: mm/mempolicy.c:1518 __do_sys_set_mempolicy_home_node() warn: comparison of a potentially tagged address (__do_sys_set_mempolicy_home_node, -2, end)
Date: Sun, 28 Aug 2022 05:27:19 +0800
Message-ID: <202208280539.wSyvdNmO-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8934563933616975257==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: "Aneesh Kumar K.V" <aneesh.kumar@linux.ibm.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   89b749d8552d78c4dd86dea86e2e6ba8aafab9fe
commit: c6018b4b254971863bd0ad36bb5e7d0fa0f0ddb0 mm/mempolicy: add set_memp=
olicy_home_node syscall
date:   7 months ago
:::::: branch date: 4 hours ago
:::::: commit date: 7 months ago
config: arm64-randconfig-m031-20220827 (https://download.01.org/0day-ci/arc=
hive/20220828/202208280539.wSyvdNmO-lkp(a)intel.com/config)
compiler: aarch64-linux-gcc (GCC) 12.1.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
mm/mempolicy.c:1518 __do_sys_set_mempolicy_home_node() warn: comparison of =
a potentially tagged address (__do_sys_set_mempolicy_home_node, -2, end)
mm/mempolicy.c:1518 __do_sys_set_mempolicy_home_node() warn: comparison of =
a potentially tagged address (__do_sys_set_mempolicy_home_node, -2, end)
mm/mempolicy.c:1518 __do_sys_set_mempolicy_home_node() warn: comparison of =
a potentially tagged address (__do_sys_set_mempolicy_home_node, -2, end)
mm/mempolicy.c:1518 __do_sys_set_mempolicy_home_node() warn: comparison of =
a potentially tagged address (__do_sys_set_mempolicy_home_node, -2, end)

vim +1518 mm/mempolicy.c

8bccd85ffbaf8f Christoph Lameter 2005-10-29  1481  =

c6018b4b254971 Aneesh Kumar K.V  2022-01-14  1482  SYSCALL_DEFINE4(set_memp=
olicy_home_node, unsigned long, start, unsigned long, len,
c6018b4b254971 Aneesh Kumar K.V  2022-01-14  1483  		unsigned long, home_no=
de, unsigned long, flags)
c6018b4b254971 Aneesh Kumar K.V  2022-01-14  1484  {
c6018b4b254971 Aneesh Kumar K.V  2022-01-14  1485  	struct mm_struct *mm =
=3D current->mm;
c6018b4b254971 Aneesh Kumar K.V  2022-01-14  1486  	struct vm_area_struct *=
vma;
c6018b4b254971 Aneesh Kumar K.V  2022-01-14  1487  	struct mempolicy *new;
c6018b4b254971 Aneesh Kumar K.V  2022-01-14  1488  	unsigned long vmstart;
c6018b4b254971 Aneesh Kumar K.V  2022-01-14  1489  	unsigned long vmend;
c6018b4b254971 Aneesh Kumar K.V  2022-01-14  1490  	unsigned long end;
c6018b4b254971 Aneesh Kumar K.V  2022-01-14  1491  	int err =3D -ENOENT;
c6018b4b254971 Aneesh Kumar K.V  2022-01-14  1492  =

c6018b4b254971 Aneesh Kumar K.V  2022-01-14  1493  	start =3D untagged_addr=
(start);
c6018b4b254971 Aneesh Kumar K.V  2022-01-14  1494  	if (start & ~PAGE_MASK)
c6018b4b254971 Aneesh Kumar K.V  2022-01-14  1495  		return -EINVAL;
c6018b4b254971 Aneesh Kumar K.V  2022-01-14  1496  	/*
c6018b4b254971 Aneesh Kumar K.V  2022-01-14  1497  	 * flags is used for fu=
ture extension if any.
c6018b4b254971 Aneesh Kumar K.V  2022-01-14  1498  	 */
c6018b4b254971 Aneesh Kumar K.V  2022-01-14  1499  	if (flags !=3D 0)
c6018b4b254971 Aneesh Kumar K.V  2022-01-14  1500  		return -EINVAL;
c6018b4b254971 Aneesh Kumar K.V  2022-01-14  1501  =

c6018b4b254971 Aneesh Kumar K.V  2022-01-14  1502  	/*
c6018b4b254971 Aneesh Kumar K.V  2022-01-14  1503  	 * Check home_node is o=
nline to avoid accessing uninitialized
c6018b4b254971 Aneesh Kumar K.V  2022-01-14  1504  	 * NODE_DATA.
c6018b4b254971 Aneesh Kumar K.V  2022-01-14  1505  	 */
c6018b4b254971 Aneesh Kumar K.V  2022-01-14  1506  	if (home_node >=3D MAX_=
NUMNODES || !node_online(home_node))
c6018b4b254971 Aneesh Kumar K.V  2022-01-14  1507  		return -EINVAL;
c6018b4b254971 Aneesh Kumar K.V  2022-01-14  1508  =

c6018b4b254971 Aneesh Kumar K.V  2022-01-14  1509  	len =3D (len + PAGE_SIZ=
E - 1) & PAGE_MASK;
c6018b4b254971 Aneesh Kumar K.V  2022-01-14  1510  	end =3D start + len;
c6018b4b254971 Aneesh Kumar K.V  2022-01-14  1511  =

c6018b4b254971 Aneesh Kumar K.V  2022-01-14  1512  	if (end < start)
c6018b4b254971 Aneesh Kumar K.V  2022-01-14  1513  		return -EINVAL;
c6018b4b254971 Aneesh Kumar K.V  2022-01-14  1514  	if (end =3D=3D start)
c6018b4b254971 Aneesh Kumar K.V  2022-01-14  1515  		return 0;
c6018b4b254971 Aneesh Kumar K.V  2022-01-14  1516  	mmap_write_lock(mm);
c6018b4b254971 Aneesh Kumar K.V  2022-01-14  1517  	vma =3D find_vma(mm, st=
art);
c6018b4b254971 Aneesh Kumar K.V  2022-01-14 @1518  	for (; vma && vma->vm_s=
tart < end;  vma =3D vma->vm_next) {
c6018b4b254971 Aneesh Kumar K.V  2022-01-14  1519  =

c6018b4b254971 Aneesh Kumar K.V  2022-01-14  1520  		vmstart =3D max(start,=
 vma->vm_start);
c6018b4b254971 Aneesh Kumar K.V  2022-01-14  1521  		vmend   =3D min(end, v=
ma->vm_end);
c6018b4b254971 Aneesh Kumar K.V  2022-01-14  1522  		new =3D mpol_dup(vma_p=
olicy(vma));
c6018b4b254971 Aneesh Kumar K.V  2022-01-14  1523  		if (IS_ERR(new)) {
c6018b4b254971 Aneesh Kumar K.V  2022-01-14  1524  			err =3D PTR_ERR(new);
c6018b4b254971 Aneesh Kumar K.V  2022-01-14  1525  			break;
c6018b4b254971 Aneesh Kumar K.V  2022-01-14  1526  		}
c6018b4b254971 Aneesh Kumar K.V  2022-01-14  1527  		/*
c6018b4b254971 Aneesh Kumar K.V  2022-01-14  1528  		 * Only update home no=
de if there is an existing vma policy
c6018b4b254971 Aneesh Kumar K.V  2022-01-14  1529  		 */
c6018b4b254971 Aneesh Kumar K.V  2022-01-14  1530  		if (!new)
c6018b4b254971 Aneesh Kumar K.V  2022-01-14  1531  			continue;
c6018b4b254971 Aneesh Kumar K.V  2022-01-14  1532  =

c6018b4b254971 Aneesh Kumar K.V  2022-01-14  1533  		/*
c6018b4b254971 Aneesh Kumar K.V  2022-01-14  1534  		 * If any vma in the r=
ange got policy other than MPOL_BIND
c6018b4b254971 Aneesh Kumar K.V  2022-01-14  1535  		 * or MPOL_PREFERRED_M=
ANY we return error. We don't reset
c6018b4b254971 Aneesh Kumar K.V  2022-01-14  1536  		 * the home node for v=
mas we already updated before.
c6018b4b254971 Aneesh Kumar K.V  2022-01-14  1537  		 */
c6018b4b254971 Aneesh Kumar K.V  2022-01-14  1538  		if (new->mode !=3D MPO=
L_BIND && new->mode !=3D MPOL_PREFERRED_MANY) {
c6018b4b254971 Aneesh Kumar K.V  2022-01-14  1539  			err =3D -EOPNOTSUPP;
c6018b4b254971 Aneesh Kumar K.V  2022-01-14  1540  			break;
c6018b4b254971 Aneesh Kumar K.V  2022-01-14  1541  		}
c6018b4b254971 Aneesh Kumar K.V  2022-01-14  1542  =

c6018b4b254971 Aneesh Kumar K.V  2022-01-14  1543  		new->home_node =3D hom=
e_node;
c6018b4b254971 Aneesh Kumar K.V  2022-01-14  1544  		err =3D mbind_range(mm=
, vmstart, vmend, new);
c6018b4b254971 Aneesh Kumar K.V  2022-01-14  1545  		mpol_put(new);
c6018b4b254971 Aneesh Kumar K.V  2022-01-14  1546  		if (err)
c6018b4b254971 Aneesh Kumar K.V  2022-01-14  1547  			break;
c6018b4b254971 Aneesh Kumar K.V  2022-01-14  1548  	}
c6018b4b254971 Aneesh Kumar K.V  2022-01-14  1549  	mmap_write_unlock(mm);
c6018b4b254971 Aneesh Kumar K.V  2022-01-14  1550  	return err;
c6018b4b254971 Aneesh Kumar K.V  2022-01-14  1551  }
c6018b4b254971 Aneesh Kumar K.V  2022-01-14  1552  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8934563933616975257==--

