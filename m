Content-Type: multipart/mixed; boundary="===============4194605974592167279=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: mm/madvise.c:1438:6: warning: Redundant assignment of 'ret' to itself. [selfAssignment]
Date: Mon, 11 Jul 2022 23:23:52 +0800
Message-ID: <202207112301.utyklkHj-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4194605974592167279==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: mm/madvis=
e.c:1438:6: warning: Redundant assignment of 'ret' to itself. [selfAssignme=
nt]"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Charan Teja Kalla <quic_charante@quicinc.com>
CC: Andrew Morton <akpm@linux-foundation.org>
CC: Linux Memory Management List <linux-mm@kvack.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   32346491ddf24599decca06190ebca03ff9de7f8
commit: 5bd009c7c9a9e888077c07535dc0c70aeab242c3 mm: madvise: return correc=
t bytes advised with process_madvise
date:   4 months ago
:::::: branch date: 18 hours ago
:::::: commit date: 4 months ago
compiler: nios2-linux-gcc (GCC) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout 5bd009c7c9a9e888077c07535dc0c70aeab242c3
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> mm/madvise.c:1438:6: warning: Redundant assignment of 'ret' to itself. [=
selfAssignment]
    ret =3D (total_len - iov_iter_count(&iter)) ? : ret;
        ^
   mm/madvise.c:123:28: warning: Parameter 'anon_name' can be declared with=
 const [constParameter]
        struct anon_vma_name *anon_name)
                              ^

vim +/ret +1438 mm/madvise.c

ecb8ac8b1f1469 Minchan Kim        2020-10-17  1378  =

ecb8ac8b1f1469 Minchan Kim        2020-10-17  1379  SYSCALL_DEFINE5(process=
_madvise, int, pidfd, const struct iovec __user *, vec,
ecb8ac8b1f1469 Minchan Kim        2020-10-17  1380  		size_t, vlen, int, be=
havior, unsigned int, flags)
ecb8ac8b1f1469 Minchan Kim        2020-10-17  1381  {
ecb8ac8b1f1469 Minchan Kim        2020-10-17  1382  	ssize_t ret;
ecb8ac8b1f1469 Minchan Kim        2020-10-17  1383  	struct iovec iovstack[=
UIO_FASTIOV], iovec;
ecb8ac8b1f1469 Minchan Kim        2020-10-17  1384  	struct iovec *iov =3D =
iovstack;
ecb8ac8b1f1469 Minchan Kim        2020-10-17  1385  	struct iov_iter iter;
ecb8ac8b1f1469 Minchan Kim        2020-10-17  1386  	struct task_struct *ta=
sk;
ecb8ac8b1f1469 Minchan Kim        2020-10-17  1387  	struct mm_struct *mm;
ecb8ac8b1f1469 Minchan Kim        2020-10-17  1388  	size_t total_len;
ecb8ac8b1f1469 Minchan Kim        2020-10-17  1389  	unsigned int f_flags;
ecb8ac8b1f1469 Minchan Kim        2020-10-17  1390  =

ecb8ac8b1f1469 Minchan Kim        2020-10-17  1391  	if (flags !=3D 0) {
ecb8ac8b1f1469 Minchan Kim        2020-10-17  1392  		ret =3D -EINVAL;
ecb8ac8b1f1469 Minchan Kim        2020-10-17  1393  		goto out;
ecb8ac8b1f1469 Minchan Kim        2020-10-17  1394  	}
ecb8ac8b1f1469 Minchan Kim        2020-10-17  1395  =

ecb8ac8b1f1469 Minchan Kim        2020-10-17  1396  	ret =3D import_iovec(R=
EAD, vec, vlen, ARRAY_SIZE(iovstack), &iov, &iter);
ecb8ac8b1f1469 Minchan Kim        2020-10-17  1397  	if (ret < 0)
ecb8ac8b1f1469 Minchan Kim        2020-10-17  1398  		goto out;
ecb8ac8b1f1469 Minchan Kim        2020-10-17  1399  =

ee9955d61a0a77 Christian Brauner  2021-10-11  1400  	task =3D pidfd_get_tas=
k(pidfd, &f_flags);
ee9955d61a0a77 Christian Brauner  2021-10-11  1401  	if (IS_ERR(task)) {
ee9955d61a0a77 Christian Brauner  2021-10-11  1402  		ret =3D PTR_ERR(task);
ecb8ac8b1f1469 Minchan Kim        2020-10-17  1403  		goto free_iov;
ecb8ac8b1f1469 Minchan Kim        2020-10-17  1404  	}
ecb8ac8b1f1469 Minchan Kim        2020-10-17  1405  =

a68a0262abdaa2 Minchan Kim        2020-12-08  1406  	if (!process_madvise_b=
ehavior_valid(behavior)) {
ecb8ac8b1f1469 Minchan Kim        2020-10-17  1407  		ret =3D -EINVAL;
ecb8ac8b1f1469 Minchan Kim        2020-10-17  1408  		goto release_task;
ecb8ac8b1f1469 Minchan Kim        2020-10-17  1409  	}
ecb8ac8b1f1469 Minchan Kim        2020-10-17  1410  =

96cfe2c0fd23ea Suren Baghdasaryan 2021-03-12  1411  	/* Require PTRACE_MODE=
_READ to avoid leaking ASLR metadata. */
96cfe2c0fd23ea Suren Baghdasaryan 2021-03-12  1412  	mm =3D mm_access(task,=
 PTRACE_MODE_READ_FSCREDS);
ecb8ac8b1f1469 Minchan Kim        2020-10-17  1413  	if (IS_ERR_OR_NULL(mm)=
) {
ecb8ac8b1f1469 Minchan Kim        2020-10-17  1414  		ret =3D IS_ERR(mm) ? =
PTR_ERR(mm) : -ESRCH;
ecb8ac8b1f1469 Minchan Kim        2020-10-17  1415  		goto release_task;
ecb8ac8b1f1469 Minchan Kim        2020-10-17  1416  	}
ecb8ac8b1f1469 Minchan Kim        2020-10-17  1417  =

96cfe2c0fd23ea Suren Baghdasaryan 2021-03-12  1418  	/*
96cfe2c0fd23ea Suren Baghdasaryan 2021-03-12  1419  	 * Require CAP_SYS_NIC=
E for influencing process performance. Note that
96cfe2c0fd23ea Suren Baghdasaryan 2021-03-12  1420  	 * only non-destructiv=
e hints are currently supported.
96cfe2c0fd23ea Suren Baghdasaryan 2021-03-12  1421  	 */
96cfe2c0fd23ea Suren Baghdasaryan 2021-03-12  1422  	if (!capable(CAP_SYS_N=
ICE)) {
96cfe2c0fd23ea Suren Baghdasaryan 2021-03-12  1423  		ret =3D -EPERM;
96cfe2c0fd23ea Suren Baghdasaryan 2021-03-12  1424  		goto release_mm;
96cfe2c0fd23ea Suren Baghdasaryan 2021-03-12  1425  	}
96cfe2c0fd23ea Suren Baghdasaryan 2021-03-12  1426  =

ecb8ac8b1f1469 Minchan Kim        2020-10-17  1427  	total_len =3D iov_iter=
_count(&iter);
ecb8ac8b1f1469 Minchan Kim        2020-10-17  1428  =

ecb8ac8b1f1469 Minchan Kim        2020-10-17  1429  	while (iov_iter_count(=
&iter)) {
ecb8ac8b1f1469 Minchan Kim        2020-10-17  1430  		iovec =3D iov_iter_io=
vec(&iter);
ecb8ac8b1f1469 Minchan Kim        2020-10-17  1431  		ret =3D do_madvise(mm=
, (unsigned long)iovec.iov_base,
ecb8ac8b1f1469 Minchan Kim        2020-10-17  1432  					iovec.iov_len, beh=
avior);
ecb8ac8b1f1469 Minchan Kim        2020-10-17  1433  		if (ret < 0)
ecb8ac8b1f1469 Minchan Kim        2020-10-17  1434  			break;
ecb8ac8b1f1469 Minchan Kim        2020-10-17  1435  		iov_iter_advance(&ite=
r, iovec.iov_len);
ecb8ac8b1f1469 Minchan Kim        2020-10-17  1436  	}
ecb8ac8b1f1469 Minchan Kim        2020-10-17  1437  =

5bd009c7c9a9e8 Charan Teja Kalla  2022-03-22 @1438  	ret =3D (total_len - i=
ov_iter_count(&iter)) ? : ret;

-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4194605974592167279==--

