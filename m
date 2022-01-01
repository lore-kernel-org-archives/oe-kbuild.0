Content-Type: multipart/mixed; boundary="===============7417923481741256679=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: fs/dax.c:1594:10: warning: Although the value stored to 'error' is used in the enclosing expression, the value is never actually read from 'error' [clang-analyzer-deadcode.DeadStores]
Date: Sun, 02 Jan 2022 01:09:09 +0800
Message-ID: <202201020059.efZcSedQ-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7417923481741256679==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Christoph Hellwig <hch@lst.de>
CC: "Darrick J. Wong" <djwong@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   8008293888188c3923f5bd8a69370dae25ed14e5
commit: 65dd814a6187ff46e33718d8eb76244e027837a3 fsdax: switch the fault ha=
ndlers to use iomap_iter
date:   5 months ago
:::::: branch date: 20 hours ago
:::::: commit date: 5 months ago
config: x86_64-randconfig-c007-20211230 (https://download.01.org/0day-ci/ar=
chive/20220102/202201020059.efZcSedQ-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project cd284b=
7ac0615afc6e0f1a30da2777e361de27a3)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3D65dd814a6187ff46e33718d8eb76244e027837a3
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout 65dd814a6187ff46e33718d8eb76244e027837a3
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   fs/xfs/xfs_linux.h:207:10: note: expanded from macro 'ASSERT'
           (likely(expr) ? (void)0 : assfail(NULL, #expr, __FILE__, __LINE_=
_))
                   ^~~~
   include/linux/compiler.h:45:66: note: expanded from macro 'likely'
   #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
                                                                        ^
   include/linux/compiler.h:35:19: note: expanded from macro '__branch_chec=
k__'
                                                expect, is_constant);      \
                                                        ^~~~~~~~~~~
   fs/xfs/xfs_log_recover.c:145:2: note: '?' condition is true
           ASSERT(nbblks > 0);
           ^
   fs/xfs/xfs_linux.h:207:3: note: expanded from macro 'ASSERT'
           (likely(expr) ? (void)0 : assfail(NULL, #expr, __FILE__, __LINE_=
_))
            ^
   include/linux/compiler.h:45:21: note: expanded from macro 'likely'
   #  define likely(x)     (__branch_check__(x, 1, __builtin_constant_p(x)))
                           ^
   fs/xfs/xfs_log_recover.c:149:6: note: Assuming 'error' is not equal to 0=
, which participates in a condition later
           if (error && !XFS_FORCED_SHUTDOWN(log->l_mp)) {
               ^~~~~
   fs/xfs/xfs_log_recover.c:149:6: note: Left side of '&&' is true
   fs/xfs/xfs_log_recover.c:149:15: note: Assuming the condition is false
           if (error && !XFS_FORCED_SHUTDOWN(log->l_mp)) {
                        ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/xfs_log_recover.c:149:2: note: Taking false branch
           if (error && !XFS_FORCED_SHUTDOWN(log->l_mp)) {
           ^
   fs/xfs/xfs_log_recover.c:155:2: note: Returning value (loaded from 'erro=
r'), which participates in a condition later
           return error;
           ^~~~~~~~~~~~
   fs/xfs/xfs_log_recover.c:178:10: note: Returning from 'xlog_do_io'
           error =3D xlog_do_io(log, blk_no, nbblks, data, REQ_OP_READ);
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/xfs_log_recover.c:179:7: note: 'error' is not equal to 0, which p=
articipates in a condition later
           if (!error)
                ^~~~~
   fs/xfs/xfs_log_recover.c:179:2: note: Taking false branch
           if (!error)
           ^
   fs/xfs/xfs_log_recover.c:181:2: note: Returning value (loaded from 'erro=
r'), which participates in a condition later
           return error;
           ^~~~~~~~~~~~
   fs/xfs/xfs_log_recover.c:794:11: note: Returning from 'xlog_bread'
                   error =3D xlog_bread(log, i, 1, buffer, &offset);
                           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/xfs/xfs_log_recover.c:795:7: note: 'error' is not equal to 0, which p=
articipates in a condition later
                   if (error)
                       ^~~~~
   fs/xfs/xfs_log_recover.c:795:3: note: Taking true branch
                   if (error)
                   ^
   fs/xfs/xfs_log_recover.c:796:4: note: Control jumps to line 831
                           goto out_error;
                           ^
   fs/xfs/xfs_log_recover.c:831:2: note: Returning without writing to '*rhe=
ad'
           return error;
           ^
   fs/xfs/xfs_log_recover.c:831:2: note: Returning value (loaded from 'erro=
r'), which participates in a condition later
           return error;
           ^~~~~~~~~~~~
   fs/xfs/xfs_log_recover.c:1287:10: note: Returning from 'xlog_rseek_logre=
c_hdr'
           error =3D xlog_rseek_logrec_hdr(log, *head_blk, *head_blk, 1, bu=
ffer,
                   ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~=
~~~
   fs/xfs/xfs_log_recover.c:1289:6: note: Assuming 'error' is >=3D 0
           if (error < 0)
               ^~~~~~~~~
   fs/xfs/xfs_log_recover.c:1289:2: note: Taking false branch
           if (error < 0)
           ^
   fs/xfs/xfs_log_recover.c:1291:7: note: 'error' is not equal to 0
           if (!error) {
                ^~~~~
   fs/xfs/xfs_log_recover.c:1291:2: note: Taking false branch
           if (!error) {
           ^
   fs/xfs/xfs_log_recover.c:1296:24: note: Access to field 'h_tail_lsn' res=
ults in a dereference of an undefined pointer value (loaded from variable '=
rhead')
           *tail_blk =3D BLOCK_LSN(be64_to_cpu(rhead->h_tail_lsn));
                                 ^
   include/linux/byteorder/generic.h:93:21: note: expanded from macro 'be64=
_to_cpu'
   #define be64_to_cpu __be64_to_cpu
                       ^
   include/uapi/linux/byteorder/little_endian.h:38:58: note: expanded from =
macro '__be64_to_cpu'
   #define __be64_to_cpu(x) __swab64((__force __u64)(__be64)(x))
                                                            ^~
   include/uapi/linux/swab.h:128:54: note: expanded from macro '__swab64'
   #define __swab64(x) (__u64)__builtin_bswap64((__u64)(x))
                                                        ^
   fs/xfs/libxfs/xfs_log_format.h:52:32: note: expanded from macro 'BLOCK_L=
SN'
   #define BLOCK_LSN(lsn) ((uint)(lsn))
                                  ^~~
   fs/xfs/xfs_log_recover.c:3498:20: warning: Value stored to 'mp' during i=
ts initialization is never read [clang-analyzer-deadcode.DeadStores]
           struct xfs_mount        *mp =3D log->l_mp;
                                    ^~   ~~~~~~~~~
   fs/xfs/xfs_log_recover.c:3498:20: note: Value stored to 'mp' during its =
initialization is never read
           struct xfs_mount        *mp =3D log->l_mp;
                                    ^~   ~~~~~~~~~
   Suppressed 11 warnings (8 in non-user code, 3 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
>> fs/dax.c:1594:10: warning: Although the value stored to 'error' is used =
in the enclosing expression, the value is never actually read from 'error' =
[clang-analyzer-deadcode.DeadStores]
           while ((error =3D iomap_iter(&iter, ops)) > 0) {
                   ^       ~~~~~~~~~~~~~~~~~~~~~~
   fs/dax.c:1594:10: note: Although the value stored to 'error' is used in =
the enclosing expression, the value is never actually read from 'error'
           while ((error =3D iomap_iter(&iter, ops)) > 0) {
                   ^       ~~~~~~~~~~~~~~~~~~~~~~
   fs/dax.c:1709:25: warning: The result of the left shift is undefined due=
 to shifting by '4294967295', which is greater or equal to the width of typ=
e 'unsigned long' [clang-analyzer-core.UndefinedBinaryOperatorResult]
           size_t len =3D PAGE_SIZE << order;
                                  ^  ~~~~~
   fs/dax.c:1708:23: note: Calling 'pe_order'
           unsigned int order =3D pe_order(pe_size);
                                ^~~~~~~~~~~~~~~~~
   fs/dax.c:35:6: note: Assuming 'pe_size' is not equal to PE_SIZE_PTE
           if (pe_size =3D=3D PE_SIZE_PTE)
               ^~~~~~~~~~~~~~~~~~~~~~
   fs/dax.c:35:2: note: Taking false branch
           if (pe_size =3D=3D PE_SIZE_PTE)
           ^
   fs/dax.c:37:6: note: Assuming 'pe_size' is not equal to PE_SIZE_PMD
           if (pe_size =3D=3D PE_SIZE_PMD)
               ^~~~~~~~~~~~~~~~~~~~~~
   fs/dax.c:37:2: note: Taking false branch
           if (pe_size =3D=3D PE_SIZE_PMD)
           ^
   fs/dax.c:39:6: note: Assuming 'pe_size' is not equal to PE_SIZE_PUD
           if (pe_size =3D=3D PE_SIZE_PUD)
               ^~~~~~~~~~~~~~~~~~~~~~
   fs/dax.c:39:2: note: Taking false branch
           if (pe_size =3D=3D PE_SIZE_PUD)
           ^
   fs/dax.c:41:2: note: Returning the value 4294967295
           return ~0;
           ^~~~~~~~~
   fs/dax.c:1708:23: note: Returning from 'pe_order'
           unsigned int order =3D pe_order(pe_size);
                                ^~~~~~~~~~~~~~~~~
   fs/dax.c:1708:2: note: 'order' initialized to 4294967295
           unsigned int order =3D pe_order(pe_size);
           ^~~~~~~~~~~~~~~~~~
   fs/dax.c:1709:25: note: The result of the left shift is undefined due to=
 shifting by '4294967295', which is greater or equal to the width of type '=
unsigned long'
           size_t len =3D PAGE_SIZE << order;
                                  ^  ~~~~~
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   fs/verity/open.c:217:2: warning: Attempt to free released memory [clang-=
analyzer-unix.Malloc]
           kfree(vi->tree_params.hashstate);
           ^
   fs/verity/open.c:347:6: note: Assuming the condition is false
           if (!IS_VERITY(inode))
               ^~~~~~~~~~~~~~~~~
   fs/verity/open.c:347:2: note: Taking false branch
           if (!IS_VERITY(inode))
           ^
   fs/verity/open.c:350:6: note: Assuming the condition is false
           if (filp->f_mode & FMODE_WRITE) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/verity/open.c:350:2: note: Taking false branch
           if (filp->f_mode & FMODE_WRITE) {
           ^
   fs/verity/open.c:356:9: note: Calling 'ensure_verity_info'
           return ensure_verity_info(inode);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~
   fs/verity/open.c:312:6: note: Assuming 'vi' is null
           if (vi)
               ^~
   fs/verity/open.c:312:2: note: Taking false branch
           if (vi)
           ^
   fs/verity/open.c:316:6: note: 'err' is 0
           if (err)
               ^~~
   fs/verity/open.c:316:2: note: Taking false branch
           if (err)
           ^
   fs/verity/open.c:319:7: note: Calling 'fsverity_create_info'
           vi =3D fsverity_create_info(inode, desc, desc_size);
                ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/verity/open.c:157:6: note: Assuming 'vi' is non-null
           if (!vi)
               ^~~
   fs/verity/open.c:157:2: note: Taking false branch
           if (!vi)
           ^
   fs/verity/open.c:161:8: note: Calling 'fsverity_init_merkle_tree_params'
           err =3D fsverity_init_merkle_tree_params(&vi->tree_params, inode,
                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/verity/open.c:43:2: note: Taking false branch
           if (IS_ERR(hash_alg))

vim +1594 fs/dax.c

55f81639a71528 Shiyang Ruan            2021-08-10  1533  =

ab77dab46210bb Souptick Joarder        2018-06-07  1534  static vm_fault_t =
dax_iomap_pmd_fault(struct vm_fault *vmf, pfn_t *pfnp,
a2d581675d485e Dave Jiang              2017-02-24  1535  			       const st=
ruct iomap_ops *ops)
642261ac995e01 Ross Zwisler            2016-11-08  1536  {
65dd814a6187ff Christoph Hellwig       2021-08-10  1537  	struct address_sp=
ace *mapping =3D vmf->vma->vm_file->f_mapping;
b15cd800682fca Matthew Wilcox          2018-03-29  1538  	XA_STATE_ORDER(xa=
s, &mapping->i_pages, vmf->pgoff, PMD_ORDER);
65dd814a6187ff Christoph Hellwig       2021-08-10  1539  	struct iomap_iter=
 iter =3D {
65dd814a6187ff Christoph Hellwig       2021-08-10  1540  		.inode		=3D mapp=
ing->host,
65dd814a6187ff Christoph Hellwig       2021-08-10  1541  		.len		=3D PMD_SI=
ZE,
65dd814a6187ff Christoph Hellwig       2021-08-10  1542  		.flags		=3D IOMA=
P_FAULT,
65dd814a6187ff Christoph Hellwig       2021-08-10  1543  	};
c2436190e492b2 Shiyang Ruan            2021-08-10  1544  	vm_fault_t ret =
=3D VM_FAULT_FALLBACK;
b15cd800682fca Matthew Wilcox          2018-03-29  1545  	pgoff_t max_pgoff;
642261ac995e01 Ross Zwisler            2016-11-08  1546  	void *entry;
642261ac995e01 Ross Zwisler            2016-11-08  1547  	int error;
642261ac995e01 Ross Zwisler            2016-11-08  1548  =

65dd814a6187ff Christoph Hellwig       2021-08-10  1549  	if (vmf->flags & =
FAULT_FLAG_WRITE)
65dd814a6187ff Christoph Hellwig       2021-08-10  1550  		iter.flags |=3D =
IOMAP_WRITE;
65dd814a6187ff Christoph Hellwig       2021-08-10  1551  =

282a8e0391c377 Ross Zwisler            2017-02-22  1552  	/*
282a8e0391c377 Ross Zwisler            2017-02-22  1553  	 * Check whether =
offset isn't beyond end of file now. Caller is
282a8e0391c377 Ross Zwisler            2017-02-22  1554  	 * supposed to ho=
ld locks serializing us with truncate / punch hole so
282a8e0391c377 Ross Zwisler            2017-02-22  1555  	 * this is a reli=
able test.
282a8e0391c377 Ross Zwisler            2017-02-22  1556  	 */
65dd814a6187ff Christoph Hellwig       2021-08-10  1557  	max_pgoff =3D DIV=
_ROUND_UP(i_size_read(iter.inode), PAGE_SIZE);
282a8e0391c377 Ross Zwisler            2017-02-22  1558  =

65dd814a6187ff Christoph Hellwig       2021-08-10  1559  	trace_dax_pmd_fau=
lt(iter.inode, vmf, max_pgoff, 0);
282a8e0391c377 Ross Zwisler            2017-02-22  1560  =

b15cd800682fca Matthew Wilcox          2018-03-29  1561  	if (xas.xa_index =
>=3D max_pgoff) {
c2436190e492b2 Shiyang Ruan            2021-08-10  1562  		ret =3D VM_FAULT=
_SIGBUS;
282a8e0391c377 Ross Zwisler            2017-02-22  1563  		goto out;
282a8e0391c377 Ross Zwisler            2017-02-22  1564  	}
642261ac995e01 Ross Zwisler            2016-11-08  1565  =

55f81639a71528 Shiyang Ruan            2021-08-10  1566  	if (dax_fault_che=
ck_fallback(vmf, &xas, max_pgoff))
642261ac995e01 Ross Zwisler            2016-11-08  1567  		goto fallback;
642261ac995e01 Ross Zwisler            2016-11-08  1568  =

876f29460cbd40 Ross Zwisler            2017-05-12  1569  	/*
b15cd800682fca Matthew Wilcox          2018-03-29  1570  	 * grab_mapping_e=
ntry() will make sure we get an empty PMD entry,
b15cd800682fca Matthew Wilcox          2018-03-29  1571  	 * a zero PMD ent=
ry or a DAX PMD.  If it can't (because a PTE
b15cd800682fca Matthew Wilcox          2018-03-29  1572  	 * entry is alrea=
dy in the array, for instance), it will return
b15cd800682fca Matthew Wilcox          2018-03-29  1573  	 * VM_FAULT_FALLB=
ACK.
876f29460cbd40 Ross Zwisler            2017-05-12  1574  	 */
23c84eb7837514 Matthew Wilcox (Oracle  2019-07-03  1575) 	entry =3D grab_ma=
pping_entry(&xas, mapping, PMD_ORDER);
b15cd800682fca Matthew Wilcox          2018-03-29  1576  	if (xa_is_interna=
l(entry)) {
c2436190e492b2 Shiyang Ruan            2021-08-10  1577  		ret =3D xa_to_in=
ternal(entry);
876f29460cbd40 Ross Zwisler            2017-05-12  1578  		goto fallback;
b15cd800682fca Matthew Wilcox          2018-03-29  1579  	}
876f29460cbd40 Ross Zwisler            2017-05-12  1580  =

e2093926a098a8 Ross Zwisler            2017-06-02  1581  	/*
e2093926a098a8 Ross Zwisler            2017-06-02  1582  	 * It is possible=
, particularly with mixed reads & writes to private
e2093926a098a8 Ross Zwisler            2017-06-02  1583  	 * mappings, that=
 we have raced with a PTE fault that overlaps with
e2093926a098a8 Ross Zwisler            2017-06-02  1584  	 * the PMD we nee=
d to set up.  If so just return and the fault will be
e2093926a098a8 Ross Zwisler            2017-06-02  1585  	 * retried.
e2093926a098a8 Ross Zwisler            2017-06-02  1586  	 */
e2093926a098a8 Ross Zwisler            2017-06-02  1587  	if (!pmd_none(*vm=
f->pmd) && !pmd_trans_huge(*vmf->pmd) &&
e2093926a098a8 Ross Zwisler            2017-06-02  1588  			!pmd_devmap(*vm=
f->pmd)) {
c2436190e492b2 Shiyang Ruan            2021-08-10  1589  		ret =3D 0;
e2093926a098a8 Ross Zwisler            2017-06-02  1590  		goto unlock_entr=
y;
e2093926a098a8 Ross Zwisler            2017-06-02  1591  	}
e2093926a098a8 Ross Zwisler            2017-06-02  1592  =

65dd814a6187ff Christoph Hellwig       2021-08-10  1593  	iter.pos =3D (lof=
f_t)xas.xa_index << PAGE_SHIFT;
65dd814a6187ff Christoph Hellwig       2021-08-10 @1594  	while ((error =3D=
 iomap_iter(&iter, ops)) > 0) {
65dd814a6187ff Christoph Hellwig       2021-08-10  1595  		if (iomap_length=
(&iter) < PMD_SIZE)
65dd814a6187ff Christoph Hellwig       2021-08-10  1596  			continue; /* ac=
tually breaks out of the loop */
642261ac995e01 Ross Zwisler            2016-11-08  1597  =

65dd814a6187ff Christoph Hellwig       2021-08-10  1598  		ret =3D dax_faul=
t_iter(vmf, &iter, pfnp, &xas, &entry, true);
65dd814a6187ff Christoph Hellwig       2021-08-10  1599  		if (ret !=3D VM_=
FAULT_FALLBACK)
65dd814a6187ff Christoph Hellwig       2021-08-10  1600  			iter.processed =
=3D PMD_SIZE;
642261ac995e01 Ross Zwisler            2016-11-08  1601  	}
65dd814a6187ff Christoph Hellwig       2021-08-10  1602  =

876f29460cbd40 Ross Zwisler            2017-05-12  1603  unlock_entry:
b15cd800682fca Matthew Wilcox          2018-03-29  1604  	dax_unlock_entry(=
&xas, entry);
642261ac995e01 Ross Zwisler            2016-11-08  1605  fallback:
c2436190e492b2 Shiyang Ruan            2021-08-10  1606  	if (ret =3D=3D VM=
_FAULT_FALLBACK) {
65dd814a6187ff Christoph Hellwig       2021-08-10  1607  		split_huge_pmd(v=
mf->vma, vmf->pmd, vmf->address);
642261ac995e01 Ross Zwisler            2016-11-08  1608  		count_vm_event(T=
HP_FAULT_FALLBACK);
642261ac995e01 Ross Zwisler            2016-11-08  1609  	}
282a8e0391c377 Ross Zwisler            2017-02-22  1610  out:
65dd814a6187ff Christoph Hellwig       2021-08-10  1611  	trace_dax_pmd_fau=
lt_done(iter.inode, vmf, max_pgoff, ret);
c2436190e492b2 Shiyang Ruan            2021-08-10  1612  	return ret;
642261ac995e01 Ross Zwisler            2016-11-08  1613  }
a2d581675d485e Dave Jiang              2017-02-24  1614  #else
ab77dab46210bb Souptick Joarder        2018-06-07  1615  static vm_fault_t =
dax_iomap_pmd_fault(struct vm_fault *vmf, pfn_t *pfnp,
01cddfe99008da Arnd Bergmann           2017-02-27  1616  			       const st=
ruct iomap_ops *ops)
a2d581675d485e Dave Jiang              2017-02-24  1617  {
a2d581675d485e Dave Jiang              2017-02-24  1618  	return VM_FAULT_F=
ALLBACK;
a2d581675d485e Dave Jiang              2017-02-24  1619  }
642261ac995e01 Ross Zwisler            2016-11-08  1620  #endif /* CONFIG_F=
S_DAX_PMD */
a2d581675d485e Dave Jiang              2017-02-24  1621  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7417923481741256679==--

