Content-Type: multipart/mixed; boundary="===============7022532048562512986=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: [f2fs:dev-test 11/18] fs/f2fs/file.c:764:9: warning: Identical condition and return expression 'err', return value is always 0 [identicalConditionAfterEarlyExit]
Date: Tue, 21 Apr 2020 15:13:06 +0800
Message-ID: <202004211558.d7hhGq9S%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7022532048562512986==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-f2fs-devel(a)lists.sourceforge.net
TO: Chao Yu <yuchao0@huawei.com>, Chao Yu <chao@kernel.org>
CC: Jaegeuk Kim <jaegeuk@kernel.org>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git de=
v-test
head:   a24dac2d3e3b8411acd2cfa3a6fe1a18cae762c6
commit: 86ae1c8db4b3e9d4c34dd69f6324cddab61bc572 [11/18] f2fs: support part=
ial truncation on compressed inode
:::::: branch date: 15 hours ago
:::::: commit date: 4 days ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> fs/f2fs/file.c:764:9: warning: Identical condition and return expression=
 'err', return value is always 0 [identicalConditionAfterEarlyExit]
    return err;
           ^
   fs/f2fs/file.c:756:6: note: If condition 'err' is true, the function wil=
l return/exit
    if (err)
        ^
   fs/f2fs/file.c:764:9: note: Returning identical expression 'err'
    return err;
           ^
   fs/f2fs/node.h:169:30: warning: Checking if unsigned expression 'nm_i->n=
id_cnt[FREE_NID]' is less than zero. [unsignedLessThanZero]
    if (nm_i->nid_cnt[FREE_NID] <=3D 0) {
                                ^
   fs/f2fs/f2fs.h:2213:15: warning: Local variable 'valid_node_count' shado=
ws outer function [shadowFunction]
    unsigned int valid_node_count, user_block_count;
                 ^
   fs/f2fs/f2fs.h:2309:28: note: Shadowed declaration
   static inline unsigned int valid_node_count(struct f2fs_sb_info *sbi)
                              ^
   fs/f2fs/f2fs.h:2213:15: note: Shadow variable
    unsigned int valid_node_count, user_block_count;
                 ^
   fs/f2fs/file.c:1649:11: warning: Local variable 'len' shadows outer argu=
ment [shadowArgument]
     block_t len =3D (map.m_len >> sbi->log_blocks_per_seg) <<
             ^
   fs/f2fs/file.c:1616:13: note: Shadowed declaration
        loff_t len, int mode)
               ^
   fs/f2fs/file.c:1649:11: note: Shadow variable
     block_t len =3D (map.m_len >> sbi->log_blocks_per_seg) <<
             ^

# https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk/f2fs.git/commit/?=
id=3D86ae1c8db4b3e9d4c34dd69f6324cddab61bc572
git remote add f2fs https://git.kernel.org/pub/scm/linux/kernel/git/jaegeuk=
/f2fs.git
git remote update f2fs
git checkout 86ae1c8db4b3e9d4c34dd69f6324cddab61bc572
vim +/err +764 fs/f2fs/file.c

4c8ff7095bef64 Chao Yu 2019-11-01  763  =

86ae1c8db4b3e9 Chao Yu 2020-03-18 @764  	return err;
4c8ff7095bef64 Chao Yu 2019-11-01  765  }
4c8ff7095bef64 Chao Yu 2019-11-01  766  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org
--===============7022532048562512986==--

