Content-Type: multipart/mixed; boundary="===============5789125304426501569=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: fs/ext4/ioctl.c:53:27: warning: Local variable 'es' shadows outer argument [shadowArgument]
Date: Sun, 29 May 2022 02:36:53 +0800
Message-ID: <202205290255.k6DQJcOb-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5789125304426501569==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Lukas Czerner <lczerner@redhat.com>
CC: "Theodore Ts'o" <tytso@mit.edu>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   9d004b2f4fea97cde123e7f1939b80e77bf2e695
commit: bbc605cdb1e15aafaec899fedc385dc75dddac0e ext4: implement support fo=
r get/set fs label
date:   5 months ago
:::::: branch date: 14 hours ago
:::::: commit date: 5 months ago
compiler: riscv64-linux-gcc (GCC) 11.3.0
reproduce (cppcheck warning):
        # apt-get install cppcheck
        git checkout bbc605cdb1e15aafaec899fedc385dc75dddac0e
        cppcheck --quiet --enable=3Dstyle,performance,portability --templat=
e=3Dgcc FILE

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> fs/ext4/ioctl.c:53:27: warning: Local variable 'es' shadows outer argume=
nt [shadowArgument]
    struct ext4_super_block *es =3D sbi->s_es;
                             ^
   fs/ext4/ioctl.c:47:0: note: Shadowed declaration
         ext4_update_sb_callback func,
   ^
   fs/ext4/ioctl.c:53:27: note: Shadow variable
    struct ext4_super_block *es =3D sbi->s_es;
                             ^
   fs/ext4/ioctl.c:102:27: warning: Local variable 'es' shadows outer argum=
ent [shadowArgument]
    struct ext4_super_block *es;
                             ^
   fs/ext4/ioctl.c:96:0: note: Shadowed declaration
        ext4_update_sb_callback func, const void *arg)
   ^
   fs/ext4/ioctl.c:102:27: note: Shadow variable
    struct ext4_super_block *es;
                             ^
   fs/ext4/ext4.h:593:2: warning: Shifting signed 32-bit value by 31 bits i=
s implementation-defined behaviour [shiftTooManyBitsSigned]
    CHECK_FLAG_VALUE(RESERVED);
    ^
   fs/ext4/ext4.h:593:2: warning: Signed integer overflow for expression '1=
<<EXT4_INODE_RESERVED'. [integerOverflow]
    CHECK_FLAG_VALUE(RESERVED);
    ^
   fs/ext4/ext4_jbd2.h:402:9: warning: Variable '__ensure_end' is not assig=
ned a value. [unassignedVariable]
    return ext4_journal_ensure_credits_fn(handle, credits, credits,
           ^
>> fs/jbd2/journal.c:1165:59: warning: Parameter 'v' can be declared with c=
onst [constParameter]
   static int jbd2_seq_info_show(struct seq_file *seq, void *v)
                                                             ^
>> fs/jbd2/journal.c:894:35: warning: Uninitialized variable: blocknr [unin=
itvar]
    ret =3D jbd2_journal_bmap(journal, blocknr, &pblock);
                                     ^
   fs/jbd2/journal.c:883:46: note: Assuming condition is false
    if (journal->j_fc_off + journal->j_fc_first < journal->j_fc_last) {
                                                ^
   fs/jbd2/journal.c:894:35: note: Uninitialized variable: blocknr
    ret =3D jbd2_journal_bmap(journal, blocknr, &pblock);
                                     ^

vim +/es +53 fs/ext4/ioctl.c

bbc605cdb1e15a Lukas Czerner 2021-12-13  44  =

bbc605cdb1e15a Lukas Czerner 2021-12-13  45  static
bbc605cdb1e15a Lukas Czerner 2021-12-13  46  int ext4_update_primary_sb(str=
uct super_block *sb, handle_t *handle,
bbc605cdb1e15a Lukas Czerner 2021-12-13  47  			   ext4_update_sb_callback =
func,
bbc605cdb1e15a Lukas Czerner 2021-12-13  48  			   const void *arg)
bbc605cdb1e15a Lukas Czerner 2021-12-13  49  {
bbc605cdb1e15a Lukas Czerner 2021-12-13  50  	int err =3D 0;
bbc605cdb1e15a Lukas Czerner 2021-12-13  51  	struct ext4_sb_info *sbi =3D =
EXT4_SB(sb);
bbc605cdb1e15a Lukas Czerner 2021-12-13  52  	struct buffer_head *bh =3D sb=
i->s_sbh;
bbc605cdb1e15a Lukas Czerner 2021-12-13 @53  	struct ext4_super_block *es =
=3D sbi->s_es;
bbc605cdb1e15a Lukas Czerner 2021-12-13  54  =

bbc605cdb1e15a Lukas Czerner 2021-12-13  55  	trace_ext4_update_sb(sb, bh->=
b_blocknr, 1);
bbc605cdb1e15a Lukas Czerner 2021-12-13  56  =

bbc605cdb1e15a Lukas Czerner 2021-12-13  57  	BUFFER_TRACE(bh, "get_write_a=
ccess");
bbc605cdb1e15a Lukas Czerner 2021-12-13  58  	err =3D ext4_journal_get_writ=
e_access(handle, sb,
bbc605cdb1e15a Lukas Czerner 2021-12-13  59  					    bh,
bbc605cdb1e15a Lukas Czerner 2021-12-13  60  					    EXT4_JTR_NONE);
bbc605cdb1e15a Lukas Czerner 2021-12-13  61  	if (err)
bbc605cdb1e15a Lukas Czerner 2021-12-13  62  		goto out_err;
bbc605cdb1e15a Lukas Czerner 2021-12-13  63  =

bbc605cdb1e15a Lukas Czerner 2021-12-13  64  	lock_buffer(bh);
bbc605cdb1e15a Lukas Czerner 2021-12-13  65  	func(es, arg);
bbc605cdb1e15a Lukas Czerner 2021-12-13  66  	ext4_superblock_csum_set(sb);
bbc605cdb1e15a Lukas Czerner 2021-12-13  67  	unlock_buffer(bh);
bbc605cdb1e15a Lukas Czerner 2021-12-13  68  =

bbc605cdb1e15a Lukas Czerner 2021-12-13  69  	if (buffer_write_io_error(bh)=
 || !buffer_uptodate(bh)) {
bbc605cdb1e15a Lukas Czerner 2021-12-13  70  		ext4_msg(sbi->s_sb, KERN_ERR=
, "previous I/O error to "
bbc605cdb1e15a Lukas Czerner 2021-12-13  71  			 "superblock detected");
bbc605cdb1e15a Lukas Czerner 2021-12-13  72  		clear_buffer_write_io_error(=
bh);
bbc605cdb1e15a Lukas Czerner 2021-12-13  73  		set_buffer_uptodate(bh);
bbc605cdb1e15a Lukas Czerner 2021-12-13  74  	}
bbc605cdb1e15a Lukas Czerner 2021-12-13  75  =

bbc605cdb1e15a Lukas Czerner 2021-12-13  76  	err =3D ext4_handle_dirty_met=
adata(handle, NULL, bh);
bbc605cdb1e15a Lukas Czerner 2021-12-13  77  	if (err)
bbc605cdb1e15a Lukas Czerner 2021-12-13  78  		goto out_err;
bbc605cdb1e15a Lukas Czerner 2021-12-13  79  	err =3D sync_dirty_buffer(bh);
bbc605cdb1e15a Lukas Czerner 2021-12-13  80  out_err:
bbc605cdb1e15a Lukas Czerner 2021-12-13  81  	ext4_std_error(sb, err);
bbc605cdb1e15a Lukas Czerner 2021-12-13  82  	return err;
bbc605cdb1e15a Lukas Czerner 2021-12-13  83  }
bbc605cdb1e15a Lukas Czerner 2021-12-13  84  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5789125304426501569==--

