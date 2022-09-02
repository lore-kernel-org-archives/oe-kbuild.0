Content-Type: multipart/mixed; boundary="===============5408077832073672900=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [RFC PATCH 5/5] erofs: support fscache based shared domain
Date: Sat, 03 Sep 2022 05:49:46 +0800
Message-ID: <202209030545.uaa0w6kC-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5408077832073672900==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence bisect report"
:::::: Manual check reason: "low confidence static check warning: fs/erofs/=
domain.c:21:31: warning: use of uninitialized value '<unknown>' [CWE-457] [=
-Wanalyzer-use-of-uninitialized-value]"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220831123125.68693-6-zhujia.zj@bytedance.com>
References: <20220831123125.68693-6-zhujia.zj@bytedance.com>
TO: Jia Zhu <zhujia.zj@bytedance.com>

Hi Jia,

[FYI, it's a private test report for your RFC patch.]
[auto build test WARNING on xiang-erofs/dev-test]
[also build test WARNING on linus/master v6.0-rc3 next-20220901]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Jia-Zhu/Introduce-er=
ofs-shared-domain/20220831-203418
base:   https://git.kernel.org/pub/scm/linux/kernel/git/xiang/erofs.git dev=
-test
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: arm-randconfig-c002-20220831 (https://download.01.org/0day-ci/archi=
ve/20220903/202209030545.uaa0w6kC-lkp(a)intel.com/config)
compiler: arm-linux-gnueabi-gcc (GCC) 12.1.0
reproduce (this is a W=3D1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # https://github.com/intel-lab-lkp/linux/commit/6168c6777c77781e6e9=
2c528281e511dc91a856b
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Jia-Zhu/Introduce-erofs-shared-dom=
ain/20220831-203418
        git checkout 6168c6777c77781e6e92c528281e511dc91a856b
        # save the config file
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-12.1.0 make.cross=
 ARCH=3Darm KBUILD_USERCFLAGS=3D'-fanalyzer -Wno-error' =


If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

gcc_analyzer warnings: (new ones prefixed by >>)
   fs/erofs/domain.c: In function 'erofs_fscache_domain_init_cookie':
>> fs/erofs/domain.c:21:31: warning: use of uninitialized value '<unknown>'=
 [CWE-457] [-Wanalyzer-use-of-uninitialized-value]
      21 |         struct erofs_fscache *ctx;
         |                               ^~~
     'erofs_fscache_domain_init_cookie': event 1
       |
       |   21 |         struct erofs_fscache *ctx;
       |      |                               ^~~
       |      |                               |
       |      |                               (1) use of uninitialized valu=
e '<unknown>' here
       |

vim +21 fs/erofs/domain.c

21884d3f0a1fa2 Jia Zhu 2022-08-31  15  =

6168c6777c7778 Jia Zhu 2022-08-31  16  static int erofs_fscache_domain_init=
_cookie(struct super_block *sb,
6168c6777c7778 Jia Zhu 2022-08-31  17  		struct erofs_fscache **fscache, ch=
ar *name, bool need_inode)
6168c6777c7778 Jia Zhu 2022-08-31  18  {
6168c6777c7778 Jia Zhu 2022-08-31  19  	int ret;
6168c6777c7778 Jia Zhu 2022-08-31  20  	struct inode *inode;
6168c6777c7778 Jia Zhu 2022-08-31 @21  	struct erofs_fscache *ctx;
6168c6777c7778 Jia Zhu 2022-08-31  22  	struct erofs_sb_info *sbi =3D EROFS=
_SB(sb);
6168c6777c7778 Jia Zhu 2022-08-31  23  	struct erofs_domain *domain =3D sbi=
->domain;
6168c6777c7778 Jia Zhu 2022-08-31  24  =

6168c6777c7778 Jia Zhu 2022-08-31  25  	ret =3D erofs_fscache_register_cook=
ie(sb, &ctx, name, need_inode);
6168c6777c7778 Jia Zhu 2022-08-31  26  	if (ret)
6168c6777c7778 Jia Zhu 2022-08-31  27  		return ret;
6168c6777c7778 Jia Zhu 2022-08-31  28  =

6168c6777c7778 Jia Zhu 2022-08-31  29  	ctx->name =3D kstrdup(name, GFP_KER=
NEL);
6168c6777c7778 Jia Zhu 2022-08-31  30  	if (!ctx->name)
6168c6777c7778 Jia Zhu 2022-08-31  31  		return -ENOMEM;
6168c6777c7778 Jia Zhu 2022-08-31  32  =

6168c6777c7778 Jia Zhu 2022-08-31  33  	inode =3D new_inode(domain->mnt->mn=
t_sb);
6168c6777c7778 Jia Zhu 2022-08-31  34  	if (!inode) {
6168c6777c7778 Jia Zhu 2022-08-31  35  		kfree(ctx->name);
6168c6777c7778 Jia Zhu 2022-08-31  36  		return -ENOMEM;
6168c6777c7778 Jia Zhu 2022-08-31  37  	}
6168c6777c7778 Jia Zhu 2022-08-31  38  =

6168c6777c7778 Jia Zhu 2022-08-31  39  	ctx->domain =3D domain;
6168c6777c7778 Jia Zhu 2022-08-31  40  	ctx->anon_inode =3D inode;
6168c6777c7778 Jia Zhu 2022-08-31  41  	inode->i_private =3D ctx;
6168c6777c7778 Jia Zhu 2022-08-31  42  	refcount_set(&ctx->ref, 1);
6168c6777c7778 Jia Zhu 2022-08-31  43  	erofs_fscache_domain_get(domain);
6168c6777c7778 Jia Zhu 2022-08-31  44  	*fscache =3D ctx;
6168c6777c7778 Jia Zhu 2022-08-31  45  	return 0;
6168c6777c7778 Jia Zhu 2022-08-31  46  }
6168c6777c7778 Jia Zhu 2022-08-31  47  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5408077832073672900==--

