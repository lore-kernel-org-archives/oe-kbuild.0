Content-Type: multipart/mixed; boundary="===============3720587676219376009=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: fs/btrfs/disk-io.c:2263:2: warning: There is an unknown macro here somewhere. Configuration is required. If rbtree_postorder_for_each_entry_safe is a macro then please configure it. [unknownMacro]
Date: Fri, 01 Apr 2022 04:38:30 +0800
Message-ID: <202204010449.LxLEFp4c-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============3720587676219376009==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: linux-kernel(a)vger.kernel.org
TO: Josef Bacik <josef@toxicpanda.com>
CC: David Sterba <dsterba@suse.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   787af64d05cd528aac9ad16752d11bb1c6061bb9
commit: abed4aaae4f71a7bcdbe90a65319b6e772a2689d btrfs: track the csum, ext=
ent, and free space trees in a rb tree
date:   3 months ago
:::::: branch date: 22 hours ago
:::::: commit date: 3 months ago
compiler: ia64-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> fs/btrfs/disk-io.c:2263:2: warning: There is an unknown macro here somew=
here. Configuration is required. If rbtree_postorder_for_each_entry_safe is=
 a macro then please configure it. [unknownMacro]
    rbtree_postorder_for_each_entry_safe(root, tmp,
    ^
>> fs/btrfs/volumes.c:1181:2: warning: There is an unknown macro here somew=
here. Configuration is required. If list_for_each_entry_safe is a macro the=
n please configure it. [unknownMacro]
    list_for_each_entry_safe(device, tmp, &fs_devices->devices, dev_list)
    ^

vim +2263 fs/btrfs/disk-io.c

2e9f5954978cd5 Rashika     2013-10-31  2258  =

abed4aaae4f71a Josef Bacik 2021-11-05  2259  static void free_global_root_p=
ointers(struct btrfs_fs_info *fs_info)
abed4aaae4f71a Josef Bacik 2021-11-05  2260  {
abed4aaae4f71a Josef Bacik 2021-11-05  2261  	struct btrfs_root *root, *tmp;
abed4aaae4f71a Josef Bacik 2021-11-05  2262  =

abed4aaae4f71a Josef Bacik 2021-11-05 @2263  	rbtree_postorder_for_each_ent=
ry_safe(root, tmp,
abed4aaae4f71a Josef Bacik 2021-11-05  2264  					     &fs_info->global_roo=
t_tree,
abed4aaae4f71a Josef Bacik 2021-11-05  2265  					     rb_node)
abed4aaae4f71a Josef Bacik 2021-11-05  2266  		free_root_extent_buffers(roo=
t);
abed4aaae4f71a Josef Bacik 2021-11-05  2267  }
abed4aaae4f71a Josef Bacik 2021-11-05  2268  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============3720587676219376009==--

