Content-Type: multipart/mixed; boundary="===============5440294675432165272=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: fs/ext4/orphan.c:329:5: warning: Identical inner 'if' condition is always true. [identicalInnerCondition]
Date: Fri, 11 Feb 2022 04:16:33 +0800
Message-ID: <202202110418.frFmRT20-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5440294675432165272==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Jan Kara <jack@suse.cz>
CC: "Theodore Ts'o" <tytso@mit.edu>
CC: Andreas Dilger <adilger@dilger.ca>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   e3c85076d7a6f986445b9008be7e7f83d1b0780a
commit: 25c6d98fc4c245d164cf688815a7b259257ead2a ext4: Move orphan inode ha=
ndling into a separate file
date:   5 months ago
:::::: branch date: 6 hours ago
:::::: commit date: 5 months ago
compiler: sparc64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   In file included from fs/ext4/orphan.c:
>> fs/ext4/orphan.c:329:5: warning: Identical inner 'if' condition is alway=
s true. [identicalInnerCondition]
       ext4_std_error(inode->i_sb, ret);
       ^
   fs/ext4/orphan.c:322:8: note: outer condition: ret
      if (ret) {
          ^
   fs/ext4/orphan.c:329:5: note: identical inner condition: ret
       ext4_std_error(inode->i_sb, ret);
       ^

vim +/if +329 fs/ext4/orphan.c

25c6d98fc4c245 Jan Kara 2021-08-16  290  =

25c6d98fc4c245 Jan Kara 2021-08-16  291  	while (es->s_last_orphan) {
25c6d98fc4c245 Jan Kara 2021-08-16  292  		struct inode *inode;
25c6d98fc4c245 Jan Kara 2021-08-16  293  =

25c6d98fc4c245 Jan Kara 2021-08-16  294  		/*
25c6d98fc4c245 Jan Kara 2021-08-16  295  		 * We may have encountered an er=
ror during cleanup; if
25c6d98fc4c245 Jan Kara 2021-08-16  296  		 * so, skip the rest.
25c6d98fc4c245 Jan Kara 2021-08-16  297  		 */
25c6d98fc4c245 Jan Kara 2021-08-16  298  		if (EXT4_SB(sb)->s_mount_state &=
 EXT4_ERROR_FS) {
25c6d98fc4c245 Jan Kara 2021-08-16  299  			jbd_debug(1, "Skipping orphan r=
ecovery on fs with errors.\n");
25c6d98fc4c245 Jan Kara 2021-08-16  300  			es->s_last_orphan =3D 0;
25c6d98fc4c245 Jan Kara 2021-08-16  301  			break;
25c6d98fc4c245 Jan Kara 2021-08-16  302  		}
25c6d98fc4c245 Jan Kara 2021-08-16  303  =

25c6d98fc4c245 Jan Kara 2021-08-16  304  		inode =3D ext4_orphan_get(sb, le=
32_to_cpu(es->s_last_orphan));
25c6d98fc4c245 Jan Kara 2021-08-16  305  		if (IS_ERR(inode)) {
25c6d98fc4c245 Jan Kara 2021-08-16  306  			es->s_last_orphan =3D 0;
25c6d98fc4c245 Jan Kara 2021-08-16  307  			break;
25c6d98fc4c245 Jan Kara 2021-08-16  308  		}
25c6d98fc4c245 Jan Kara 2021-08-16  309  =

25c6d98fc4c245 Jan Kara 2021-08-16  310  		list_add(&EXT4_I(inode)->i_orpha=
n, &EXT4_SB(sb)->s_orphan);
25c6d98fc4c245 Jan Kara 2021-08-16  311  		dquot_initialize(inode);
25c6d98fc4c245 Jan Kara 2021-08-16  312  		if (inode->i_nlink) {
25c6d98fc4c245 Jan Kara 2021-08-16  313  			if (test_opt(sb, DEBUG))
25c6d98fc4c245 Jan Kara 2021-08-16  314  				ext4_msg(sb, KERN_DEBUG,
25c6d98fc4c245 Jan Kara 2021-08-16  315  					"%s: truncating inode %lu to =
%lld bytes",
25c6d98fc4c245 Jan Kara 2021-08-16  316  					__func__, inode->i_ino, inode=
->i_size);
25c6d98fc4c245 Jan Kara 2021-08-16  317  			jbd_debug(2, "truncating inode =
%lu to %lld bytes\n",
25c6d98fc4c245 Jan Kara 2021-08-16  318  				  inode->i_ino, inode->i_size);
25c6d98fc4c245 Jan Kara 2021-08-16  319  			inode_lock(inode);
25c6d98fc4c245 Jan Kara 2021-08-16  320  			truncate_inode_pages(inode->i_m=
apping, inode->i_size);
25c6d98fc4c245 Jan Kara 2021-08-16  321  			ret =3D ext4_truncate(inode);
25c6d98fc4c245 Jan Kara 2021-08-16  322  			if (ret) {
25c6d98fc4c245 Jan Kara 2021-08-16  323  				/*
25c6d98fc4c245 Jan Kara 2021-08-16  324  				 * We need to clean up the in-=
core orphan list
25c6d98fc4c245 Jan Kara 2021-08-16  325  				 * manually if ext4_truncate()=
 failed to get a
25c6d98fc4c245 Jan Kara 2021-08-16  326  				 * transaction handle.
25c6d98fc4c245 Jan Kara 2021-08-16  327  				 */
25c6d98fc4c245 Jan Kara 2021-08-16  328  				ext4_orphan_del(NULL, inode);
25c6d98fc4c245 Jan Kara 2021-08-16 @329  				ext4_std_error(inode->i_sb, re=
t);
25c6d98fc4c245 Jan Kara 2021-08-16  330  			}
25c6d98fc4c245 Jan Kara 2021-08-16  331  			inode_unlock(inode);
25c6d98fc4c245 Jan Kara 2021-08-16  332  			nr_truncates++;
25c6d98fc4c245 Jan Kara 2021-08-16  333  		} else {
25c6d98fc4c245 Jan Kara 2021-08-16  334  			if (test_opt(sb, DEBUG))
25c6d98fc4c245 Jan Kara 2021-08-16  335  				ext4_msg(sb, KERN_DEBUG,
25c6d98fc4c245 Jan Kara 2021-08-16  336  					"%s: deleting unreferenced in=
ode %lu",
25c6d98fc4c245 Jan Kara 2021-08-16  337  					__func__, inode->i_ino);
25c6d98fc4c245 Jan Kara 2021-08-16  338  			jbd_debug(2, "deleting unrefere=
nced inode %lu\n",
25c6d98fc4c245 Jan Kara 2021-08-16  339  				  inode->i_ino);
25c6d98fc4c245 Jan Kara 2021-08-16  340  			nr_orphans++;
25c6d98fc4c245 Jan Kara 2021-08-16  341  		}
25c6d98fc4c245 Jan Kara 2021-08-16  342  		iput(inode);  /* The delete magi=
c happens here! */
25c6d98fc4c245 Jan Kara 2021-08-16  343  	}
25c6d98fc4c245 Jan Kara 2021-08-16  344  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5440294675432165272==--

