Content-Type: multipart/mixed; boundary="===============4684425186016534315=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: fs/ext4/super.c:5649:3: warning: Value stored to 'ret' is never read [clang-analyzer-deadcode.DeadStores]
Date: Wed, 26 Jan 2022 16:20:00 +0800
Message-ID: <202201261659.dZZOrgxb-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4684425186016534315==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: llvm(a)lists.linux.dev
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Lukas Czerner <lczerner@redhat.com>
CC: "Theodore Ts'o" <tytso@mit.edu>
CC: Carlos Maiolino <cmaiolino@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   0280e3c58f92b2fe0e8fbbdf8d386449168de4a8
commit: cebe85d570cf84804e848332d6721bc9e5300e07 ext4: switch to the new mo=
unt api
date:   7 weeks ago
:::::: branch date: 14 hours ago
:::::: commit date: 7 weeks ago
config: x86_64-randconfig-c007 (https://download.01.org/0day-ci/archive/202=
20126/202201261659.dZZOrgxb-lkp(a)intel.com/config)
compiler: clang version 14.0.0 (https://github.com/llvm/llvm-project f7b713=
8a62648f4019c55e4671682af1f851f295)
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.gi=
t/commit/?id=3Dcebe85d570cf84804e848332d6721bc9e5300e07
        git remote add linus https://git.kernel.org/pub/scm/linux/kernel/gi=
t/torvalds/linux.git
        git fetch --no-tags linus master
        git checkout cebe85d570cf84804e848332d6721bc9e5300e07
        # save the config file to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross ARCH=
=3Dx86_64 clang-analyzer =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


clang-analyzer warnings: (new ones prefixed by >>)
           ^
   net/core/filter.c:1760:15: note: Assuming field 'skb' is non-null
           if (unlikely(!ctx->skb))
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   net/core/filter.c:1760:2: note: Taking false branch
           if (unlikely(!ctx->skb))
           ^
   net/core/filter.c:1764:15: note: Assuming 'ptr' is null
           if (unlikely(!ptr))
                        ^
   include/linux/compiler.h:78:42: note: expanded from macro 'unlikely'
   # define unlikely(x)    __builtin_expect(!!(x), 0)
                                               ^
   net/core/filter.c:1764:2: note: Taking true branch
           if (unlikely(!ptr))
           ^
   net/core/filter.c:1765:3: note: Control jumps to line 1771
                   goto err_clear;
                   ^
   net/core/filter.c:1771:2: note: Null pointer passed as 1st argument to m=
emory set function
           memset(to, 0, len);
           ^      ~~
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   15 warnings generated.
   net/mac80211/ibss.c:934:6: warning: Value stored to 'reason' during its =
initialization is never read [clang-analyzer-deadcode.DeadStores]
           u16 reason =3D le16_to_cpu(mgmt->u.deauth.reason_code);
               ^~~~~~
   net/mac80211/ibss.c:934:6: note: Value stored to 'reason' during its ini=
tialization is never read
           u16 reason =3D le16_to_cpu(mgmt->u.deauth.reason_code);
               ^~~~~~
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
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
   5 warnings generated.
   Suppressed 5 warnings (5 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   10 warnings generated.
   Suppressed 10 warnings (10 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
>> fs/ext4/super.c:5649:3: warning: Value stored to 'ret' is never read [cl=
ang-analyzer-deadcode.DeadStores]
                   ret =3D -ENOMEM;
                   ^     ~~~~~~~
   fs/ext4/super.c:5649:3: note: Value stored to 'ret' is never read
                   ret =3D -ENOMEM;
                   ^     ~~~~~~~
   Suppressed 11 warnings (7 in non-user code, 4 with check filters).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   6 warnings generated.
   Suppressed 6 warnings (6 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   9 warnings generated.
   Suppressed 9 warnings (9 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   13 warnings generated.
   Suppressed 13 warnings (13 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   12 warnings generated.
   net/wireless/wext-compat.c:30:2: warning: Call to function 'strcpy' is i=
nsecure as it does not provide bounding of the memory buffer. Replace unbou=
nded copy functions with analogous functions that support length arguments =
such as 'strlcpy'. CWE-119 [clang-analyzer-security.insecureAPI.strcpy]
           strcpy(name, "IEEE 802.11");
           ^~~~~~
   net/wireless/wext-compat.c:30:2: note: Call to function 'strcpy' is inse=
cure as it does not provide bounding of the memory buffer. Replace unbounde=
d copy functions with analogous functions that support length arguments suc=
h as 'strlcpy'. CWE-119
           strcpy(name, "IEEE 802.11");
           ^~~~~~
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   11 warnings generated.
   Suppressed 11 warnings (11 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   14 warnings generated.
   Suppressed 14 warnings (14 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.
   116 warnings generated.
   Suppressed 116 warnings (116 in non-user code).
   Use -header-filter=3D.* to display errors from all non-system headers. U=
se -system-headers to display errors from system headers as well.

vim +/ret +5649 fs/ext4/super.c

ac27a0ec112a08 Dave Kleikamp 2006-10-11  5639  =

cebe85d570cf84 Lukas Czerner 2021-10-27  5640  static int ext4_fill_super(s=
truct super_block *sb, struct fs_context *fc)
7edfd85b1ffd36 Lukas Czerner 2021-10-27  5641  {
cebe85d570cf84 Lukas Czerner 2021-10-27  5642  	struct ext4_fs_context *ctx=
 =3D fc->fs_private;
7edfd85b1ffd36 Lukas Czerner 2021-10-27  5643  	struct ext4_sb_info *sbi;
7edfd85b1ffd36 Lukas Czerner 2021-10-27  5644  	const char *descr;
cebe85d570cf84 Lukas Czerner 2021-10-27  5645  	int ret;
7edfd85b1ffd36 Lukas Czerner 2021-10-27  5646  =

7edfd85b1ffd36 Lukas Czerner 2021-10-27  5647  	sbi =3D ext4_alloc_sbi(sb);
cebe85d570cf84 Lukas Czerner 2021-10-27  5648  	if (!sbi)
7edfd85b1ffd36 Lukas Czerner 2021-10-27 @5649  		ret =3D -ENOMEM;
7edfd85b1ffd36 Lukas Czerner 2021-10-27  5650  =

cebe85d570cf84 Lukas Czerner 2021-10-27  5651  	fc->s_fs_info =3D sbi;
cebe85d570cf84 Lukas Czerner 2021-10-27  5652  =

cebe85d570cf84 Lukas Czerner 2021-10-27  5653  	/* Cleanup superblock name =
*/
cebe85d570cf84 Lukas Czerner 2021-10-27  5654  	strreplace(sb->s_id, '/', '=
!');
7edfd85b1ffd36 Lukas Czerner 2021-10-27  5655  =

7edfd85b1ffd36 Lukas Czerner 2021-10-27  5656  	sbi->s_sb_block =3D 1;	/* D=
efault super block location */
cebe85d570cf84 Lukas Czerner 2021-10-27  5657  	if (ctx->spec & EXT4_SPEC_s=
_sb_block)
cebe85d570cf84 Lukas Czerner 2021-10-27  5658  		sbi->s_sb_block =3D ctx->s=
_sb_block;
7edfd85b1ffd36 Lukas Czerner 2021-10-27  5659  =

cebe85d570cf84 Lukas Czerner 2021-10-27  5660  	ret =3D __ext4_fill_super(f=
c, sb, fc->sb_flags & SB_SILENT);
7edfd85b1ffd36 Lukas Czerner 2021-10-27  5661  	if (ret < 0)
7edfd85b1ffd36 Lukas Czerner 2021-10-27  5662  		goto free_sbi;
7edfd85b1ffd36 Lukas Czerner 2021-10-27  5663  =

cebe85d570cf84 Lukas Czerner 2021-10-27  5664  	if (sbi->s_journal) {
7edfd85b1ffd36 Lukas Czerner 2021-10-27  5665  		if (test_opt(sb, DATA_FLAG=
S) =3D=3D EXT4_MOUNT_JOURNAL_DATA)
7edfd85b1ffd36 Lukas Czerner 2021-10-27  5666  			descr =3D " journalled da=
ta mode";
7edfd85b1ffd36 Lukas Czerner 2021-10-27  5667  		else if (test_opt(sb, DATA=
_FLAGS) =3D=3D EXT4_MOUNT_ORDERED_DATA)
7edfd85b1ffd36 Lukas Czerner 2021-10-27  5668  			descr =3D " ordered data =
mode";
7edfd85b1ffd36 Lukas Czerner 2021-10-27  5669  		else
7edfd85b1ffd36 Lukas Czerner 2021-10-27  5670  			descr =3D " writeback dat=
a mode";
7edfd85b1ffd36 Lukas Czerner 2021-10-27  5671  	} else
7edfd85b1ffd36 Lukas Czerner 2021-10-27  5672  		descr =3D "out journal";
7edfd85b1ffd36 Lukas Czerner 2021-10-27  5673  =

7edfd85b1ffd36 Lukas Czerner 2021-10-27  5674  	if (___ratelimit(&ext4_moun=
t_msg_ratelimit, "EXT4-fs mount"))
7edfd85b1ffd36 Lukas Czerner 2021-10-27  5675  		ext4_msg(sb, KERN_INFO, "m=
ounted filesystem with%s. "
cebe85d570cf84 Lukas Czerner 2021-10-27  5676  			 "Quota mode: %s.", descr=
, ext4_quota_mode(sb));
7edfd85b1ffd36 Lukas Czerner 2021-10-27  5677  =

7edfd85b1ffd36 Lukas Czerner 2021-10-27  5678  	return 0;
cebe85d570cf84 Lukas Czerner 2021-10-27  5679  =

7edfd85b1ffd36 Lukas Czerner 2021-10-27  5680  free_sbi:
7edfd85b1ffd36 Lukas Czerner 2021-10-27  5681  	ext4_free_sbi(sbi);
cebe85d570cf84 Lukas Czerner 2021-10-27  5682  	fc->s_fs_info =3D NULL;
7edfd85b1ffd36 Lukas Czerner 2021-10-27  5683  	return ret;
7edfd85b1ffd36 Lukas Czerner 2021-10-27  5684  }
7edfd85b1ffd36 Lukas Czerner 2021-10-27  5685  =


:::::: The code at line 5649 was first introduced by commit
:::::: 7edfd85b1ffd36593011dec96ab395912a340418 ext4: Completely separate o=
ptions parsing and sb setup

:::::: TO: Lukas Czerner <lczerner@redhat.com>
:::::: CC: Theodore Ts'o <tytso@mit.edu>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4684425186016534315==--

