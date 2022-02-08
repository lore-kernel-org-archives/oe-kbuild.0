Content-Type: multipart/mixed; boundary="===============4861432161806800675=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH nf-next] netfilter: cttimeout: use option structure
Date: Wed, 09 Feb 2022 05:38:20 +0800
Message-ID: <202202090519.DSEDmf7v-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4861432161806800675==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220208112947.26405-1-fw@strlen.de>
References: <20220208112947.26405-1-fw@strlen.de>
TO: Florian Westphal <fw@strlen.de>
TO: netfilter-devel(a)vger.kernel.org
CC: Florian Westphal <fw@strlen.de>

Hi Florian,

I love your patch! Perhaps something to improve:

[auto build test WARNING on nf-next/master]

url:    https://github.com/0day-ci/linux/commits/Florian-Westphal/netfilter=
-cttimeout-use-option-structure/20220208-194834
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pablo/nf-next.git m=
aster
:::::: branch date: 10 hours ago
:::::: commit date: 10 hours ago
config: arm64-randconfig-s032-20220208 (https://download.01.org/0day-ci/arc=
hive/20220209/202202090519.DSEDmf7v-lkp(a)intel.com/config)
compiler: aarch64-linux-gcc (GCC) 11.2.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-dirty
        # https://github.com/0day-ci/linux/commit/d47c1bd874471f3869d4b1cf4=
a0a9183248f9f4f
        git remote add linux-review https://github.com/0day-ci/linux
        git fetch --no-tags linux-review Florian-Westphal/netfilter-cttimeo=
ut-use-option-structure/20220208-194834
        git checkout d47c1bd874471f3869d4b1cf4a0a9183248f9f4f
        # save the config file to linux build tree
        mkdir build_dir
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-11.2.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Da=
rm64 SHELL=3D/bin/bash net/netfilter/

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
   net/netfilter/nf_conntrack_timeout.c:32:62: sparse: sparse: incompatible=
 types in comparison expression (different base types):
   net/netfilter/nf_conntrack_timeout.c:32:62: sparse:    struct nf_ct_time=
out [noderef] __rcu *
   net/netfilter/nf_conntrack_timeout.c:32:62: sparse:    void *
   net/netfilter/nf_conntrack_timeout.c:47:47: sparse: sparse: incompatible=
 types in comparison expression (different address spaces):
>> net/netfilter/nf_conntrack_timeout.c:47:47: sparse:    struct nf_ct_time=
out_hooks const [noderef] __rcu *
>> net/netfilter/nf_conntrack_timeout.c:47:47: sparse:    struct nf_ct_time=
out_hooks const *
   net/netfilter/nf_conntrack_timeout.c:63:13: sparse: sparse: incompatible=
 types in comparison expression (different address spaces):
   net/netfilter/nf_conntrack_timeout.c:63:13: sparse:    struct nf_ct_time=
out_hooks const [noderef] __rcu *
   net/netfilter/nf_conntrack_timeout.c:63:13: sparse:    struct nf_ct_time=
out_hooks const *
   net/netfilter/nf_conntrack_timeout.c:120:13: sparse: sparse: incompatibl=
e types in comparison expression (different address spaces):
   net/netfilter/nf_conntrack_timeout.c:120:13: sparse:    struct nf_ct_tim=
eout_hooks const [noderef] __rcu *
   net/netfilter/nf_conntrack_timeout.c:120:13: sparse:    struct nf_ct_tim=
eout_hooks const *
--
   net/netfilter/nfnetlink_cttimeout.c:627:9: sparse: sparse: incompatible =
types in comparison expression (different address spaces):
>> net/netfilter/nfnetlink_cttimeout.c:627:9: sparse:    struct nf_ct_timeo=
ut_hooks const [noderef] __rcu *
>> net/netfilter/nfnetlink_cttimeout.c:627:9: sparse:    struct nf_ct_timeo=
ut_hooks const *
   net/netfilter/nfnetlink_cttimeout.c:640:9: sparse: sparse: incompatible =
types in comparison expression (different address spaces):
   net/netfilter/nfnetlink_cttimeout.c:640:9: sparse:    struct nf_ct_timeo=
ut_hooks const [noderef] __rcu *
   net/netfilter/nfnetlink_cttimeout.c:640:9: sparse:    struct nf_ct_timeo=
ut_hooks const *

vim +47 net/netfilter/nf_conntrack_timeout.c

dd705072412225 Pablo Neira Ayuso 2012-02-28  27  =

4e665afbd7bee2 Harsha Sharma     2018-08-07  28  static int untimeout(struc=
t nf_conn *ct, void *timeout)
4e665afbd7bee2 Harsha Sharma     2018-08-07  29  {
4e665afbd7bee2 Harsha Sharma     2018-08-07  30  	struct nf_conn_timeout *t=
imeout_ext =3D nf_ct_timeout_find(ct);
4e665afbd7bee2 Harsha Sharma     2018-08-07  31  =

4e665afbd7bee2 Harsha Sharma     2018-08-07 @32  	if (timeout_ext && (!time=
out || timeout_ext->timeout =3D=3D timeout))
4e665afbd7bee2 Harsha Sharma     2018-08-07  33  		RCU_INIT_POINTER(timeout=
_ext->timeout, NULL);
4e665afbd7bee2 Harsha Sharma     2018-08-07  34  =

4e665afbd7bee2 Harsha Sharma     2018-08-07  35  	/* We are not intended to=
 delete this conntrack. */
4e665afbd7bee2 Harsha Sharma     2018-08-07  36  	return 0;
4e665afbd7bee2 Harsha Sharma     2018-08-07  37  }
4e665afbd7bee2 Harsha Sharma     2018-08-07  38  =

6c1fd7dc489d9b Pablo Neira Ayuso 2018-08-07  39  void nf_ct_untimeout(struc=
t net *net, struct nf_ct_timeout *timeout)
4e665afbd7bee2 Harsha Sharma     2018-08-07  40  {
4e665afbd7bee2 Harsha Sharma     2018-08-07  41  	nf_ct_iterate_cleanup_net=
(net, untimeout, timeout, 0, 0);
4e665afbd7bee2 Harsha Sharma     2018-08-07  42  }
4e665afbd7bee2 Harsha Sharma     2018-08-07  43  EXPORT_SYMBOL_GPL(nf_ct_un=
timeout);
4e665afbd7bee2 Harsha Sharma     2018-08-07  44  =

717700d183d65b Yi-Hung Wei       2019-03-26  45  static void __nf_ct_timeou=
t_put(struct nf_ct_timeout *timeout)
717700d183d65b Yi-Hung Wei       2019-03-26  46  {
d47c1bd874471f Florian Westphal  2022-02-08 @47  	const struct nf_ct_timeou=
t_hooks *h =3D rcu_dereference(nf_ct_timeout_hook);
717700d183d65b Yi-Hung Wei       2019-03-26  48  =

d47c1bd874471f Florian Westphal  2022-02-08  49  	if (h)
d47c1bd874471f Florian Westphal  2022-02-08  50  		h->timeout_put(timeout);
717700d183d65b Yi-Hung Wei       2019-03-26  51  }
717700d183d65b Yi-Hung Wei       2019-03-26  52  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4861432161806800675==--

