Content-Type: multipart/mixed; boundary="===============8231281772593848005=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [zen:5.17/ksm 3/5] mm/madvise.c:1529 __do_sys_pmadv_ksm() error: uninitialized symbol 'ret'.
Date: Sat, 04 Jun 2022 13:10:48 +0800
Message-ID: <202206041309.VtJQkkzH-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8231281772593848005==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
TO: steven(a)liquorix.net

tree:   https://github.com/zen-kernel/zen-kernel 5.17/ksm
head:   13291d69a25fa8e6f9c49b25602a096a1d98b4f2
commit: 930581120060a7ad837a936056e0c2debf936e24 [3/5] mm: introduce pmadv_=
ksm system call
:::::: branch date: 4 days ago
:::::: commit date: 4 days ago
config: mips-randconfig-m031-20220601 (https://download.01.org/0day-ci/arch=
ive/20220604/202206041309.VtJQkkzH-lkp(a)intel.com/config)
compiler: mips-linux-gcc (GCC) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
mm/madvise.c:1529 __do_sys_pmadv_ksm() error: uninitialized symbol 'ret'.
mm/madvise.c:1529 __do_sys_pmadv_ksm() error: uninitialized symbol 'ret'.

vim +/ret +1529 mm/madvise.c

930581120060a7 Oleksandr Natalenko 2021-10-04  1448  =

930581120060a7 Oleksandr Natalenko 2021-10-04  1449  SYSCALL_DEFINE3(pmadv_=
ksm, int, pidfd, int, behaviour, unsigned int, flags)
930581120060a7 Oleksandr Natalenko 2021-10-04  1450  {
930581120060a7 Oleksandr Natalenko 2021-10-04  1451  #ifdef CONFIG_KSM
930581120060a7 Oleksandr Natalenko 2021-10-04  1452  	ssize_t ret;
930581120060a7 Oleksandr Natalenko 2021-10-04  1453  	struct pid *pid;
930581120060a7 Oleksandr Natalenko 2021-10-04  1454  	struct task_struct *t=
ask;
930581120060a7 Oleksandr Natalenko 2021-10-04  1455  	struct mm_struct *mm;
930581120060a7 Oleksandr Natalenko 2021-10-04  1456  	unsigned int f_flags;
930581120060a7 Oleksandr Natalenko 2021-10-04  1457  	struct vm_area_struct=
 *vma;
930581120060a7 Oleksandr Natalenko 2021-10-04  1458  =

930581120060a7 Oleksandr Natalenko 2021-10-04  1459  	if (flags !=3D 0) {
930581120060a7 Oleksandr Natalenko 2021-10-04  1460  		ret =3D -EINVAL;
930581120060a7 Oleksandr Natalenko 2021-10-04  1461  		goto out;
930581120060a7 Oleksandr Natalenko 2021-10-04  1462  	}
930581120060a7 Oleksandr Natalenko 2021-10-04  1463  =

930581120060a7 Oleksandr Natalenko 2021-10-04  1464  	switch (behaviour) {
930581120060a7 Oleksandr Natalenko 2021-10-04  1465  		case MADV_MERGEABLE:
930581120060a7 Oleksandr Natalenko 2021-10-04  1466  		case MADV_UNMERGEABL=
E:
930581120060a7 Oleksandr Natalenko 2021-10-04  1467  			break;
930581120060a7 Oleksandr Natalenko 2021-10-04  1468  		default:
930581120060a7 Oleksandr Natalenko 2021-10-04  1469  			ret =3D -EINVAL;
930581120060a7 Oleksandr Natalenko 2021-10-04  1470  			goto out;
930581120060a7 Oleksandr Natalenko 2021-10-04  1471  			break;
930581120060a7 Oleksandr Natalenko 2021-10-04  1472  	}
930581120060a7 Oleksandr Natalenko 2021-10-04  1473  =

930581120060a7 Oleksandr Natalenko 2021-10-04  1474  	pid =3D pidfd_get_pid=
(pidfd, &f_flags);
930581120060a7 Oleksandr Natalenko 2021-10-04  1475  	if (IS_ERR(pid)) {
930581120060a7 Oleksandr Natalenko 2021-10-04  1476  		ret =3D PTR_ERR(pid);
930581120060a7 Oleksandr Natalenko 2021-10-04  1477  		goto out;
930581120060a7 Oleksandr Natalenko 2021-10-04  1478  	}
930581120060a7 Oleksandr Natalenko 2021-10-04  1479  =

930581120060a7 Oleksandr Natalenko 2021-10-04  1480  	task =3D get_pid_task=
(pid, PIDTYPE_PID);
930581120060a7 Oleksandr Natalenko 2021-10-04  1481  	if (!task) {
930581120060a7 Oleksandr Natalenko 2021-10-04  1482  		ret =3D -ESRCH;
930581120060a7 Oleksandr Natalenko 2021-10-04  1483  		goto put_pid;
930581120060a7 Oleksandr Natalenko 2021-10-04  1484  	}
930581120060a7 Oleksandr Natalenko 2021-10-04  1485  =

930581120060a7 Oleksandr Natalenko 2021-10-04  1486  	/* Require PTRACE_MOD=
E_READ to avoid leaking ASLR metadata. */
930581120060a7 Oleksandr Natalenko 2021-10-04  1487  	mm =3D mm_access(task=
, PTRACE_MODE_READ_FSCREDS);
930581120060a7 Oleksandr Natalenko 2021-10-04  1488  	if (IS_ERR_OR_NULL(mm=
)) {
930581120060a7 Oleksandr Natalenko 2021-10-04  1489  		ret =3D IS_ERR(mm) ?=
 PTR_ERR(mm) : -ESRCH;
930581120060a7 Oleksandr Natalenko 2021-10-04  1490  		goto release_task;
930581120060a7 Oleksandr Natalenko 2021-10-04  1491  	}
930581120060a7 Oleksandr Natalenko 2021-10-04  1492  =

930581120060a7 Oleksandr Natalenko 2021-10-04  1493  	/* Require CAP_SYS_NI=
CE for influencing process performance. */
930581120060a7 Oleksandr Natalenko 2021-10-04  1494  	if (!capable(CAP_SYS_=
NICE)) {
930581120060a7 Oleksandr Natalenko 2021-10-04  1495  		ret =3D -EPERM;
930581120060a7 Oleksandr Natalenko 2021-10-04  1496  		goto release_mm;
930581120060a7 Oleksandr Natalenko 2021-10-04  1497  	}
930581120060a7 Oleksandr Natalenko 2021-10-04  1498  =

930581120060a7 Oleksandr Natalenko 2021-10-04  1499  	if (mmap_write_lock_k=
illable(mm)) {
930581120060a7 Oleksandr Natalenko 2021-10-04  1500  		ret =3D -EINTR;
930581120060a7 Oleksandr Natalenko 2021-10-04  1501  		goto release_mm;
930581120060a7 Oleksandr Natalenko 2021-10-04  1502  	}
930581120060a7 Oleksandr Natalenko 2021-10-04  1503  =

930581120060a7 Oleksandr Natalenko 2021-10-04  1504  	for (vma =3D mm->mmap=
; vma; vma =3D vma->vm_next) {
930581120060a7 Oleksandr Natalenko 2021-10-04  1505  		switch (behaviour) {
930581120060a7 Oleksandr Natalenko 2021-10-04  1506  			case MADV_MERGEABLE:
930581120060a7 Oleksandr Natalenko 2021-10-04  1507  				ret =3D ksm_madvis=
e_merge(vma->vm_mm, vma, &vma->vm_flags);
930581120060a7 Oleksandr Natalenko 2021-10-04  1508  				break;
930581120060a7 Oleksandr Natalenko 2021-10-04  1509  			case MADV_UNMERGEAB=
LE:
930581120060a7 Oleksandr Natalenko 2021-10-04  1510  				ret =3D ksm_madvis=
e_unmerge(vma, vma->vm_start, vma->vm_end, &vma->vm_flags);
930581120060a7 Oleksandr Natalenko 2021-10-04  1511  				break;
930581120060a7 Oleksandr Natalenko 2021-10-04  1512  			default:
930581120060a7 Oleksandr Natalenko 2021-10-04  1513  				/* look, ma, no br=
ain */
930581120060a7 Oleksandr Natalenko 2021-10-04  1514  				break;
930581120060a7 Oleksandr Natalenko 2021-10-04  1515  		}
930581120060a7 Oleksandr Natalenko 2021-10-04  1516  		if (ret)
930581120060a7 Oleksandr Natalenko 2021-10-04  1517  			break;
930581120060a7 Oleksandr Natalenko 2021-10-04  1518  	}
930581120060a7 Oleksandr Natalenko 2021-10-04  1519  =

930581120060a7 Oleksandr Natalenko 2021-10-04  1520  	mmap_write_unlock(mm);
930581120060a7 Oleksandr Natalenko 2021-10-04  1521  =

930581120060a7 Oleksandr Natalenko 2021-10-04  1522  release_mm:
930581120060a7 Oleksandr Natalenko 2021-10-04  1523  	mmput(mm);
930581120060a7 Oleksandr Natalenko 2021-10-04  1524  release_task:
930581120060a7 Oleksandr Natalenko 2021-10-04  1525  	put_task_struct(task);
930581120060a7 Oleksandr Natalenko 2021-10-04  1526  put_pid:
930581120060a7 Oleksandr Natalenko 2021-10-04  1527  	put_pid(pid);
930581120060a7 Oleksandr Natalenko 2021-10-04  1528  out:
930581120060a7 Oleksandr Natalenko 2021-10-04 @1529  	return ret;

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============8231281772593848005==--

