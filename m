Content-Type: multipart/mixed; boundary="===============1416134421349532950=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: Re: [PATCH v2] btrfs: Only require sector size alignment for parent eb bytenr
Date: Fri, 03 Apr 2020 11:11:31 +0300
Message-ID: <20200403081131.GV2001@kadam>
In-Reply-To: <20200326055403.22748-1-wqu@suse.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1416134421349532950==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Qu,

url:    https://github.com/0day-ci/linux/commits/Qu-Wenruo/btrfs-Only-requi=
re-sector-size-alignment-for-parent-eb-bytenr/20200327-034045
base:   https://git.kernel.org/pub/scm/linux/kernel/git/mason/linux-btrfs.g=
it next

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
fs/btrfs/extent-tree.c:1178 btrfs_get_extent_inline_ref_type() warn: '0x' p=
refix is confusing together with '%lu' specifier
fs/btrfs/extent-tree.c:1178 btrfs_get_extent_inline_ref_type() warn: argume=
nt 4 to %lu specifier is cast from pointer

Old smatch warnings:
fs/btrfs/extent-tree.c:6343 update_block_group() warn: inconsistent indenti=
ng
fs/btrfs/extent-tree.c:7620 find_free_extent() warn: inconsistent indenting

# https://github.com/0day-ci/linux/commit/8a07080e7e5051c75e67e30bf635fc230=
b2ab720
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout 8a07080e7e5051c75e67e30bf635fc230b2ab720
vim +1178 fs/btrfs/extent-tree.c

64ecdb647ddb83 Liu Bo    2017-08-18  1166  				 */
64ecdb647ddb83 Liu Bo    2017-08-18  1167  				if (offset &&
8a07080e7e5051 Qu Wenruo 2020-03-26  1168  				    IS_ALIGNED(offset, eb->f=
s_info->sectorsize))
64ecdb647ddb83 Liu Bo    2017-08-18  1169  					return type;
64ecdb647ddb83 Liu Bo    2017-08-18  1170  			}
167ce953ca55bd Liu Bo    2017-08-18  1171  		} else {
167ce953ca55bd Liu Bo    2017-08-18  1172  			ASSERT(is_data =3D=3D BTRFS_R=
EF_TYPE_ANY);
167ce953ca55bd Liu Bo    2017-08-18  1173  			return type;
167ce953ca55bd Liu Bo    2017-08-18  1174  		}
167ce953ca55bd Liu Bo    2017-08-18  1175  	}
167ce953ca55bd Liu Bo    2017-08-18  1176  =

167ce953ca55bd Liu Bo    2017-08-18  1177  	btrfs_print_leaf((struct extent=
_buffer *)eb);
8a07080e7e5051 Qu Wenruo 2020-03-26 @1178  	btrfs_err(eb->fs_info,
8a07080e7e5051 Qu Wenruo 2020-03-26  1179  		  "eb %llu iref 0x%lu invalid =
extent inline ref type %d",
                                                                        ^^^=
^^

8a07080e7e5051 Qu Wenruo 2020-03-26  1180  		  eb->start, (unsigned long)ir=
ef, type);
                                                                     ^^^^^^=
^^^^^^^^^^^^^
0x indicates hex, but this is decimal.  But use %p for pointers so that
the can be hidden to people without enough privilege.  #kernelHardenning

167ce953ca55bd Liu Bo    2017-08-18  1181  	WARN_ON(1);
167ce953ca55bd Liu Bo    2017-08-18  1182  =

167ce953ca55bd Liu Bo    2017-08-18  1183  	return BTRFS_REF_TYPE_INVALID;
167ce953ca55bd Liu Bo    2017-08-18  1184  }

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1416134421349532950==--

