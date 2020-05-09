Content-Type: multipart/mixed; boundary="===============6002499846662280107=="
MIME-Version: 1.0
From: kbuild test robot <lkp@intel.com>
Subject: Re: [PATCH v2 06/17] ext4: move quota configuration out of handle_mount_opt()
Date: Sat, 09 May 2020 08:57:44 +0800
Message-ID: <202005090813.Sac0K2LV%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6002499846662280107==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20200428164536.462-7-lczerner@redhat.com>
References: <20200428164536.462-7-lczerner@redhat.com>
TO: Lukas Czerner <lczerner@redhat.com>
TO: linux-ext4(a)vger.kernel.org
CC: dhowells(a)redhat.com
CC: viro(a)zeniv.linux.org.uk

Hi Lukas,

Thank you for the patch! Perhaps something to improve:

[auto build test WARNING on ext4/dev]
[also build test WARNING on linus/master v5.7-rc4 next-20200508]
[if your patch is applied to the wrong git tree, please drop us a note to h=
elp
improve the system. BTW, we also suggest to use '--base' option to specify =
the
base tree in git format-patch, please see https://stackoverflow.com/a/37406=
982]

url:    https://github.com/0day-ci/linux/commits/Lukas-Czerner/ext4-new-mou=
nt-API-conversion/20200429-050951
base:   https://git.kernel.org/pub/scm/linux/kernel/git/tytso/ext4.git dev
reproduce:
        # apt-get install sparse
        # sparse version: =

        make ARCH=3Dx86_64 allmodconfig
        make C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__'
:::::: branch date: 10 days ago
:::::: commit date: 10 days ago

If you fix the issue, kindly add following tag as appropriate
Reported-by: kbuild test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

   fs/ext4/super.c:2364:51: sparse: warning: incorrect type in argument 1 (=
different address spaces)
>> fs/ext4/super.c:2364:51: sparse:    expected char const *cs
   fs/ext4/super.c:2364:51: sparse:    got char [noderef] <asn:4> *
   fs/ext4/super.c:2332:38: sparse: warning: incorrect type in argument 1 (=
different address spaces)
   fs/ext4/super.c:2332:38: sparse:    expected void const *
   fs/ext4/super.c:2332:38: sparse:    got char [noderef] <asn:4> *

# https://github.com/0day-ci/linux/commit/9c038e70e9f6fa282da120a8796f43eed=
7be1384
git remote add linux-review https://github.com/0day-ci/linux
git remote update linux-review
git checkout 9c038e70e9f6fa282da120a8796f43eed7be1384
vim +2364 fs/ext4/super.c

9c038e70e9f6fa Lukas Czerner 2020-04-28  2338  =

9c038e70e9f6fa Lukas Czerner 2020-04-28  2339  /*
9c038e70e9f6fa Lukas Czerner 2020-04-28  2340   * Check quota settings cons=
istency.
9c038e70e9f6fa Lukas Czerner 2020-04-28  2341   */
9c038e70e9f6fa Lukas Czerner 2020-04-28  2342  static int ext4_check_quota_=
consistency(struct fs_context *fc,
9c038e70e9f6fa Lukas Czerner 2020-04-28  2343  					struct super_block *sb)
9c038e70e9f6fa Lukas Czerner 2020-04-28  2344  {
9c038e70e9f6fa Lukas Czerner 2020-04-28  2345  #ifdef CONFIG_QUOTA
9c038e70e9f6fa Lukas Czerner 2020-04-28  2346  	struct ext4_fs_context *ctx=
 =3D fc->fs_private;
9c038e70e9f6fa Lukas Czerner 2020-04-28  2347  	struct ext4_sb_info *sbi =
=3D EXT4_SB(sb);
9c038e70e9f6fa Lukas Czerner 2020-04-28  2348  	bool quota_feature =3D ext4=
_has_feature_quota(sb);
9c038e70e9f6fa Lukas Czerner 2020-04-28  2349  	bool quota_loaded =3D sb_an=
y_quota_loaded(sb);
9c038e70e9f6fa Lukas Czerner 2020-04-28  2350  	int i;
9c038e70e9f6fa Lukas Czerner 2020-04-28  2351  =

9c038e70e9f6fa Lukas Czerner 2020-04-28  2352  	if (ctx->qname_spec && quot=
a_loaded) {
9c038e70e9f6fa Lukas Czerner 2020-04-28  2353  		if (quota_feature)
9c038e70e9f6fa Lukas Czerner 2020-04-28  2354  			goto err_feature;
9c038e70e9f6fa Lukas Czerner 2020-04-28  2355  =

9c038e70e9f6fa Lukas Czerner 2020-04-28  2356  		for (i =3D 0; i < EXT4_MAX=
QUOTAS; i++) {
9c038e70e9f6fa Lukas Czerner 2020-04-28  2357  			if (!(ctx->qname_spec & (=
1 << i)))
9c038e70e9f6fa Lukas Czerner 2020-04-28  2358  				continue;
9c038e70e9f6fa Lukas Czerner 2020-04-28  2359  =

9c038e70e9f6fa Lukas Czerner 2020-04-28  2360  			if (!!sbi->s_qf_names[i] =
!=3D !!ctx->s_qf_names[i])
9c038e70e9f6fa Lukas Czerner 2020-04-28  2361  				goto err_jquota_change;
9c038e70e9f6fa Lukas Czerner 2020-04-28  2362  =

9c038e70e9f6fa Lukas Czerner 2020-04-28  2363  			if (sbi->s_qf_names[i] &&=
 ctx->s_qf_names[i] &&
9c038e70e9f6fa Lukas Czerner 2020-04-28 @2364  			    strcmp(sbi->s_qf_name=
s[i],
9c038e70e9f6fa Lukas Czerner 2020-04-28  2365  				   ctx->s_qf_names[i]) !=
=3D 0)
9c038e70e9f6fa Lukas Czerner 2020-04-28  2366  				goto err_jquota_specifie=
d;
9c038e70e9f6fa Lukas Czerner 2020-04-28  2367  		}
9c038e70e9f6fa Lukas Czerner 2020-04-28  2368  	}
9c038e70e9f6fa Lukas Czerner 2020-04-28  2369  =

9c038e70e9f6fa Lukas Czerner 2020-04-28  2370  	if (ctx->s_jquota_fmt) {
9c038e70e9f6fa Lukas Czerner 2020-04-28  2371  		if (sbi->s_jquota_fmt !=3D=
 ctx->s_jquota_fmt && quota_loaded)
9c038e70e9f6fa Lukas Czerner 2020-04-28  2372  			goto err_quota_change;
9c038e70e9f6fa Lukas Czerner 2020-04-28  2373  		if (quota_feature) {
9c038e70e9f6fa Lukas Czerner 2020-04-28  2374  			ext4_msg(NULL, KERN_INFO,=
 "Quota format mount options "
9c038e70e9f6fa Lukas Czerner 2020-04-28  2375  				 "ignored when QUOTA fea=
ture is enabled");
9c038e70e9f6fa Lukas Czerner 2020-04-28  2376  			return 0;
9c038e70e9f6fa Lukas Czerner 2020-04-28  2377  		}
9c038e70e9f6fa Lukas Czerner 2020-04-28  2378  	}
9c038e70e9f6fa Lukas Czerner 2020-04-28  2379  	return 0;
9c038e70e9f6fa Lukas Czerner 2020-04-28  2380  =

9c038e70e9f6fa Lukas Czerner 2020-04-28  2381  err_quota_change:
9c038e70e9f6fa Lukas Czerner 2020-04-28  2382  	ext4_msg(NULL, KERN_ERR,
9c038e70e9f6fa Lukas Czerner 2020-04-28  2383  		 "Ext4: Cannot change quot=
a options when quota turned on");
9c038e70e9f6fa Lukas Czerner 2020-04-28  2384  	return -EINVAL;
9c038e70e9f6fa Lukas Czerner 2020-04-28  2385  err_jquota_change:
9c038e70e9f6fa Lukas Czerner 2020-04-28  2386  	ext4_msg(NULL, KERN_ERR, "E=
xt4: Cannot change journaled quota "
9c038e70e9f6fa Lukas Czerner 2020-04-28  2387  		 "options when quota turne=
d on");
9c038e70e9f6fa Lukas Czerner 2020-04-28  2388  	return -EINVAL;
9c038e70e9f6fa Lukas Czerner 2020-04-28  2389  err_jquota_specified:
9c038e70e9f6fa Lukas Czerner 2020-04-28  2390  	ext4_msg(NULL, KERN_ERR, "E=
xt4: Quota file already specified");
9c038e70e9f6fa Lukas Czerner 2020-04-28  2391  	return -EINVAL;
9c038e70e9f6fa Lukas Czerner 2020-04-28  2392  err_feature:
9c038e70e9f6fa Lukas Czerner 2020-04-28  2393  	ext4_msg(NULL, KERN_ERR, "E=
xt4: Journaled quota options ignored "
9c038e70e9f6fa Lukas Czerner 2020-04-28  2394  		 "when QUOTA feature is en=
abled");
9c038e70e9f6fa Lukas Czerner 2020-04-28  2395  	return 0;
9c038e70e9f6fa Lukas Czerner 2020-04-28  2396  #else
9c038e70e9f6fa Lukas Czerner 2020-04-28  2397  	return 0;
9c038e70e9f6fa Lukas Czerner 2020-04-28  2398  #endif
9c038e70e9f6fa Lukas Czerner 2020-04-28  2399  }
9c038e70e9f6fa Lukas Czerner 2020-04-28  2400  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6002499846662280107==--

