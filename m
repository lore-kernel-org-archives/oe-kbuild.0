Content-Type: multipart/mixed; boundary="===============0632405065441409666=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [toke:xdp-queueing-02 1/11] net/bpf/test_run.c:1283 bpf_prog_test_run_xdp() error: uninitialized symbol 'retval'.
Date: Mon, 14 Feb 2022 10:26:54 +0800
Message-ID: <202202141041.KsCyqs1S-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============0632405065441409666==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: "Toke H=C3=B8iland-J=C3=B8rgensen" <toke@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/toke/linux.git xdp-=
queueing-02
head:   8bd2763fc2cbca45d99f73fa9715bffdc265ec05
commit: 40f91d04974533debd52c4d573793b680619981f [1/11] bpf: Add "live pack=
et" mode for XDP in BPF_PROG_RUN
:::::: branch date: 4 hours ago
:::::: commit date: 10 hours ago
config: i386-randconfig-m021 (https://download.01.org/0day-ci/archive/20220=
214/202202141041.KsCyqs1S-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
net/bpf/test_run.c:1283 bpf_prog_test_run_xdp() error: uninitialized symbol=
 'retval'.

vim +/retval +1283 net/bpf/test_run.c

47316f4a305367 Zvi Effron             2021-07-07  1171  =

1cf1cae963c2e6 Alexei Starovoitov     2017-03-30  1172  int bpf_prog_test_r=
un_xdp(struct bpf_prog *prog, const union bpf_attr *kattr,
1cf1cae963c2e6 Alexei Starovoitov     2017-03-30  1173  			  union bpf_attr=
 __user *uattr)
1cf1cae963c2e6 Alexei Starovoitov     2017-03-30  1174  {
40f91d04974533 Toke H=C3=B8iland-J=C3=B8rgensen 2021-11-08  1175  	bool do_=
live =3D (kattr->test.flags & BPF_F_TEST_XDP_LIVE_FRAMES);
bc56c919fce782 Jesper Dangaard Brouer 2020-05-14  1176  	u32 tailroom =3D S=
KB_DATA_ALIGN(sizeof(struct skb_shared_info));
1cf1cae963c2e6 Alexei Starovoitov     2017-03-30  1177  	u32 size =3D kattr=
->test.data_size_in;
1c194998252469 Lorenzo Bianconi       2022-01-21  1178  	u32 headroom =3D X=
DP_PACKET_HEADROOM;
1c194998252469 Lorenzo Bianconi       2022-01-21  1179  	u32 retval, durati=
on, max_data_sz;
1cf1cae963c2e6 Alexei Starovoitov     2017-03-30  1180  	u32 repeat =3D kat=
tr->test.repeat;
65073a67331de3 Daniel Borkmann        2018-01-31  1181  	struct netdev_rx_q=
ueue *rxqueue;
1c194998252469 Lorenzo Bianconi       2022-01-21  1182  	struct skb_shared_=
info *sinfo;
1cf1cae963c2e6 Alexei Starovoitov     2017-03-30  1183  	struct xdp_buff xd=
p =3D {};
1c194998252469 Lorenzo Bianconi       2022-01-21  1184  	int i, ret =3D -EI=
NVAL;
47316f4a305367 Zvi Effron             2021-07-07  1185  	struct xdp_md *ctx;
1cf1cae963c2e6 Alexei Starovoitov     2017-03-30  1186  	void *data;
1cf1cae963c2e6 Alexei Starovoitov     2017-03-30  1187  =

5e21bb4e812566 Xuan Zhuo              2021-07-08  1188  	if (prog->expected=
_attach_type =3D=3D BPF_XDP_DEVMAP ||
5e21bb4e812566 Xuan Zhuo              2021-07-08  1189  	    prog->expected=
_attach_type =3D=3D BPF_XDP_CPUMAP)
5e21bb4e812566 Xuan Zhuo              2021-07-08  1190  		return -EINVAL;
6d4eb36d65979a Andrii Nakryiko        2021-08-04  1191  =

40f91d04974533 Toke H=C3=B8iland-J=C3=B8rgensen 2021-11-08  1192  	if (katt=
r->test.flags & ~BPF_F_TEST_XDP_LIVE_FRAMES)
40f91d04974533 Toke H=C3=B8iland-J=C3=B8rgensen 2021-11-08  1193  		return =
-EINVAL;
40f91d04974533 Toke H=C3=B8iland-J=C3=B8rgensen 2021-11-08  1194  =

47316f4a305367 Zvi Effron             2021-07-07  1195  	ctx =3D bpf_ctx_in=
it(kattr, sizeof(struct xdp_md));
47316f4a305367 Zvi Effron             2021-07-07  1196  	if (IS_ERR(ctx))
47316f4a305367 Zvi Effron             2021-07-07  1197  		return PTR_ERR(ct=
x);
47316f4a305367 Zvi Effron             2021-07-07  1198  =

47316f4a305367 Zvi Effron             2021-07-07  1199  	if (ctx) {
47316f4a305367 Zvi Effron             2021-07-07  1200  		/* There can't be=
 user provided data before the meta data */
47316f4a305367 Zvi Effron             2021-07-07  1201  		if (ctx->data_met=
a || ctx->data_end !=3D size ||
47316f4a305367 Zvi Effron             2021-07-07  1202  		    ctx->data > c=
tx->data_end ||
40f91d04974533 Toke H=C3=B8iland-J=C3=B8rgensen 2021-11-08  1203  		    unl=
ikely(xdp_metalen_invalid(ctx->data)) ||
40f91d04974533 Toke H=C3=B8iland-J=C3=B8rgensen 2021-11-08  1204  		    (do=
_live && (kattr->test.data_out || kattr->test.ctx_out)))
47316f4a305367 Zvi Effron             2021-07-07  1205  			goto free_ctx;
47316f4a305367 Zvi Effron             2021-07-07  1206  		/* Meta data is a=
llocated from the headroom */
47316f4a305367 Zvi Effron             2021-07-07  1207  		headroom -=3D ctx=
->data;
47316f4a305367 Zvi Effron             2021-07-07  1208  	}
947e8b595b82d3 Stanislav Fomichev     2019-04-11  1209  =

bc56c919fce782 Jesper Dangaard Brouer 2020-05-14  1210  	max_data_sz =3D 40=
96 - headroom - tailroom;
1c194998252469 Lorenzo Bianconi       2022-01-21  1211  	size =3D min_t(u32=
, size, max_data_sz);
bc56c919fce782 Jesper Dangaard Brouer 2020-05-14  1212  =

1c194998252469 Lorenzo Bianconi       2022-01-21  1213  	data =3D bpf_test_=
init(kattr, size, max_data_sz, headroom, tailroom);
47316f4a305367 Zvi Effron             2021-07-07  1214  	if (IS_ERR(data)) {
47316f4a305367 Zvi Effron             2021-07-07  1215  		ret =3D PTR_ERR(d=
ata);
47316f4a305367 Zvi Effron             2021-07-07  1216  		goto free_ctx;
47316f4a305367 Zvi Effron             2021-07-07  1217  	}
1cf1cae963c2e6 Alexei Starovoitov     2017-03-30  1218  =

65073a67331de3 Daniel Borkmann        2018-01-31  1219  	rxqueue =3D __neti=
f_get_rx_queue(current->nsproxy->net_ns->loopback_dev, 0);
1c194998252469 Lorenzo Bianconi       2022-01-21  1220  	rxqueue->xdp_rxq.f=
rag_size =3D headroom + max_data_sz + tailroom;
1c194998252469 Lorenzo Bianconi       2022-01-21  1221  	xdp_init_buff(&xdp=
, rxqueue->xdp_rxq.frag_size, &rxqueue->xdp_rxq);
be9df4aff65f18 Lorenzo Bianconi       2020-12-22  1222  	xdp_prepare_buff(&=
xdp, data, headroom, size, true);
1c194998252469 Lorenzo Bianconi       2022-01-21  1223  	sinfo =3D xdp_get_=
shared_info_from_buff(&xdp);
be9df4aff65f18 Lorenzo Bianconi       2020-12-22  1224  =

47316f4a305367 Zvi Effron             2021-07-07  1225  	ret =3D xdp_conver=
t_md_to_buff(ctx, &xdp);
47316f4a305367 Zvi Effron             2021-07-07  1226  	if (ret)
47316f4a305367 Zvi Effron             2021-07-07  1227  		goto free_data;
47316f4a305367 Zvi Effron             2021-07-07  1228  =

1c194998252469 Lorenzo Bianconi       2022-01-21  1229  	if (unlikely(kattr=
->test.data_size_in > size)) {
1c194998252469 Lorenzo Bianconi       2022-01-21  1230  		void __user *data=
_in =3D u64_to_user_ptr(kattr->test.data_in);
1c194998252469 Lorenzo Bianconi       2022-01-21  1231  =

1c194998252469 Lorenzo Bianconi       2022-01-21  1232  		while (size < kat=
tr->test.data_size_in) {
1c194998252469 Lorenzo Bianconi       2022-01-21  1233  			struct page *pag=
e;
1c194998252469 Lorenzo Bianconi       2022-01-21  1234  			skb_frag_t *frag;
9d63b59d1e9d2d Stanislav Fomichev     2022-02-04  1235  			u32 data_len;
1c194998252469 Lorenzo Bianconi       2022-01-21  1236  =

a6763080856f44 Lorenzo Bianconi       2022-02-02  1237  			if (sinfo->nr_fr=
ags =3D=3D MAX_SKB_FRAGS) {
a6763080856f44 Lorenzo Bianconi       2022-02-02  1238  				ret =3D -ENOMEM;
a6763080856f44 Lorenzo Bianconi       2022-02-02  1239  				goto out;
a6763080856f44 Lorenzo Bianconi       2022-02-02  1240  			}
a6763080856f44 Lorenzo Bianconi       2022-02-02  1241  =

1c194998252469 Lorenzo Bianconi       2022-01-21  1242  			page =3D alloc_p=
age(GFP_KERNEL);
1c194998252469 Lorenzo Bianconi       2022-01-21  1243  			if (!page) {
1c194998252469 Lorenzo Bianconi       2022-01-21  1244  				ret =3D -ENOMEM;
1c194998252469 Lorenzo Bianconi       2022-01-21  1245  				goto out;
1c194998252469 Lorenzo Bianconi       2022-01-21  1246  			}
1c194998252469 Lorenzo Bianconi       2022-01-21  1247  =

1c194998252469 Lorenzo Bianconi       2022-01-21  1248  			frag =3D &sinfo-=
>frags[sinfo->nr_frags++];
1c194998252469 Lorenzo Bianconi       2022-01-21  1249  			__skb_frag_set_p=
age(frag, page);
1c194998252469 Lorenzo Bianconi       2022-01-21  1250  =

9d63b59d1e9d2d Stanislav Fomichev     2022-02-04  1251  			data_len =3D min=
_t(u32, kattr->test.data_size_in - size,
1c194998252469 Lorenzo Bianconi       2022-01-21  1252  					 PAGE_SIZE);
1c194998252469 Lorenzo Bianconi       2022-01-21  1253  			skb_frag_size_se=
t(frag, data_len);
1c194998252469 Lorenzo Bianconi       2022-01-21  1254  =

1c194998252469 Lorenzo Bianconi       2022-01-21  1255  			if (copy_from_us=
er(page_address(page), data_in + size,
1c194998252469 Lorenzo Bianconi       2022-01-21  1256  					   data_len)) {
1c194998252469 Lorenzo Bianconi       2022-01-21  1257  				ret =3D -EFAULT;
1c194998252469 Lorenzo Bianconi       2022-01-21  1258  				goto out;
1c194998252469 Lorenzo Bianconi       2022-01-21  1259  			}
1c194998252469 Lorenzo Bianconi       2022-01-21  1260  			sinfo->xdp_frags=
_size +=3D data_len;
1c194998252469 Lorenzo Bianconi       2022-01-21  1261  			size +=3D data_l=
en;
1c194998252469 Lorenzo Bianconi       2022-01-21  1262  		}
1c194998252469 Lorenzo Bianconi       2022-01-21  1263  		xdp_buff_set_frag=
s_flag(&xdp);
1c194998252469 Lorenzo Bianconi       2022-01-21  1264  	}
1c194998252469 Lorenzo Bianconi       2022-01-21  1265  =

de21d8bf777240 Lorenz Bauer           2021-09-28  1266  	if (repeat > 1)
f23c4b3924d2e9 Bj=C3=B6rn T=C3=B6pel            2019-12-13  1267  		bpf_pro=
g_change_xdp(NULL, prog);
1c194998252469 Lorenzo Bianconi       2022-01-21  1268  =

40f91d04974533 Toke H=C3=B8iland-J=C3=B8rgensen 2021-11-08  1269  	if (do_l=
ive)
40f91d04974533 Toke H=C3=B8iland-J=C3=B8rgensen 2021-11-08  1270  		ret =3D=
 bpf_test_run_xdp_live(prog, &xdp, repeat, &duration);
40f91d04974533 Toke H=C3=B8iland-J=C3=B8rgensen 2021-11-08  1271  	else
f23c4b3924d2e9 Bj=C3=B6rn T=C3=B6pel            2019-12-13  1272  		ret =3D=
 bpf_test_run(prog, &xdp, repeat, &retval, &duration, true);
ec94670fcb3bde Zvi Effron             2021-07-07  1273  	/* We convert the =
xdp_buff back to an xdp_md before checking the return
ec94670fcb3bde Zvi Effron             2021-07-07  1274  	 * code so the ref=
erence count of any held netdevice will be decremented
ec94670fcb3bde Zvi Effron             2021-07-07  1275  	 * even if the tes=
t run failed.
ec94670fcb3bde Zvi Effron             2021-07-07  1276  	 */
ec94670fcb3bde Zvi Effron             2021-07-07  1277  	xdp_convert_buff_t=
o_md(&xdp, ctx);
dcb40590e69e30 Roman Gushchin         2018-12-01  1278  	if (ret)
dcb40590e69e30 Roman Gushchin         2018-12-01  1279  		goto out;
47316f4a305367 Zvi Effron             2021-07-07  1280  =

1c194998252469 Lorenzo Bianconi       2022-01-21  1281  	size =3D xdp.data_=
end - xdp.data_meta + sinfo->xdp_frags_size;
7855e0db150ad8 Lorenzo Bianconi       2022-01-21  1282  	ret =3D bpf_test_f=
inish(kattr, uattr, xdp.data_meta, sinfo, size,
7855e0db150ad8 Lorenzo Bianconi       2022-01-21 @1283  			      retval, du=
ration);
47316f4a305367 Zvi Effron             2021-07-07  1284  	if (!ret)
47316f4a305367 Zvi Effron             2021-07-07  1285  		ret =3D bpf_ctx_f=
inish(kattr, uattr, ctx,
47316f4a305367 Zvi Effron             2021-07-07  1286  				     sizeof(str=
uct xdp_md));
47316f4a305367 Zvi Effron             2021-07-07  1287  =

dcb40590e69e30 Roman Gushchin         2018-12-01  1288  out:
de21d8bf777240 Lorenz Bauer           2021-09-28  1289  	if (repeat > 1)
f23c4b3924d2e9 Bj=C3=B6rn T=C3=B6pel            2019-12-13  1290  		bpf_pro=
g_change_xdp(prog, NULL);
47316f4a305367 Zvi Effron             2021-07-07  1291  free_data:
1c194998252469 Lorenzo Bianconi       2022-01-21  1292  	for (i =3D 0; i < =
sinfo->nr_frags; i++)
1c194998252469 Lorenzo Bianconi       2022-01-21  1293  		__free_page(skb_f=
rag_page(&sinfo->frags[i]));
1cf1cae963c2e6 Alexei Starovoitov     2017-03-30  1294  	kfree(data);
47316f4a305367 Zvi Effron             2021-07-07  1295  free_ctx:
47316f4a305367 Zvi Effron             2021-07-07  1296  	kfree(ctx);
1cf1cae963c2e6 Alexei Starovoitov     2017-03-30  1297  	return ret;
1cf1cae963c2e6 Alexei Starovoitov     2017-03-30  1298  }
b7a1848e8398b8 Stanislav Fomichev     2019-01-28  1299  =


:::::: The code at line 1283 was first introduced by commit
:::::: 7855e0db150ad8f494d66913c26deadc52f12e07 bpf: test_run: add xdp_shar=
ed_info pointer in bpf_test_finish signature

:::::: TO: Lorenzo Bianconi <lorenzo@kernel.org>
:::::: CC: Alexei Starovoitov <ast@kernel.org>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============0632405065441409666==--

