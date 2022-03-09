Content-Type: multipart/mixed; boundary="===============7589455736684764897=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH bpf-next v11 1/5] bpf: Add "live packet" mode for XDP in BPF_PROG_RUN
Date: Thu, 10 Mar 2022 02:54:06 +0800
Message-ID: <202203100251.SOmWR7MI-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============7589455736684764897==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
In-Reply-To: <20220309105346.100053-2-toke@redhat.com>
References: <20220309105346.100053-2-toke@redhat.com>
TO: "Toke H=C3=B8iland-J=C3=B8rgensen" <toke@redhat.com>

Hi "Toke,

I love your patch! Perhaps something to improve:

[auto build test WARNING on bpf-next/master]

url:    https://github.com/0day-ci/linux/commits/Toke-H-iland-J-rgensen/Add=
-support-for-transmitting-packets-using-XDP-in-bpf_prog_run/20220309-185524
base:   https://git.kernel.org/pub/scm/linux/kernel/git/bpf/bpf-next.git ma=
ster
:::::: branch date: 8 hours ago
:::::: commit date: 8 hours ago
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20220=
310/202203100251.SOmWR7MI-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
net/bpf/test_run.c:1330 bpf_prog_test_run_xdp() error: uninitialized symbol=
 'retval'.

vim +/retval +1330 net/bpf/test_run.c

47316f4a305367 Zvi Effron             2021-07-07  1203  =

1cf1cae963c2e6 Alexei Starovoitov     2017-03-30  1204  int bpf_prog_test_r=
un_xdp(struct bpf_prog *prog, const union bpf_attr *kattr,
1cf1cae963c2e6 Alexei Starovoitov     2017-03-30  1205  			  union bpf_attr=
 __user *uattr)
1cf1cae963c2e6 Alexei Starovoitov     2017-03-30  1206  {
429da9d7b2fa52 Toke H=C3=B8iland-J=C3=B8rgensen 2022-03-09  1207  	bool do_=
live =3D (kattr->test.flags & BPF_F_TEST_XDP_LIVE_FRAMES);
bc56c919fce782 Jesper Dangaard Brouer 2020-05-14  1208  	u32 tailroom =3D S=
KB_DATA_ALIGN(sizeof(struct skb_shared_info));
429da9d7b2fa52 Toke H=C3=B8iland-J=C3=B8rgensen 2022-03-09  1209  	u32 batc=
h_size =3D kattr->test.batch_size;
1cf1cae963c2e6 Alexei Starovoitov     2017-03-30  1210  	u32 size =3D kattr=
->test.data_size_in;
1c194998252469 Lorenzo Bianconi       2022-01-21  1211  	u32 headroom =3D X=
DP_PACKET_HEADROOM;
1c194998252469 Lorenzo Bianconi       2022-01-21  1212  	u32 retval, durati=
on, max_data_sz;
1cf1cae963c2e6 Alexei Starovoitov     2017-03-30  1213  	u32 repeat =3D kat=
tr->test.repeat;
65073a67331de3 Daniel Borkmann        2018-01-31  1214  	struct netdev_rx_q=
ueue *rxqueue;
1c194998252469 Lorenzo Bianconi       2022-01-21  1215  	struct skb_shared_=
info *sinfo;
1cf1cae963c2e6 Alexei Starovoitov     2017-03-30  1216  	struct xdp_buff xd=
p =3D {};
1c194998252469 Lorenzo Bianconi       2022-01-21  1217  	int i, ret =3D -EI=
NVAL;
47316f4a305367 Zvi Effron             2021-07-07  1218  	struct xdp_md *ctx;
1cf1cae963c2e6 Alexei Starovoitov     2017-03-30  1219  	void *data;
1cf1cae963c2e6 Alexei Starovoitov     2017-03-30  1220  =

5e21bb4e812566 Xuan Zhuo              2021-07-08  1221  	if (prog->expected=
_attach_type =3D=3D BPF_XDP_DEVMAP ||
5e21bb4e812566 Xuan Zhuo              2021-07-08  1222  	    prog->expected=
_attach_type =3D=3D BPF_XDP_CPUMAP)
5e21bb4e812566 Xuan Zhuo              2021-07-08  1223  		return -EINVAL;
6d4eb36d65979a Andrii Nakryiko        2021-08-04  1224  =

429da9d7b2fa52 Toke H=C3=B8iland-J=C3=B8rgensen 2022-03-09  1225  	if (katt=
r->test.flags & ~BPF_F_TEST_XDP_LIVE_FRAMES)
429da9d7b2fa52 Toke H=C3=B8iland-J=C3=B8rgensen 2022-03-09  1226  		return =
-EINVAL;
429da9d7b2fa52 Toke H=C3=B8iland-J=C3=B8rgensen 2022-03-09  1227  =

429da9d7b2fa52 Toke H=C3=B8iland-J=C3=B8rgensen 2022-03-09  1228  	if (do_l=
ive) {
429da9d7b2fa52 Toke H=C3=B8iland-J=C3=B8rgensen 2022-03-09  1229  		if (!ba=
tch_size)
429da9d7b2fa52 Toke H=C3=B8iland-J=C3=B8rgensen 2022-03-09  1230  			batch_=
size =3D NAPI_POLL_WEIGHT;
429da9d7b2fa52 Toke H=C3=B8iland-J=C3=B8rgensen 2022-03-09  1231  		else if=
 (batch_size > TEST_XDP_MAX_BATCH)
429da9d7b2fa52 Toke H=C3=B8iland-J=C3=B8rgensen 2022-03-09  1232  			return=
 -E2BIG;
429da9d7b2fa52 Toke H=C3=B8iland-J=C3=B8rgensen 2022-03-09  1233  	} else i=
f (batch_size) {
429da9d7b2fa52 Toke H=C3=B8iland-J=C3=B8rgensen 2022-03-09  1234  		return =
-EINVAL;
429da9d7b2fa52 Toke H=C3=B8iland-J=C3=B8rgensen 2022-03-09  1235  	}
429da9d7b2fa52 Toke H=C3=B8iland-J=C3=B8rgensen 2022-03-09  1236  =

47316f4a305367 Zvi Effron             2021-07-07  1237  	ctx =3D bpf_ctx_in=
it(kattr, sizeof(struct xdp_md));
47316f4a305367 Zvi Effron             2021-07-07  1238  	if (IS_ERR(ctx))
47316f4a305367 Zvi Effron             2021-07-07  1239  		return PTR_ERR(ct=
x);
47316f4a305367 Zvi Effron             2021-07-07  1240  =

47316f4a305367 Zvi Effron             2021-07-07  1241  	if (ctx) {
47316f4a305367 Zvi Effron             2021-07-07  1242  		/* There can't be=
 user provided data before the meta data */
47316f4a305367 Zvi Effron             2021-07-07  1243  		if (ctx->data_met=
a || ctx->data_end !=3D size ||
47316f4a305367 Zvi Effron             2021-07-07  1244  		    ctx->data > c=
tx->data_end ||
429da9d7b2fa52 Toke H=C3=B8iland-J=C3=B8rgensen 2022-03-09  1245  		    unl=
ikely(xdp_metalen_invalid(ctx->data)) ||
429da9d7b2fa52 Toke H=C3=B8iland-J=C3=B8rgensen 2022-03-09  1246  		    (do=
_live && (kattr->test.data_out || kattr->test.ctx_out)))
47316f4a305367 Zvi Effron             2021-07-07  1247  			goto free_ctx;
47316f4a305367 Zvi Effron             2021-07-07  1248  		/* Meta data is a=
llocated from the headroom */
47316f4a305367 Zvi Effron             2021-07-07  1249  		headroom -=3D ctx=
->data;
47316f4a305367 Zvi Effron             2021-07-07  1250  	}
947e8b595b82d3 Stanislav Fomichev     2019-04-11  1251  =

bc56c919fce782 Jesper Dangaard Brouer 2020-05-14  1252  	max_data_sz =3D 40=
96 - headroom - tailroom;
429da9d7b2fa52 Toke H=C3=B8iland-J=C3=B8rgensen 2022-03-09  1253  	if (size=
 > max_data_sz) {
429da9d7b2fa52 Toke H=C3=B8iland-J=C3=B8rgensen 2022-03-09  1254  		/* disa=
llow live data mode for jumbo frames */
429da9d7b2fa52 Toke H=C3=B8iland-J=C3=B8rgensen 2022-03-09  1255  		if (do_=
live)
429da9d7b2fa52 Toke H=C3=B8iland-J=C3=B8rgensen 2022-03-09  1256  			goto f=
ree_ctx;
429da9d7b2fa52 Toke H=C3=B8iland-J=C3=B8rgensen 2022-03-09  1257  		size =
=3D max_data_sz;
429da9d7b2fa52 Toke H=C3=B8iland-J=C3=B8rgensen 2022-03-09  1258  	}
bc56c919fce782 Jesper Dangaard Brouer 2020-05-14  1259  =

1c194998252469 Lorenzo Bianconi       2022-01-21  1260  	data =3D bpf_test_=
init(kattr, size, max_data_sz, headroom, tailroom);
47316f4a305367 Zvi Effron             2021-07-07  1261  	if (IS_ERR(data)) {
47316f4a305367 Zvi Effron             2021-07-07  1262  		ret =3D PTR_ERR(d=
ata);
47316f4a305367 Zvi Effron             2021-07-07  1263  		goto free_ctx;
47316f4a305367 Zvi Effron             2021-07-07  1264  	}
1cf1cae963c2e6 Alexei Starovoitov     2017-03-30  1265  =

65073a67331de3 Daniel Borkmann        2018-01-31  1266  	rxqueue =3D __neti=
f_get_rx_queue(current->nsproxy->net_ns->loopback_dev, 0);
1c194998252469 Lorenzo Bianconi       2022-01-21  1267  	rxqueue->xdp_rxq.f=
rag_size =3D headroom + max_data_sz + tailroom;
1c194998252469 Lorenzo Bianconi       2022-01-21  1268  	xdp_init_buff(&xdp=
, rxqueue->xdp_rxq.frag_size, &rxqueue->xdp_rxq);
be9df4aff65f18 Lorenzo Bianconi       2020-12-22  1269  	xdp_prepare_buff(&=
xdp, data, headroom, size, true);
1c194998252469 Lorenzo Bianconi       2022-01-21  1270  	sinfo =3D xdp_get_=
shared_info_from_buff(&xdp);
be9df4aff65f18 Lorenzo Bianconi       2020-12-22  1271  =

47316f4a305367 Zvi Effron             2021-07-07  1272  	ret =3D xdp_conver=
t_md_to_buff(ctx, &xdp);
47316f4a305367 Zvi Effron             2021-07-07  1273  	if (ret)
47316f4a305367 Zvi Effron             2021-07-07  1274  		goto free_data;
47316f4a305367 Zvi Effron             2021-07-07  1275  =

1c194998252469 Lorenzo Bianconi       2022-01-21  1276  	if (unlikely(kattr=
->test.data_size_in > size)) {
1c194998252469 Lorenzo Bianconi       2022-01-21  1277  		void __user *data=
_in =3D u64_to_user_ptr(kattr->test.data_in);
1c194998252469 Lorenzo Bianconi       2022-01-21  1278  =

1c194998252469 Lorenzo Bianconi       2022-01-21  1279  		while (size < kat=
tr->test.data_size_in) {
1c194998252469 Lorenzo Bianconi       2022-01-21  1280  			struct page *pag=
e;
1c194998252469 Lorenzo Bianconi       2022-01-21  1281  			skb_frag_t *frag;
9d63b59d1e9d2d Stanislav Fomichev     2022-02-04  1282  			u32 data_len;
1c194998252469 Lorenzo Bianconi       2022-01-21  1283  =

a6763080856f44 Lorenzo Bianconi       2022-02-02  1284  			if (sinfo->nr_fr=
ags =3D=3D MAX_SKB_FRAGS) {
a6763080856f44 Lorenzo Bianconi       2022-02-02  1285  				ret =3D -ENOMEM;
a6763080856f44 Lorenzo Bianconi       2022-02-02  1286  				goto out;
a6763080856f44 Lorenzo Bianconi       2022-02-02  1287  			}
a6763080856f44 Lorenzo Bianconi       2022-02-02  1288  =

1c194998252469 Lorenzo Bianconi       2022-01-21  1289  			page =3D alloc_p=
age(GFP_KERNEL);
1c194998252469 Lorenzo Bianconi       2022-01-21  1290  			if (!page) {
1c194998252469 Lorenzo Bianconi       2022-01-21  1291  				ret =3D -ENOMEM;
1c194998252469 Lorenzo Bianconi       2022-01-21  1292  				goto out;
1c194998252469 Lorenzo Bianconi       2022-01-21  1293  			}
1c194998252469 Lorenzo Bianconi       2022-01-21  1294  =

1c194998252469 Lorenzo Bianconi       2022-01-21  1295  			frag =3D &sinfo-=
>frags[sinfo->nr_frags++];
1c194998252469 Lorenzo Bianconi       2022-01-21  1296  			__skb_frag_set_p=
age(frag, page);
1c194998252469 Lorenzo Bianconi       2022-01-21  1297  =

9d63b59d1e9d2d Stanislav Fomichev     2022-02-04  1298  			data_len =3D min=
_t(u32, kattr->test.data_size_in - size,
1c194998252469 Lorenzo Bianconi       2022-01-21  1299  					 PAGE_SIZE);
1c194998252469 Lorenzo Bianconi       2022-01-21  1300  			skb_frag_size_se=
t(frag, data_len);
1c194998252469 Lorenzo Bianconi       2022-01-21  1301  =

1c194998252469 Lorenzo Bianconi       2022-01-21  1302  			if (copy_from_us=
er(page_address(page), data_in + size,
1c194998252469 Lorenzo Bianconi       2022-01-21  1303  					   data_len)) {
1c194998252469 Lorenzo Bianconi       2022-01-21  1304  				ret =3D -EFAULT;
1c194998252469 Lorenzo Bianconi       2022-01-21  1305  				goto out;
1c194998252469 Lorenzo Bianconi       2022-01-21  1306  			}
1c194998252469 Lorenzo Bianconi       2022-01-21  1307  			sinfo->xdp_frags=
_size +=3D data_len;
1c194998252469 Lorenzo Bianconi       2022-01-21  1308  			size +=3D data_l=
en;
1c194998252469 Lorenzo Bianconi       2022-01-21  1309  		}
1c194998252469 Lorenzo Bianconi       2022-01-21  1310  		xdp_buff_set_frag=
s_flag(&xdp);
1c194998252469 Lorenzo Bianconi       2022-01-21  1311  	}
1c194998252469 Lorenzo Bianconi       2022-01-21  1312  =

de21d8bf777240 Lorenz Bauer           2021-09-28  1313  	if (repeat > 1)
f23c4b3924d2e9 Bj=C3=B6rn T=C3=B6pel            2019-12-13  1314  		bpf_pro=
g_change_xdp(NULL, prog);
1c194998252469 Lorenzo Bianconi       2022-01-21  1315  =

429da9d7b2fa52 Toke H=C3=B8iland-J=C3=B8rgensen 2022-03-09  1316  	if (do_l=
ive)
429da9d7b2fa52 Toke H=C3=B8iland-J=C3=B8rgensen 2022-03-09  1317  		ret =3D=
 bpf_test_run_xdp_live(prog, &xdp, repeat, batch_size, &duration);
429da9d7b2fa52 Toke H=C3=B8iland-J=C3=B8rgensen 2022-03-09  1318  	else
f23c4b3924d2e9 Bj=C3=B6rn T=C3=B6pel            2019-12-13  1319  		ret =3D=
 bpf_test_run(prog, &xdp, repeat, &retval, &duration, true);
ec94670fcb3bde Zvi Effron             2021-07-07  1320  	/* We convert the =
xdp_buff back to an xdp_md before checking the return
ec94670fcb3bde Zvi Effron             2021-07-07  1321  	 * code so the ref=
erence count of any held netdevice will be decremented
ec94670fcb3bde Zvi Effron             2021-07-07  1322  	 * even if the tes=
t run failed.
ec94670fcb3bde Zvi Effron             2021-07-07  1323  	 */
ec94670fcb3bde Zvi Effron             2021-07-07  1324  	xdp_convert_buff_t=
o_md(&xdp, ctx);
dcb40590e69e30 Roman Gushchin         2018-12-01  1325  	if (ret)
dcb40590e69e30 Roman Gushchin         2018-12-01  1326  		goto out;
47316f4a305367 Zvi Effron             2021-07-07  1327  =

1c194998252469 Lorenzo Bianconi       2022-01-21  1328  	size =3D xdp.data_=
end - xdp.data_meta + sinfo->xdp_frags_size;
7855e0db150ad8 Lorenzo Bianconi       2022-01-21  1329  	ret =3D bpf_test_f=
inish(kattr, uattr, xdp.data_meta, sinfo, size,
7855e0db150ad8 Lorenzo Bianconi       2022-01-21 @1330  			      retval, du=
ration);
47316f4a305367 Zvi Effron             2021-07-07  1331  	if (!ret)
47316f4a305367 Zvi Effron             2021-07-07  1332  		ret =3D bpf_ctx_f=
inish(kattr, uattr, ctx,
47316f4a305367 Zvi Effron             2021-07-07  1333  				     sizeof(str=
uct xdp_md));
47316f4a305367 Zvi Effron             2021-07-07  1334  =

dcb40590e69e30 Roman Gushchin         2018-12-01  1335  out:
de21d8bf777240 Lorenz Bauer           2021-09-28  1336  	if (repeat > 1)
f23c4b3924d2e9 Bj=C3=B6rn T=C3=B6pel            2019-12-13  1337  		bpf_pro=
g_change_xdp(prog, NULL);
47316f4a305367 Zvi Effron             2021-07-07  1338  free_data:
1c194998252469 Lorenzo Bianconi       2022-01-21  1339  	for (i =3D 0; i < =
sinfo->nr_frags; i++)
1c194998252469 Lorenzo Bianconi       2022-01-21  1340  		__free_page(skb_f=
rag_page(&sinfo->frags[i]));
1cf1cae963c2e6 Alexei Starovoitov     2017-03-30  1341  	kfree(data);
47316f4a305367 Zvi Effron             2021-07-07  1342  free_ctx:
47316f4a305367 Zvi Effron             2021-07-07  1343  	kfree(ctx);
1cf1cae963c2e6 Alexei Starovoitov     2017-03-30  1344  	return ret;
1cf1cae963c2e6 Alexei Starovoitov     2017-03-30  1345  }
b7a1848e8398b8 Stanislav Fomichev     2019-01-28  1346  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============7589455736684764897==--

