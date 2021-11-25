Content-Type: multipart/mixed; boundary="===============1669489798632810999=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: sound/soc/qcom/qdsp6/topology.c:336 audioreach_parse_sg_tokens() error: potentially dereferencing uninitialized 'sg'.
Date: Thu, 25 Nov 2021 23:25:46 +0800
Message-ID: <202111252332.UegXaVMP-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============1669489798632810999==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Srinivas Kandagatla <srinivas.kandagatla@linaro.org>
CC: Mark Brown <broonie@kernel.org>
CC: "Pierre-Louis Bossart" <pierre-louis.bossart@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   5f53fa508db098c9d372423a6dac31c8a5679cdf
commit: 36ad9bf1d93d66b901342eab9f8ed6c1537655a6 ASoC: qdsp6: audioreach: a=
dd topology support
date:   4 weeks ago
:::::: branch date: 21 hours ago
:::::: commit date: 4 weeks ago
config: openrisc-randconfig-m031-20211122 (https://download.01.org/0day-ci/=
archive/20211125/202111252332.UegXaVMP-lkp(a)intel.com/config)
compiler: or1k-linux-gcc (GCC) 11.2.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

New smatch warnings:
sound/soc/qcom/qdsp6/topology.c:336 audioreach_parse_sg_tokens() error: pot=
entially dereferencing uninitialized 'sg'.
sound/soc/qcom/qdsp6/topology.c:355 audioreach_parse_sg_tokens() error: uni=
nitialized symbol 'sg'.
sound/soc/qcom/qdsp6/topology.c:382 audioreach_parse_cont_tokens() error: p=
otentially dereferencing uninitialized 'cont'.
sound/soc/qcom/qdsp6/topology.c:402 audioreach_parse_cont_tokens() error: u=
ninitialized symbol 'cont'.

Old smatch warnings:
sound/soc/qcom/qdsp6/topology.c:339 audioreach_parse_sg_tokens() error: pot=
entially dereferencing uninitialized 'sg'.
sound/soc/qcom/qdsp6/topology.c:342 audioreach_parse_sg_tokens() error: pot=
entially dereferencing uninitialized 'sg'.
sound/soc/qcom/qdsp6/topology.c:357 audioreach_parse_sg_tokens() error: uni=
nitialized symbol 'sg'.
sound/soc/qcom/qdsp6/topology.c:385 audioreach_parse_cont_tokens() error: p=
otentially dereferencing uninitialized 'cont'.
sound/soc/qcom/qdsp6/topology.c:388 audioreach_parse_cont_tokens() error: p=
otentially dereferencing uninitialized 'cont'.
sound/soc/qcom/qdsp6/topology.c:391 audioreach_parse_cont_tokens() error: p=
otentially dereferencing uninitialized 'cont'.

vim +/sg +336 sound/soc/qcom/qdsp6/topology.c

36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  302  =

36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  303  static struct audiorea=
ch_sub_graph *audioreach_parse_sg_tokens(struct q6apm *apm,
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  304  						       struct sn=
d_soc_tplg_private *private)
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  305  {
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  306  	struct snd_soc_tplg_v=
endor_value_elem *sg_elem;
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  307  	struct snd_soc_tplg_v=
endor_array *sg_array;
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  308  	struct audioreach_gra=
ph_info *info =3D NULL;
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  309  	int graph_id, sub_gra=
ph_id, tkn_count =3D 0;
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  310  	struct audioreach_sub=
_graph *sg;
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  311  	bool found;
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  312  =

36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  313  	sg_array =3D audiorea=
ch_get_sg_array(private);
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  314  	sg_elem =3D sg_array-=
>value;
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  315  =

36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  316  	while (tkn_count <=3D=
 (le32_to_cpu(sg_array->num_elems) - 1)) {
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  317  		switch (le32_to_cpu(=
sg_elem->token)) {
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  318  		case AR_TKN_U32_SUB_=
GRAPH_INSTANCE_ID:
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  319  			sub_graph_id =3D le=
32_to_cpu(sg_elem->value);
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  320  			sg =3D audioreach_t=
plg_alloc_sub_graph(apm, sub_graph_id, &found);
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  321  			if (IS_ERR(sg)) {
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  322  				return sg;
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  323  			} else if (found) {
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  324  				/* Already parsed =
data for this sub-graph */
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  325  				return sg;
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  326  			}
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  327  			break;
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  328  		case AR_TKN_DAI_INDE=
X:
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  329  			/* Sub graph is ass=
ociated with predefined graph */
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  330  			graph_id =3D le32_t=
o_cpu(sg_elem->value);
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  331  			info =3D audioreach=
_tplg_alloc_graph_info(apm, graph_id, &found);
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  332  			if (IS_ERR(info))
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  333  				return ERR_CAST(in=
fo);
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  334  			break;
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  335  		case AR_TKN_U32_SUB_=
GRAPH_PERF_MODE:
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26 @336  			sg->perf_mode =3D l=
e32_to_cpu(sg_elem->value);
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  337  			break;
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  338  		case AR_TKN_U32_SUB_=
GRAPH_DIRECTION:
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  339  			sg->direction =3D l=
e32_to_cpu(sg_elem->value);
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  340  			break;
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  341  		case AR_TKN_U32_SUB_=
GRAPH_SCENARIO_ID:
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  342  			sg->scenario_id =3D=
 le32_to_cpu(sg_elem->value);
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  343  			break;
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  344  		default:
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  345  			dev_err(apm->dev, "=
Not a valid token %d for graph\n", sg_elem->token);
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  346  			break;
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  347  =

36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  348  		}
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  349  		tkn_count++;
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  350  		sg_elem++;
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  351  	}
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  352  =

36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  353  	/* Sub graph is assoc=
iated with predefined graph */
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  354  	if (info)
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26 @355  		audioreach_tplg_add_=
sub_graph(sg, info);
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  356  =

36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  357  	return sg;
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  358  }
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  359  =

36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  360  static struct audiorea=
ch_container *audioreach_parse_cont_tokens(struct q6apm *apm,
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  361  							 struct audiore=
ach_sub_graph *sg,
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  362  							 struct snd_soc=
_tplg_private *private)
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  363  {
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  364  	struct snd_soc_tplg_v=
endor_value_elem *cont_elem;
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  365  	struct snd_soc_tplg_v=
endor_array *cont_array;
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  366  	struct audioreach_con=
tainer *cont;
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  367  	int container_id, tkn=
_count =3D 0;
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  368  	bool found =3D false;
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  369  =

36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  370  	cont_array =3D audior=
each_get_cont_array(private);
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  371  	cont_elem =3D cont_ar=
ray->value;
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  372  =

36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  373  	while (tkn_count <=3D=
 (le32_to_cpu(cont_array->num_elems) - 1)) {
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  374  		switch (le32_to_cpu(=
cont_elem->token)) {
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  375  		case AR_TKN_U32_CONT=
AINER_INSTANCE_ID:
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  376  			container_id =3D le=
32_to_cpu(cont_elem->value);
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  377  			cont =3D audioreach=
_tplg_alloc_container(apm, sg, container_id, &found);
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  378  			if (IS_ERR(cont) ||=
 found)/* Error or Already parsed container data */
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  379  				return cont;
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  380  			break;
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  381  		case AR_TKN_U32_CONT=
AINER_CAPABILITY_ID:
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26 @382  			cont->capability_id=
 =3D le32_to_cpu(cont_elem->value);
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  383  			break;
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  384  		case AR_TKN_U32_CONT=
AINER_STACK_SIZE:
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  385  			cont->stack_size =
=3D le32_to_cpu(cont_elem->value);
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  386  			break;
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  387  		case AR_TKN_U32_CONT=
AINER_GRAPH_POS:
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  388  			cont->graph_pos =3D=
 le32_to_cpu(cont_elem->value);
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  389  			break;
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  390  		case AR_TKN_U32_CONT=
AINER_PROC_DOMAIN:
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  391  			cont->proc_domain =
=3D le32_to_cpu(cont_elem->value);
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  392  			break;
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  393  		default:
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  394  			dev_err(apm->dev, "=
Not a valid token %d for graph\n", cont_elem->token);
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  395  			break;
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  396  =

36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  397  		}
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  398  		tkn_count++;
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  399  		cont_elem++;
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  400  	}
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  401  =

36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26 @402  	return cont;
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  403  }
36ad9bf1d93d66b Srinivas Kandagatla 2021-10-26  404  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============1669489798632810999==--

