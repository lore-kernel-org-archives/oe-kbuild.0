Content-Type: multipart/mixed; boundary="===============4904275071324631198=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [rt-devel:linux-5.17.y-rt-rebase 15/117] kernel/printk/printk.c:2900:2: warning: Value stored to 'seq' is never read [clang-analyzer-deadcode.DeadStores]
Date: Mon, 21 Mar 2022 10:42:18 +0800
Message-ID: <202203211057.YGet3H0w-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4904275071324631198==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: John Ogness <john.ogness@linutronix.de>
CC: Sebastian Andrzej Siewior <bigeasy@linutronix.de>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel.g=
it linux-5.17.y-rt-rebase
head:   12b31505d173e33e63ab2dd198cb7d92433184fd
commit: fd6bde1ae126448aa36d5bf26ed2ae997009645b [15/117] printk: add infra=
stucture for atomic consoles
:::::: branch date: 7 days ago
:::::: commit date: 7 days ago
config: riscv-randconfig-c006-20220320 (https://download.01.org/0day-ci/arc=
hive/20220321/202203211057.YGet3H0w-lkp(a)intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project 85e9b2=
687a13d1908aa86d1b89c5ce398a06cd39)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install riscv cross compiling tool for clang build
        # apt-get install binutils-riscv64-linux-gnu
        # https://git.kernel.org/pub/scm/linux/kernel/git/rt/linux-rt-devel=
.git/commit/?id=3Dfd6bde1ae126448aa36d5bf26ed2ae997009645b
        git remote add rt-devel https://git.kernel.org/pub/scm/linux/kernel=
/git/rt/linux-rt-devel.git
        git fetch --no-tags rt-devel linux-5.17.y-rt-rebase
        git checkout fd6bde1ae126448aa36d5bf26ed2ae997009645b
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Driscv clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   7 warnings generated.
   mm/compaction.c:93:2: warning: Assigned value is garbage or undefined [c=
lang-analyzer-core.uninitialized.Assign]
           list_for_each_entry_safe(page, next, list, lru) {
           ^
   include/linux/list.h:726:7: note: expanded from macro 'list_for_each_ent=
ry_safe'
                   n =3D list_next_entry(pos, member);                     =
  \
                       ^
   include/linux/list.h:564:2: note: expanded from macro 'list_next_entry'
           list_entry((pos)->member.next, typeof(*(pos)), member)
           ^
   include/linux/list.h:520:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^
   include/linux/container_of.h:18:2: note: expanded from macro 'container_=
of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
           ^
   mm/compaction.c:703:6: note: Assuming 'block_start_pfn' is >=3D field 'z=
one_start_pfn'
           if (block_start_pfn < cc->zone->zone_start_pfn)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/compaction.c:703:2: note: Taking false branch
           if (block_start_pfn < cc->zone->zone_start_pfn)
           ^
   mm/compaction.c:707:9: note: Assuming 'pfn' is >=3D 'end_pfn'
           for (; pfn < end_pfn; pfn +=3D isolated,
                  ^~~~~~~~~~~~~
   mm/compaction.c:707:2: note: Loop condition is false. Execution continue=
s on line 749
           for (; pfn < end_pfn; pfn +=3D isolated,
           ^
   mm/compaction.c:749:2: note: Calling 'split_map_pages'
           split_map_pages(&freelist);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~
   mm/compaction.c:93:2: note: Assigned value is garbage or undefined
           list_for_each_entry_safe(page, next, list, lru) {
           ^
   include/linux/list.h:726:7: note: expanded from macro 'list_for_each_ent=
ry_safe'
                   n =3D list_next_entry(pos, member);                     =
  \
                       ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:564:2: note: expanded from macro 'list_next_entry'
           list_entry((pos)->member.next, typeof(*(pos)), member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/list.h:520:2: note: expanded from macro 'list_entry'
           container_of(ptr, type, member)
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/container_of.h:18:2: note: expanded from macro 'container_=
of'
           void *__mptr =3D (void *)(ptr);                                 =
  \
           ^              ~~~~~~~~~~~~~
   Suppressed 6 warnings (2 in non-user code, 4 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   4 warnings generated.
   Suppressed 4 warnings (4 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (2 in non-user code, 1 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   5 warnings generated.
   kernel/printk/printk.c:157:3: warning: Call to function 'strcpy' is inse=
cure as it does not provide bounding of the memory buffer. Replace unbounde=
d copy functions with analogous functions that support length arguments suc=
h as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(devkmsg_log_str, "on");
                   ^~~~~~
   kernel/printk/printk.c:157:3: note: Call to function 'strcpy' is insecur=
e as it does not provide bounding of the memory buffer. Replace unbounded c=
opy functions with analogous functions that support length arguments such a=
s 'strlcpy'. CWE-119
                   strcpy(devkmsg_log_str, "on");
                   ^~~~~~
   kernel/printk/printk.c:159:3: warning: Call to function 'strcpy' is inse=
cure as it does not provide bounding of the memory buffer. Replace unbounde=
d copy functions with analogous functions that support length arguments suc=
h as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
                   strcpy(devkmsg_log_str, "off");
                   ^~~~~~
   kernel/printk/printk.c:159:3: note: Call to function 'strcpy' is insecur=
e as it does not provide bounding of the memory buffer. Replace unbounded c=
opy functions with analogous functions that support length arguments such a=
s 'strlcpy'. CWE-119
                   strcpy(devkmsg_log_str, "off");
                   ^~~~~~
>> kernel/printk/printk.c:2900:2: warning: Value stored to 'seq' is never r=
ead [clang-analyzer-deadcode.DeadStores]
           seq =3D read_console_seq(con);
           ^     ~~~~~~~~~~~~~~~~~~~~~
   kernel/printk/printk.c:2900:2: note: Value stored to 'seq' is never read
           seq =3D read_console_seq(con);
           ^     ~~~~~~~~~~~~~~~~~~~~~
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   2 warnings generated.
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   Suppressed 3 warnings (3 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   fs/btrfs/disk-io.c:3483:3: warning: Value stored to 'features' is never =
read [clang-analyzer-deadcode.DeadStores]
                   features |=3D BTRFS_FEATURE_INCOMPAT_BIG_METADATA;
                   ^
   fs/btrfs/disk-io.c:3483:3: note: Value stored to 'features' is never read
   Suppressed 2 warnings (2 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   3 warnings generated.
   fs/btrfs/transaction.c:1962:6: warning: Use of memory after it is freed =
[clang-analyzer-unix.Malloc]
                      cur_trans->state >=3D TRANS_STATE_COMMIT_START ||
                      ^
   include/linux/wait.h:343:6: note: expanded from macro 'wait_event'
           if (condition)                                                  =
        \
               ^~~~~~~~~
   fs/btrfs/transaction.c:1955:2: note: Calling 'btrfs_end_transaction'
           btrfs_end_transaction(trans);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/transaction.c:1046:9: note: Calling '__btrfs_end_transaction'
           return __btrfs_end_transaction(trans, 0);
                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/transaction.c:1002:6: note: Assuming the condition is false
           if (refcount_read(&trans->use_count) > 1) {
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/transaction.c:1002:2: note: Taking false branch
           if (refcount_read(&trans->use_count) > 1) {
           ^
   fs/btrfs/transaction.c:1015:6: note: Assuming the condition is false
           if (trans->type & __TRANS_FREEZABLE)
               ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/transaction.c:1015:2: note: Taking false branch
           if (trans->type & __TRANS_FREEZABLE)
           ^
   fs/btrfs/transaction.c:1018:10: note: Assuming 'cur_trans' is equal to f=
ield 'running_transaction'
           WARN_ON(cur_trans !=3D info->running_transaction);
                   ^
   include/asm-generic/bug.h:166:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   fs/btrfs/transaction.c:1019:10: note: Assuming the condition is false
           WARN_ON(atomic_read(&cur_trans->num_writers) < 1);
                   ^
   include/asm-generic/bug.h:166:25: note: expanded from macro 'WARN_ON'
           int __ret_warn_on =3D !!(condition);                            =
  \
                                  ^~~~~~~~~
   fs/btrfs/transaction.c:1024:2: note: Calling 'btrfs_put_transaction'
           btrfs_put_transaction(cur_trans);
           ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/transaction.c:125:2: note: Assuming '__ret_warn_on' is not equa=
l to 0
           WARN_ON(refcount_read(&transaction->use_count) =3D=3D 0);
           ^
   include/asm-generic/bug.h:167:2: note: expanded from macro 'WARN_ON'
           unlikely(__ret_warn_on);                                        \
           ^~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:48:24: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:33:32: note: expanded from macro '__branch_chec=
k__'
                           ______r =3D __builtin_expect(!!(x), expect);    =
  \
                                                       ^~~~
   fs/btrfs/transaction.c:126:2: note: Taking true branch
           if (refcount_dec_and_test(&transaction->use_count)) {
           ^
   fs/btrfs/transaction.c:127:3: note: Assuming the condition is false
                   BUG_ON(!list_empty(&transaction->list));
                   ^
   include/asm-generic/bug.h:161:36: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                      ^~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:48:24: note: expanded from macro 'unlikely'
   #  define unlikely(x)   (__branch_check__(x, 0, __builtin_constant_p(x)))
                            ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   include/linux/compiler.h:23:50: note: expanded from macro '__branch_chec=
k__'
   #define __branch_check__(x, expect, is_constant) ({                     \
                                                    ^~~~~~~~~~~~~~~~~~~~~~~~
   fs/btrfs/transaction.c:127:3: note: Taking false branch
                   BUG_ON(!list_empty(&transaction->list));
                   ^
   include/asm-generic/bug.h:161:32: note: expanded from macro 'BUG_ON'
   #define BUG_ON(condition) do { if (unlikely(condition)) BUG(); } while (=
0)
                                  ^
   fs/btrfs/transaction.c:127:3: note: Loop condition is false.  Exiting lo=
op
                   BUG_ON(!list_empty(&transaction->list));
                   ^
   include/asm-generic/bug.h:161:27: note: expanded from macro 'BUG_ON'

vim +/seq +2900 kernel/printk/printk.c

fd6bde1ae12644 kernel/printk/printk.c John Ogness             2022-02-04  2=
858  =

4d8b5793c22f45 kernel/printk/printk.c John Ogness             2022-02-07  2=
859  /*
4d8b5793c22f45 kernel/printk/printk.c John Ogness             2022-02-07  2=
860   * Print one record for the given console. The record printed is whate=
ver
4d8b5793c22f45 kernel/printk/printk.c John Ogness             2022-02-07  2=
861   * record is the next available record for the given console.
^1da177e4c3f41 kernel/printk.c        Linus Torvalds          2005-04-16  2=
862   *
39faa1897af534 kernel/printk/printk.c John Ogness             2022-02-07  2=
863   * @text is a buffer of size CONSOLE_LOG_MAX.
39faa1897af534 kernel/printk/printk.c John Ogness             2022-02-07  2=
864   *
39faa1897af534 kernel/printk/printk.c John Ogness             2022-02-07  2=
865   * If extended messages should be printed, @ext_text is a buffer of si=
ze
39faa1897af534 kernel/printk/printk.c John Ogness             2022-02-07  2=
866   * CONSOLE_EXT_LOG_MAX. Otherwise @ext_text must be NULL.
39faa1897af534 kernel/printk/printk.c John Ogness             2022-02-07  2=
867   *
39faa1897af534 kernel/printk/printk.c John Ogness             2022-02-07  2=
868   * If dropped messages should be printed, @dropped_text is a buffer of=
 size
39faa1897af534 kernel/printk/printk.c John Ogness             2022-02-07  2=
869   * DROPPED_TEXT_MAX. Otherwise @dropped_text must be NULL.
39faa1897af534 kernel/printk/printk.c John Ogness             2022-02-07  2=
870   *
fd6bde1ae12644 kernel/printk/printk.c John Ogness             2022-02-04  2=
871   * @atomic_printing specifies if atomic printing should be used.
fd6bde1ae12644 kernel/printk/printk.c John Ogness             2022-02-04  2=
872   *
4d8b5793c22f45 kernel/printk/printk.c John Ogness             2022-02-07  2=
873   * Requires the console_lock.
^1da177e4c3f41 kernel/printk.c        Linus Torvalds          2005-04-16  2=
874   *
4d8b5793c22f45 kernel/printk/printk.c John Ogness             2022-02-07  2=
875   * Returns false if the given console has no next record to print, oth=
erwise
4d8b5793c22f45 kernel/printk/printk.c John Ogness             2022-02-07  2=
876   * true.
^1da177e4c3f41 kernel/printk.c        Linus Torvalds          2005-04-16  2=
877   *
4d8b5793c22f45 kernel/printk/printk.c John Ogness             2022-02-07  2=
878   * @handover will be set to true if a printk waiter has taken over the
4d8b5793c22f45 kernel/printk/printk.c John Ogness             2022-02-07  2=
879   * console_lock, in which case the caller is no longer holding the
635b43f09ca747 kernel/printk/printk.c John Ogness             2022-02-07  2=
880   * console_lock. Otherwise it is set to false. A NULL pointer may be p=
rovided
635b43f09ca747 kernel/printk/printk.c John Ogness             2022-02-07  2=
881   * to disable allowing the console_lock to be taken over by a printk w=
aiter.
^1da177e4c3f41 kernel/printk.c        Linus Torvalds          2005-04-16  2=
882   */
39faa1897af534 kernel/printk/printk.c John Ogness             2022-02-07  2=
883  static bool console_emit_next_record(struct console *con, char *text, =
char *ext_text,
fd6bde1ae12644 kernel/printk/printk.c John Ogness             2022-02-04  2=
884  				     char *dropped_text, bool atomic_printing,
fd6bde1ae12644 kernel/printk/printk.c John Ogness             2022-02-04  2=
885  				     bool *handover)
^1da177e4c3f41 kernel/printk.c        Linus Torvalds          2005-04-16  2=
886  {
896fbe20b4e233 kernel/printk/printk.c John Ogness             2020-07-09  2=
887  	struct printk_info info;
896fbe20b4e233 kernel/printk/printk.c John Ogness             2020-07-09  2=
888  	struct printk_record r;
4d8b5793c22f45 kernel/printk/printk.c John Ogness             2022-02-07  2=
889  	unsigned long flags;
635b43f09ca747 kernel/printk/printk.c John Ogness             2022-02-07  2=
890  	bool allow_handover;
4d8b5793c22f45 kernel/printk/printk.c John Ogness             2022-02-07  2=
891  	char *write_text;
4d8b5793c22f45 kernel/printk/printk.c John Ogness             2022-02-07  2=
892  	size_t len;
fd6bde1ae12644 kernel/printk/printk.c John Ogness             2022-02-04  2=
893  	u64 seq;
78944e549d3667 kernel/printk.c        Antonino A. Daplas      2006-08-05  2=
894  =

39faa1897af534 kernel/printk/printk.c John Ogness             2022-02-07  2=
895  	prb_rec_init_rd(&r, &info, text, CONSOLE_LOG_MAX);
896fbe20b4e233 kernel/printk/printk.c John Ogness             2020-07-09  2=
896  =

635b43f09ca747 kernel/printk/printk.c John Ogness             2022-02-07  2=
897  	if (handover)
4d8b5793c22f45 kernel/printk/printk.c John Ogness             2022-02-07  2=
898  		*handover =3D false;
7ff9554bb578ba kernel/printk.c        Kay Sievers             2012-05-03  2=
899  =

fd6bde1ae12644 kernel/printk/printk.c John Ogness             2022-02-04 @2=
900  	seq =3D read_console_seq(con);
fd6bde1ae12644 kernel/printk/printk.c John Ogness             2022-02-04  2=
901  =

fd6bde1ae12644 kernel/printk/printk.c John Ogness             2022-02-04  2=
902  	if (!prb_read_valid(prb, seq, &r))
4d8b5793c22f45 kernel/printk/printk.c John Ogness             2022-02-07  2=
903  		return false;
7ff9554bb578ba kernel/printk.c        Kay Sievers             2012-05-03  2=
904  =

fd6bde1ae12644 kernel/printk/printk.c John Ogness             2022-02-04  2=
905  	if (seq !=3D r.info->seq) {
fd6bde1ae12644 kernel/printk/printk.c John Ogness             2022-02-04  2=
906  		atomic_long_add((unsigned long)(r.info->seq - seq), &con->dropped);
fd6bde1ae12644 kernel/printk/printk.c John Ogness             2022-02-04  2=
907  		write_console_seq(con, r.info->seq, atomic_printing);
fd6bde1ae12644 kernel/printk/printk.c John Ogness             2022-02-04  2=
908  		seq =3D r.info->seq;
896fbe20b4e233 kernel/printk/printk.c John Ogness             2020-07-09  2=
909  	}
896fbe20b4e233 kernel/printk/printk.c John Ogness             2020-07-09  2=
910  =

4d8b5793c22f45 kernel/printk/printk.c John Ogness             2022-02-07  2=
911  	/* Skip record that has level above the console loglevel. */
896fbe20b4e233 kernel/printk/printk.c John Ogness             2020-07-09  2=
912  	if (suppress_message_printing(r.info->level)) {
fd6bde1ae12644 kernel/printk/printk.c John Ogness             2022-02-04  2=
913  		write_console_seq(con, seq + 1, atomic_printing);
084681d14e429c kernel/printk.c        Kay Sievers             2012-06-28  2=
914  		goto skip;
084681d14e429c kernel/printk.c        Kay Sievers             2012-06-28  2=
915  	}
649e6ee33f73ba kernel/printk.c        Kay Sievers             2012-05-10  2=
916  =

39faa1897af534 kernel/printk/printk.c John Ogness             2022-02-07  2=
917  	if (ext_text) {
39faa1897af534 kernel/printk/printk.c John Ogness             2022-02-07  2=
918  		write_text =3D ext_text;
39faa1897af534 kernel/printk/printk.c John Ogness             2022-02-07  2=
919  		len =3D info_print_ext_header(ext_text, CONSOLE_EXT_LOG_MAX, r.info);
39faa1897af534 kernel/printk/printk.c John Ogness             2022-02-07  2=
920  		len +=3D msg_print_ext_body(ext_text + len, CONSOLE_EXT_LOG_MAX - le=
n,
4d8b5793c22f45 kernel/printk/printk.c John Ogness             2022-02-07  2=
921  					  &r.text_buf[0], r.info->text_len, &r.info->dev_info);
4d8b5793c22f45 kernel/printk/printk.c John Ogness             2022-02-07  2=
922  	} else {
39faa1897af534 kernel/printk/printk.c John Ogness             2022-02-07  2=
923  		write_text =3D text;
4d8b5793c22f45 kernel/printk/printk.c John Ogness             2022-02-07  2=
924  		len =3D record_print_text(&r, console_msg_format & MSG_FORMAT_SYSLOG=
, printk_time);
6fe29354befe4c kernel/printk/printk.c Tejun Heo               2015-06-25  2=
925  	}
7ff9554bb578ba kernel/printk.c        Kay Sievers             2012-05-03  2=
926  =

635b43f09ca747 kernel/printk/printk.c John Ogness             2022-02-07  2=
927  	/* Handovers may only happen between trylock contexts. */
635b43f09ca747 kernel/printk/printk.c John Ogness             2022-02-07  2=
928  	allow_handover =3D (handover && atomic_read(&console_lock_count) =3D=
=3D -1);
635b43f09ca747 kernel/printk/printk.c John Ogness             2022-02-07  2=
929  =

635b43f09ca747 kernel/printk/printk.c John Ogness             2022-02-07  2=
930  	if (allow_handover) {
dbdda842fe96f8 kernel/printk/printk.c Steven Rostedt (VMware  2018-01-10  2=
931) 		/*
dbdda842fe96f8 kernel/printk/printk.c Steven Rostedt (VMware  2018-01-10  2=
932) 		 * While actively printing out messages, if another printk()
dbdda842fe96f8 kernel/printk/printk.c Steven Rostedt (VMware  2018-01-10  2=
933) 		 * were to occur on another CPU, it may wait for this one to
dbdda842fe96f8 kernel/printk/printk.c Steven Rostedt (VMware  2018-01-10  2=
934) 		 * finish. This task can not be preempted if there is a
dbdda842fe96f8 kernel/printk/printk.c Steven Rostedt (VMware  2018-01-10  2=
935) 		 * waiter waiting to take over.
93d102f094be9b kernel/printk/printk.c John Ogness             2021-07-15  2=
936  		 *
93d102f094be9b kernel/printk/printk.c John Ogness             2021-07-15  2=
937  		 * Interrupts are disabled because the hand over to a waiter
93d102f094be9b kernel/printk/printk.c John Ogness             2021-07-15  2=
938  		 * must not be interrupted until the hand over is completed
93d102f094be9b kernel/printk/printk.c John Ogness             2021-07-15  2=
939  		 * (@console_waiter is cleared).
dbdda842fe96f8 kernel/printk/printk.c Steven Rostedt (VMware  2018-01-10  2=
940) 		 */
93d102f094be9b kernel/printk/printk.c John Ogness             2021-07-15  2=
941  		printk_safe_enter_irqsave(flags);
c162d5b4338d72 kernel/printk/printk.c Petr Mladek             2018-01-12  2=
942  		console_lock_spinning_enable();
635b43f09ca747 kernel/printk/printk.c John Ogness             2022-02-07  2=
943  	}
dbdda842fe96f8 kernel/printk/printk.c Steven Rostedt (VMware  2018-01-10  2=
944) =

81d68a96a39844 kernel/printk.c        Steven Rostedt          2008-05-12  2=
945  	stop_critical_timings();	/* don't trace print latency */
fd6bde1ae12644 kernel/printk/printk.c John Ogness             2022-02-04  2=
946  	call_console_driver(con, write_text, len, dropped_text, atomic_printi=
ng);
81d68a96a39844 kernel/printk.c        Steven Rostedt          2008-05-12  2=
947  	start_critical_timings();
dbdda842fe96f8 kernel/printk/printk.c Steven Rostedt (VMware  2018-01-10  2=
948) =

fd6bde1ae12644 kernel/printk/printk.c John Ogness             2022-02-04  2=
949  	write_console_seq(con, seq + 1, atomic_printing);
4d8b5793c22f45 kernel/printk/printk.c John Ogness             2022-02-07  2=
950  =

635b43f09ca747 kernel/printk/printk.c John Ogness             2022-02-07  2=
951  	if (allow_handover) {
4d8b5793c22f45 kernel/printk/printk.c John Ogness             2022-02-07  2=
952  		*handover =3D console_lock_spinning_disable_and_check();
c162d5b4338d72 kernel/printk/printk.c Petr Mladek             2018-01-12  2=
953  		printk_safe_exit_irqrestore(flags);
635b43f09ca747 kernel/printk/printk.c John Ogness             2022-02-07  2=
954  	}
4d8b5793c22f45 kernel/printk/printk.c John Ogness             2022-02-07  2=
955  =

4d8b5793c22f45 kernel/printk/printk.c John Ogness             2022-02-07  2=
956  	printk_delay(r.info->level);
4d8b5793c22f45 kernel/printk/printk.c John Ogness             2022-02-07  2=
957  skip:
4d8b5793c22f45 kernel/printk/printk.c John Ogness             2022-02-07  2=
958  	return true;
4d8b5793c22f45 kernel/printk/printk.c John Ogness             2022-02-07  2=
959  }
4d8b5793c22f45 kernel/printk/printk.c John Ogness             2022-02-07  2=
960  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4904275071324631198==--

