Content-Type: multipart/mixed; boundary="===============5216201031229490827=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH nf, v2 1/2] netfilter: nf_tables: release element key when parser fails
Date: Sun, 10 Jul 2022 08:52:17 +0800
Message-ID: <202207100802.TRaePFrj-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5216201031229490827==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220708100633.18896-1-pablo@netfilter.org>
References: <20220708100633.18896-1-pablo@netfilter.org>
TO: Pablo Neira Ayuso <pablo@netfilter.org>
TO: netfilter-devel(a)vger.kernel.org

Hi Pablo,

I love your patch! Perhaps something to improve:

[auto build test WARNING on nf/master]
[also build test WARNING on linus/master v5.19-rc5 next-20220708]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Pablo-Neira-Ayuso/ne=
tfilter-nf_tables-release-element-key-when-parser-fails/20220708-180911
base:   https://git.kernel.org/pub/scm/linux/kernel/git/pablo/nf.git master
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-rhel-8.3-kselftests (https://download.01.org/0day-ci/archive=
/20220710/202207100802.TRaePFrj-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
net/netfilter/nf_tables_api.c:6254 nft_del_setelem() warn: passing zero to =
'PTR_ERR'

vim +/PTR_ERR +6254 net/netfilter/nf_tables_api.c

591054469b3eef Pablo Neira Ayuso 2017-05-15  6202  =

60319eb1ca351a Pablo Neira Ayuso 2014-04-04  6203  static int nft_del_setel=
em(struct nft_ctx *ctx, struct nft_set *set,
20a69341f2d00c Patrick McHardy   2013-10-11  6204  			   const struct nlatt=
r *attr)
20a69341f2d00c Patrick McHardy   2013-10-11  6205  {
20a69341f2d00c Patrick McHardy   2013-10-11  6206  	struct nlattr *nla[NFTA=
_SET_ELEM_MAX + 1];
3971ca14350062 Pablo Neira Ayuso 2016-04-12  6207  	struct nft_set_ext_tmpl=
 tmpl;
20a69341f2d00c Patrick McHardy   2013-10-11  6208  	struct nft_set_elem ele=
m;
3971ca14350062 Pablo Neira Ayuso 2016-04-12  6209  	struct nft_set_ext *ext;
60319eb1ca351a Pablo Neira Ayuso 2014-04-04  6210  	struct nft_trans *trans;
3971ca14350062 Pablo Neira Ayuso 2016-04-12  6211  	u32 flags =3D 0;
20a69341f2d00c Patrick McHardy   2013-10-11  6212  	int err;
20a69341f2d00c Patrick McHardy   2013-10-11  6213  =

8cb081746c031f Johannes Berg     2019-04-26  6214  	err =3D nla_parse_neste=
d_deprecated(nla, NFTA_SET_ELEM_MAX, attr,
fceb6435e85298 Johannes Berg     2017-04-12  6215  					  nft_set_elem_poli=
cy, NULL);
20a69341f2d00c Patrick McHardy   2013-10-11  6216  	if (err < 0)
20a1452c35425b Pablo Neira Ayuso 2020-01-22  6217  		return err;
20a69341f2d00c Patrick McHardy   2013-10-11  6218  =

aaa31047a6d25d Pablo Neira Ayuso 2021-04-27  6219  	err =3D nft_setelem_par=
se_flags(set, nla[NFTA_SET_ELEM_FLAGS], &flags);
aaa31047a6d25d Pablo Neira Ayuso 2021-04-27  6220  	if (err < 0)
aaa31047a6d25d Pablo Neira Ayuso 2021-04-27  6221  		return err;
aaa31047a6d25d Pablo Neira Ayuso 2021-04-27  6222  =

aaa31047a6d25d Pablo Neira Ayuso 2021-04-27  6223  	if (!nla[NFTA_SET_ELEM_=
KEY] && !(flags & NFT_SET_ELEM_CATCHALL))
20a1452c35425b Pablo Neira Ayuso 2020-01-22  6224  		return -EINVAL;
20a69341f2d00c Patrick McHardy   2013-10-11  6225  =

3971ca14350062 Pablo Neira Ayuso 2016-04-12  6226  	nft_set_ext_prepare(&tm=
pl);
3971ca14350062 Pablo Neira Ayuso 2016-04-12  6227  =

3971ca14350062 Pablo Neira Ayuso 2016-04-12  6228  	if (flags !=3D 0)
3971ca14350062 Pablo Neira Ayuso 2016-04-12  6229  		nft_set_ext_add(&tmpl,=
 NFT_SET_EXT_FLAGS);
3971ca14350062 Pablo Neira Ayuso 2016-04-12  6230  =

aaa31047a6d25d Pablo Neira Ayuso 2021-04-27  6231  	if (nla[NFTA_SET_ELEM_K=
EY]) {
20a1452c35425b Pablo Neira Ayuso 2020-01-22  6232  		err =3D nft_setelem_pa=
rse_key(ctx, set, &elem.key.val,
d0a11fc3dc4ab4 Patrick McHardy   2015-04-11  6233  					    nla[NFTA_SET_EL=
EM_KEY]);
20a69341f2d00c Patrick McHardy   2013-10-11  6234  		if (err < 0)
20a1452c35425b Pablo Neira Ayuso 2020-01-22  6235  			return err;
20a69341f2d00c Patrick McHardy   2013-10-11  6236  =

20a1452c35425b Pablo Neira Ayuso 2020-01-22  6237  		nft_set_ext_add_length=
(&tmpl, NFT_SET_EXT_KEY, set->klen);
aaa31047a6d25d Pablo Neira Ayuso 2021-04-27  6238  	}
3971ca14350062 Pablo Neira Ayuso 2016-04-12  6239  =

7b225d0b5c6dda Pablo Neira Ayuso 2020-01-22  6240  	if (nla[NFTA_SET_ELEM_K=
EY_END]) {
7b225d0b5c6dda Pablo Neira Ayuso 2020-01-22  6241  		err =3D nft_setelem_pa=
rse_key(ctx, set, &elem.key_end.val,
7b225d0b5c6dda Pablo Neira Ayuso 2020-01-22  6242  					    nla[NFTA_SET_EL=
EM_KEY_END]);
7b225d0b5c6dda Pablo Neira Ayuso 2020-01-22  6243  		if (err < 0)
0973c5bfbf138f Pablo Neira Ayuso 2022-07-08  6244  			goto fail_elem;
7b225d0b5c6dda Pablo Neira Ayuso 2020-01-22  6245  =

7b225d0b5c6dda Pablo Neira Ayuso 2020-01-22  6246  		nft_set_ext_add_length=
(&tmpl, NFT_SET_EXT_KEY_END, set->klen);
7b225d0b5c6dda Pablo Neira Ayuso 2020-01-22  6247  	}
7b225d0b5c6dda Pablo Neira Ayuso 2020-01-22  6248  =

3971ca14350062 Pablo Neira Ayuso 2016-04-12  6249  	err =3D -ENOMEM;
7b225d0b5c6dda Pablo Neira Ayuso 2020-01-22  6250  	elem.priv =3D nft_set_e=
lem_init(set, &tmpl, elem.key.val.data,
7b225d0b5c6dda Pablo Neira Ayuso 2020-01-22  6251  				      elem.key_end.v=
al.data, NULL, 0, 0,
33758c891479ea Vasily Averin     2022-03-24  6252  				      GFP_KERNEL_ACC=
OUNT);
0973c5bfbf138f Pablo Neira Ayuso 2022-07-08  6253  	if (elem.priv =3D=3D NU=
LL) {
0973c5bfbf138f Pablo Neira Ayuso 2022-07-08 @6254  		err =3D PTR_ERR(elem.p=
riv);
0973c5bfbf138f Pablo Neira Ayuso 2022-07-08  6255  		goto fail_elem_key_end;
0973c5bfbf138f Pablo Neira Ayuso 2022-07-08  6256  	}
3971ca14350062 Pablo Neira Ayuso 2016-04-12  6257  =

3971ca14350062 Pablo Neira Ayuso 2016-04-12  6258  	ext =3D nft_set_elem_ex=
t(set, elem.priv);
3971ca14350062 Pablo Neira Ayuso 2016-04-12  6259  	if (flags)
3971ca14350062 Pablo Neira Ayuso 2016-04-12  6260  		*nft_set_ext_flags(ext=
) =3D flags;
3971ca14350062 Pablo Neira Ayuso 2016-04-12  6261  =

60319eb1ca351a Pablo Neira Ayuso 2014-04-04  6262  	trans =3D nft_trans_ele=
m_alloc(ctx, NFT_MSG_DELSETELEM, set);
20a1452c35425b Pablo Neira Ayuso 2020-01-22  6263  	if (trans =3D=3D NULL)
20a1452c35425b Pablo Neira Ayuso 2020-01-22  6264  		goto fail_trans;
20a69341f2d00c Patrick McHardy   2013-10-11  6265  =

aaa31047a6d25d Pablo Neira Ayuso 2021-04-27  6266  	err =3D nft_setelem_dea=
ctivate(ctx->net, set, &elem, flags);
aaa31047a6d25d Pablo Neira Ayuso 2021-04-27  6267  	if (err < 0)
20a1452c35425b Pablo Neira Ayuso 2020-01-22  6268  		goto fail_ops;
cc02e457bb86f7 Patrick McHardy   2015-03-25  6269  =

f8bb7889af58d8 Pablo Neira Ayuso 2021-04-27  6270  	nft_setelem_data_deacti=
vate(ctx->net, set, &elem);
591054469b3eef Pablo Neira Ayuso 2017-05-15  6271  =

60319eb1ca351a Pablo Neira Ayuso 2014-04-04  6272  	nft_trans_elem(trans) =
=3D elem;
0854db2aaef3fc Florian Westphal  2021-04-01  6273  	nft_trans_commit_list_a=
dd_tail(ctx->net, trans);
0dc1362562a2e8 Thomas Graf       2014-08-01  6274  	return 0;
cc02e457bb86f7 Patrick McHardy   2015-03-25  6275  =

20a1452c35425b Pablo Neira Ayuso 2020-01-22  6276  fail_ops:
cc02e457bb86f7 Patrick McHardy   2015-03-25  6277  	kfree(trans);
20a1452c35425b Pablo Neira Ayuso 2020-01-22  6278  fail_trans:
3971ca14350062 Pablo Neira Ayuso 2016-04-12  6279  	kfree(elem.priv);
0973c5bfbf138f Pablo Neira Ayuso 2022-07-08  6280  fail_elem_key_end:
0973c5bfbf138f Pablo Neira Ayuso 2022-07-08  6281  	nft_data_release(&elem.=
key_end.val, NFT_DATA_VALUE);
20a1452c35425b Pablo Neira Ayuso 2020-01-22  6282  fail_elem:
20a1452c35425b Pablo Neira Ayuso 2020-01-22  6283  	nft_data_release(&elem.=
key.val, NFT_DATA_VALUE);
0973c5bfbf138f Pablo Neira Ayuso 2022-07-08  6284  =

20a69341f2d00c Patrick McHardy   2013-10-11  6285  	return err;
20a69341f2d00c Patrick McHardy   2013-10-11  6286  }
20a69341f2d00c Patrick McHardy   2013-10-11  6287  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============5216201031229490827==--

