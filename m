Content-Type: multipart/mixed; boundary="===============4882139430379761063=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [zen:5.19/ksm 3/5] mm/madvise.c:1577 __do_sys_pmadv_ksm() error: uninitialized symbol 'ret'.
Date: Mon, 01 Aug 2022 22:44:40 +0800
Message-ID: <202208012230.q3ccfayt-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4882139430379761063==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: steven(a)liquorix.net

tree:   https://github.com/zen-kernel/zen-kernel 5.19/ksm
head:   60031e6bc73f810a6a291c7c0bffd68630249d8e
commit: 2fc88334edcae00c712c95f7092d44e695d4f1de [3/5] mm: introduce pmadv_=
ksm system call
:::::: branch date: 15 hours ago
:::::: commit date: 15 hours ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/202=
20801/202208012230.q3ccfayt-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
mm/madvise.c:1577 __do_sys_pmadv_ksm() error: uninitialized symbol 'ret'.
mm/madvise.c:1577 __do_sys_pmadv_ksm() error: uninitialized symbol 'ret'.

vim +/ret +1577 mm/madvise.c

2fc88334edcae00 Oleksandr Natalenko 2021-10-04  1496  =

2fc88334edcae00 Oleksandr Natalenko 2021-10-04  1497  SYSCALL_DEFINE3(pmadv=
_ksm, int, pidfd, int, behaviour, unsigned int, flags)
2fc88334edcae00 Oleksandr Natalenko 2021-10-04  1498  {
2fc88334edcae00 Oleksandr Natalenko 2021-10-04  1499  #ifdef CONFIG_KSM
2fc88334edcae00 Oleksandr Natalenko 2021-10-04  1500  	ssize_t ret;
2fc88334edcae00 Oleksandr Natalenko 2021-10-04  1501  	struct pid *pid;
2fc88334edcae00 Oleksandr Natalenko 2021-10-04  1502  	struct task_struct *=
task;
2fc88334edcae00 Oleksandr Natalenko 2021-10-04  1503  	struct mm_struct *mm;
2fc88334edcae00 Oleksandr Natalenko 2021-10-04  1504  	unsigned int f_flags;
2fc88334edcae00 Oleksandr Natalenko 2021-10-04  1505  	struct vm_area_struc=
t *vma;
2fc88334edcae00 Oleksandr Natalenko 2021-10-04  1506  =

2fc88334edcae00 Oleksandr Natalenko 2021-10-04  1507  	if (flags !=3D 0) {
2fc88334edcae00 Oleksandr Natalenko 2021-10-04  1508  		ret =3D -EINVAL;
2fc88334edcae00 Oleksandr Natalenko 2021-10-04  1509  		goto out;
2fc88334edcae00 Oleksandr Natalenko 2021-10-04  1510  	}
2fc88334edcae00 Oleksandr Natalenko 2021-10-04  1511  =

2fc88334edcae00 Oleksandr Natalenko 2021-10-04  1512  	switch (behaviour) {
2fc88334edcae00 Oleksandr Natalenko 2021-10-04  1513  		case MADV_MERGEABLE:
2fc88334edcae00 Oleksandr Natalenko 2021-10-04  1514  		case MADV_UNMERGEAB=
LE:
2fc88334edcae00 Oleksandr Natalenko 2021-10-04  1515  			break;
2fc88334edcae00 Oleksandr Natalenko 2021-10-04  1516  		default:
2fc88334edcae00 Oleksandr Natalenko 2021-10-04  1517  			ret =3D -EINVAL;
2fc88334edcae00 Oleksandr Natalenko 2021-10-04  1518  			goto out;
2fc88334edcae00 Oleksandr Natalenko 2021-10-04  1519  			break;
2fc88334edcae00 Oleksandr Natalenko 2021-10-04  1520  	}
2fc88334edcae00 Oleksandr Natalenko 2021-10-04  1521  =

2fc88334edcae00 Oleksandr Natalenko 2021-10-04  1522  	pid =3D pidfd_get_pi=
d(pidfd, &f_flags);
2fc88334edcae00 Oleksandr Natalenko 2021-10-04  1523  	if (IS_ERR(pid)) {
2fc88334edcae00 Oleksandr Natalenko 2021-10-04  1524  		ret =3D PTR_ERR(pid=
);
2fc88334edcae00 Oleksandr Natalenko 2021-10-04  1525  		goto out;
2fc88334edcae00 Oleksandr Natalenko 2021-10-04  1526  	}
2fc88334edcae00 Oleksandr Natalenko 2021-10-04  1527  =

2fc88334edcae00 Oleksandr Natalenko 2021-10-04  1528  	task =3D get_pid_tas=
k(pid, PIDTYPE_PID);
2fc88334edcae00 Oleksandr Natalenko 2021-10-04  1529  	if (!task) {
2fc88334edcae00 Oleksandr Natalenko 2021-10-04  1530  		ret =3D -ESRCH;
2fc88334edcae00 Oleksandr Natalenko 2021-10-04  1531  		goto put_pid;
2fc88334edcae00 Oleksandr Natalenko 2021-10-04  1532  	}
2fc88334edcae00 Oleksandr Natalenko 2021-10-04  1533  =

2fc88334edcae00 Oleksandr Natalenko 2021-10-04  1534  	/* Require PTRACE_MO=
DE_READ to avoid leaking ASLR metadata. */
2fc88334edcae00 Oleksandr Natalenko 2021-10-04  1535  	mm =3D mm_access(tas=
k, PTRACE_MODE_READ_FSCREDS);
2fc88334edcae00 Oleksandr Natalenko 2021-10-04  1536  	if (IS_ERR_OR_NULL(m=
m)) {
2fc88334edcae00 Oleksandr Natalenko 2021-10-04  1537  		ret =3D IS_ERR(mm) =
? PTR_ERR(mm) : -ESRCH;
2fc88334edcae00 Oleksandr Natalenko 2021-10-04  1538  		goto release_task;
2fc88334edcae00 Oleksandr Natalenko 2021-10-04  1539  	}
2fc88334edcae00 Oleksandr Natalenko 2021-10-04  1540  =

2fc88334edcae00 Oleksandr Natalenko 2021-10-04  1541  	/* Require CAP_SYS_N=
ICE for influencing process performance. */
2fc88334edcae00 Oleksandr Natalenko 2021-10-04  1542  	if (!capable(CAP_SYS=
_NICE)) {
2fc88334edcae00 Oleksandr Natalenko 2021-10-04  1543  		ret =3D -EPERM;
2fc88334edcae00 Oleksandr Natalenko 2021-10-04  1544  		goto release_mm;
2fc88334edcae00 Oleksandr Natalenko 2021-10-04  1545  	}
2fc88334edcae00 Oleksandr Natalenko 2021-10-04  1546  =

2fc88334edcae00 Oleksandr Natalenko 2021-10-04  1547  	if (mmap_write_lock_=
killable(mm)) {
2fc88334edcae00 Oleksandr Natalenko 2021-10-04  1548  		ret =3D -EINTR;
2fc88334edcae00 Oleksandr Natalenko 2021-10-04  1549  		goto release_mm;
2fc88334edcae00 Oleksandr Natalenko 2021-10-04  1550  	}
2fc88334edcae00 Oleksandr Natalenko 2021-10-04  1551  =

2fc88334edcae00 Oleksandr Natalenko 2021-10-04  1552  	for (vma =3D mm->mma=
p; vma; vma =3D vma->vm_next) {
2fc88334edcae00 Oleksandr Natalenko 2021-10-04  1553  		switch (behaviour) {
2fc88334edcae00 Oleksandr Natalenko 2021-10-04  1554  			case MADV_MERGEABL=
E:
2fc88334edcae00 Oleksandr Natalenko 2021-10-04  1555  				ret =3D ksm_madvi=
se_merge(vma->vm_mm, vma, &vma->vm_flags);
2fc88334edcae00 Oleksandr Natalenko 2021-10-04  1556  				break;
2fc88334edcae00 Oleksandr Natalenko 2021-10-04  1557  			case MADV_UNMERGEA=
BLE:
2fc88334edcae00 Oleksandr Natalenko 2021-10-04  1558  				ret =3D ksm_madvi=
se_unmerge(vma, vma->vm_start, vma->vm_end, &vma->vm_flags);
2fc88334edcae00 Oleksandr Natalenko 2021-10-04  1559  				break;
2fc88334edcae00 Oleksandr Natalenko 2021-10-04  1560  			default:
2fc88334edcae00 Oleksandr Natalenko 2021-10-04  1561  				/* look, ma, no b=
rain */
2fc88334edcae00 Oleksandr Natalenko 2021-10-04  1562  				break;
2fc88334edcae00 Oleksandr Natalenko 2021-10-04  1563  		}
2fc88334edcae00 Oleksandr Natalenko 2021-10-04  1564  		if (ret)
2fc88334edcae00 Oleksandr Natalenko 2021-10-04  1565  			break;
2fc88334edcae00 Oleksandr Natalenko 2021-10-04  1566  	}
2fc88334edcae00 Oleksandr Natalenko 2021-10-04  1567  =

2fc88334edcae00 Oleksandr Natalenko 2021-10-04  1568  	mmap_write_unlock(mm=
);
2fc88334edcae00 Oleksandr Natalenko 2021-10-04  1569  =

2fc88334edcae00 Oleksandr Natalenko 2021-10-04  1570  release_mm:
2fc88334edcae00 Oleksandr Natalenko 2021-10-04  1571  	mmput(mm);
2fc88334edcae00 Oleksandr Natalenko 2021-10-04  1572  release_task:
2fc88334edcae00 Oleksandr Natalenko 2021-10-04  1573  	put_task_struct(task=
);
2fc88334edcae00 Oleksandr Natalenko 2021-10-04  1574  put_pid:
2fc88334edcae00 Oleksandr Natalenko 2021-10-04  1575  	put_pid(pid);
2fc88334edcae00 Oleksandr Natalenko 2021-10-04  1576  out:
2fc88334edcae00 Oleksandr Natalenko 2021-10-04 @1577  	return ret;

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4882139430379761063==--

