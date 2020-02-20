Content-Type: multipart/mixed; boundary="===============6766176512146840239=="
MIME-Version: 1.0
From: Dan Carpenter <dan.carpenter@oracle.com>
Subject: [linux-next:master 2342/3265] net/bluetooth/smp.c:2185 smp_cmd_pairing_random() error: uninitialized symbol 'passkey'.
Date: Thu, 20 Feb 2020 13:46:58 +0300
Message-ID: <20200220104657.GI19641@kadam>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6766176512146840239==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   1d7f85df0f9c0456520ae86dc597bca87980d253
commit: cee5f20fece32cd1722230cb05333f39db860698 [2342/3265] Bluetooth: sec=
ure bluetooth stack from bluedump attack

If you fix the issue, kindly add following tag
Reported-by: kbuild test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
net/bluetooth/smp.c:2185 smp_cmd_pairing_random() error: uninitialized symb=
ol 'passkey'.

# https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git/commi=
t/?id=3Dcee5f20fece32cd1722230cb05333f39db860698
git remote add linux-next https://git.kernel.org/pub/scm/linux/kernel/git/n=
ext/linux-next.git
git remote update linux-next
git checkout cee5f20fece32cd1722230cb05333f39db860698
vim +/passkey +2185 net/bluetooth/smp.c

da85e5e5afeb72 Vinicius Costa Gomes 2011-06-09  2113  static u8 smp_cmd_pai=
ring_random(struct l2cap_conn *conn, struct sk_buff *skb)
88ba43b662b6b9 Anderson Briglia     2011-06-09  2114  {
5d88cc73dded31 Johan Hedberg        2014-08-08  2115  	struct l2cap_chan *c=
han =3D conn->smp;
5d88cc73dded31 Johan Hedberg        2014-08-08  2116  	struct smp_chan *smp=
 =3D chan->data;
191dc7fe2d3a8d Johan Hedberg        2014-06-06  2117  	struct hci_conn *hco=
n =3D conn->hcon;
191dc7fe2d3a8d Johan Hedberg        2014-06-06  2118  	u8 *pkax, *pkbx, *na=
, *nb;
191dc7fe2d3a8d Johan Hedberg        2014-06-06  2119  	u32 passkey;
191dc7fe2d3a8d Johan Hedberg        2014-06-06  2120  	int err;
7d24ddcc1140d2 Anderson Briglia     2011-06-09  2121  =

8aab47574a7f5b Vinicius Costa Gomes 2011-09-05  2122  	BT_DBG("conn %p", co=
nn);
7d24ddcc1140d2 Anderson Briglia     2011-06-09  2123  =

c46b98bea5691c Johan Hedberg        2014-02-18  2124  	if (skb->len < sizeo=
f(smp->rrnd))
38e4a915663f3f Johan Hedberg        2014-05-08  2125  		return SMP_INVALID_=
PARAMS;
c46b98bea5691c Johan Hedberg        2014-02-18  2126  =

943a732ab6440f Johan Hedberg        2014-03-18  2127  	memcpy(smp->rrnd, sk=
b->data, sizeof(smp->rrnd));
8aab47574a7f5b Vinicius Costa Gomes 2011-09-05  2128  	skb_pull(skb, sizeof=
(smp->rrnd));
3158c50c33c1ac Vinicius Costa Gomes 2011-06-14  2129  =

191dc7fe2d3a8d Johan Hedberg        2014-06-06  2130  	if (!test_bit(SMP_FL=
AG_SC, &smp->flags))
861580a970f1ab Johan Hedberg        2014-05-20  2131  		return smp_random(s=
mp);
191dc7fe2d3a8d Johan Hedberg        2014-06-06  2132  =

580039e838a7ef Johan Hedberg        2014-12-03  2133  	if (hcon->out) {
580039e838a7ef Johan Hedberg        2014-12-03  2134  		pkax =3D smp->local=
_pk;
580039e838a7ef Johan Hedberg        2014-12-03  2135  		pkbx =3D smp->remot=
e_pk;
580039e838a7ef Johan Hedberg        2014-12-03  2136  		na   =3D smp->prnd;
580039e838a7ef Johan Hedberg        2014-12-03  2137  		nb   =3D smp->rrnd;
580039e838a7ef Johan Hedberg        2014-12-03  2138  	} else {
580039e838a7ef Johan Hedberg        2014-12-03  2139  		pkax =3D smp->remot=
e_pk;
580039e838a7ef Johan Hedberg        2014-12-03  2140  		pkbx =3D smp->local=
_pk;
580039e838a7ef Johan Hedberg        2014-12-03  2141  		na   =3D smp->rrnd;
580039e838a7ef Johan Hedberg        2014-12-03  2142  		nb   =3D smp->prnd;
580039e838a7ef Johan Hedberg        2014-12-03  2143  	}
580039e838a7ef Johan Hedberg        2014-12-03  2144  =

a29b073351ffdd Johan Hedberg        2014-10-28  2145  	if (smp->method =3D=
=3D REQ_OOB) {
a29b073351ffdd Johan Hedberg        2014-10-28  2146  		if (!hcon->out)
a29b073351ffdd Johan Hedberg        2014-10-28  2147  			smp_send_cmd(conn,=
 SMP_CMD_PAIRING_RANDOM,
a29b073351ffdd Johan Hedberg        2014-10-28  2148  				     sizeof(smp->=
prnd), smp->prnd);
a29b073351ffdd Johan Hedberg        2014-10-28  2149  		SMP_ALLOW_CMD(smp, =
SMP_CMD_DHKEY_CHECK);
a29b073351ffdd Johan Hedberg        2014-10-28  2150  		goto mackey_and_ltk;
a29b073351ffdd Johan Hedberg        2014-10-28  2151  	}
a29b073351ffdd Johan Hedberg        2014-10-28  2152  =

38606f1418cc9c Johan Hedberg        2014-06-25  2153  	/* Passkey entry has=
 special treatment */
38606f1418cc9c Johan Hedberg        2014-06-25  2154  	if (smp->method =3D=
=3D REQ_PASSKEY || smp->method =3D=3D DSP_PASSKEY)
38606f1418cc9c Johan Hedberg        2014-06-25  2155  		return sc_passkey_r=
ound(smp, SMP_CMD_PAIRING_RANDOM);
38606f1418cc9c Johan Hedberg        2014-06-25  2156  =

191dc7fe2d3a8d Johan Hedberg        2014-06-06  2157  	if (hcon->out) {
191dc7fe2d3a8d Johan Hedberg        2014-06-06  2158  		u8 cfm[16];
191dc7fe2d3a8d Johan Hedberg        2014-06-06  2159  =

191dc7fe2d3a8d Johan Hedberg        2014-06-06  2160  		err =3D smp_f4(smp-=
>tfm_cmac, smp->remote_pk, smp->local_pk,
191dc7fe2d3a8d Johan Hedberg        2014-06-06  2161  			     smp->rrnd, 0,=
 cfm);
191dc7fe2d3a8d Johan Hedberg        2014-06-06  2162  		if (err)
191dc7fe2d3a8d Johan Hedberg        2014-06-06  2163  			return SMP_UNSPECI=
FIED;
191dc7fe2d3a8d Johan Hedberg        2014-06-06  2164  =

329d82309824ff Jason A. Donenfeld   2017-06-10  2165  		if (crypto_memneq(s=
mp->pcnf, cfm, 16))
191dc7fe2d3a8d Johan Hedberg        2014-06-06  2166  			return SMP_CONFIRM=
_FAILED;
191dc7fe2d3a8d Johan Hedberg        2014-06-06  2167  	} else {
191dc7fe2d3a8d Johan Hedberg        2014-06-06  2168  		smp_send_cmd(conn, =
SMP_CMD_PAIRING_RANDOM, sizeof(smp->prnd),
191dc7fe2d3a8d Johan Hedberg        2014-06-06  2169  			     smp->prnd);
191dc7fe2d3a8d Johan Hedberg        2014-06-06  2170  		SMP_ALLOW_CMD(smp, =
SMP_CMD_DHKEY_CHECK);
cee5f20fece32c Howard Chung         2020-02-14  2171  =

cee5f20fece32c Howard Chung         2020-02-14  2172  		/* Only Just-Works =
pairing requires extra checks */
cee5f20fece32c Howard Chung         2020-02-14  2173  		if (smp->method !=
=3D JUST_WORKS)
cee5f20fece32c Howard Chung         2020-02-14  2174  			goto mackey_and_lt=
k;
cee5f20fece32c Howard Chung         2020-02-14  2175  =

cee5f20fece32c Howard Chung         2020-02-14  2176  		/* If there already=
 exists long term key in local host, leave
cee5f20fece32c Howard Chung         2020-02-14  2177  		 * the decision to =
user space since the remote device could
cee5f20fece32c Howard Chung         2020-02-14  2178  		 * be legitimate or=
 malicious.
cee5f20fece32c Howard Chung         2020-02-14  2179  		 */
cee5f20fece32c Howard Chung         2020-02-14  2180  		if (hci_find_ltk(hc=
on->hdev, &hcon->dst, hcon->dst_type,
cee5f20fece32c Howard Chung         2020-02-14  2181  				 hcon->role)) {
cee5f20fece32c Howard Chung         2020-02-14  2182  			err =3D mgmt_user_=
confirm_request(hcon->hdev, &hcon->dst,
cee5f20fece32c Howard Chung         2020-02-14  2183  							hcon->type,
cee5f20fece32c Howard Chung         2020-02-14  2184  							hcon->dst_type,
cee5f20fece32c Howard Chung         2020-02-14 @2185  							passkey, 1);
                                                                           =
                             ^^^^^^^
Uninitialized until later in the function.

cee5f20fece32c Howard Chung         2020-02-14  2186  			if (err)
cee5f20fece32c Howard Chung         2020-02-14  2187  				return SMP_UNSPEC=
IFIED;
cee5f20fece32c Howard Chung         2020-02-14  2188  			set_bit(SMP_FLAG_W=
AIT_USER, &smp->flags);
cee5f20fece32c Howard Chung         2020-02-14  2189  		}
191dc7fe2d3a8d Johan Hedberg        2014-06-06  2190  	}
191dc7fe2d3a8d Johan Hedberg        2014-06-06  2191  =

a29b073351ffdd Johan Hedberg        2014-10-28  2192  mackey_and_ltk:
760b018b6cf08e Johan Hedberg        2014-06-06  2193  	/* Generate MacKey a=
nd LTK */
760b018b6cf08e Johan Hedberg        2014-06-06  2194  	err =3D sc_mackey_an=
d_ltk(smp, smp->mackey, smp->tk);
760b018b6cf08e Johan Hedberg        2014-06-06  2195  	if (err)
760b018b6cf08e Johan Hedberg        2014-06-06  2196  		return SMP_UNSPECIF=
IED;
760b018b6cf08e Johan Hedberg        2014-06-06  2197  =

a29b073351ffdd Johan Hedberg        2014-10-28  2198  	if (smp->method =3D=
=3D JUST_WORKS || smp->method =3D=3D REQ_OOB) {
dddd3059e3bdd0 Johan Hedberg        2014-06-01  2199  		if (hcon->out) {
38606f1418cc9c Johan Hedberg        2014-06-25  2200  			sc_dhkey_check(smp=
);
dddd3059e3bdd0 Johan Hedberg        2014-06-01  2201  			SMP_ALLOW_CMD(smp,=
 SMP_CMD_DHKEY_CHECK);
dddd3059e3bdd0 Johan Hedberg        2014-06-01  2202  		}
dddd3059e3bdd0 Johan Hedberg        2014-06-01  2203  		return 0;
dddd3059e3bdd0 Johan Hedberg        2014-06-01  2204  	}
dddd3059e3bdd0 Johan Hedberg        2014-06-01  2205  =

38606f1418cc9c Johan Hedberg        2014-06-25  2206  	err =3D smp_g2(smp->=
tfm_cmac, pkax, pkbx, na, nb, &passkey);
                                                        ^^^^^^^^^^^^^^^^^^^=
^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

38606f1418cc9c Johan Hedberg        2014-06-25  2207  	if (err)
38606f1418cc9c Johan Hedberg        2014-06-25  2208  		return SMP_UNSPECIF=
IED;
38606f1418cc9c Johan Hedberg        2014-06-25  2209  =

38606f1418cc9c Johan Hedberg        2014-06-25  2210  	err =3D mgmt_user_co=
nfirm_request(hcon->hdev, &hcon->dst, hcon->type,
38606f1418cc9c Johan Hedberg        2014-06-25  2211  					hcon->dst_type, =
passkey, 0);
191dc7fe2d3a8d Johan Hedberg        2014-06-06  2212  	if (err)
191dc7fe2d3a8d Johan Hedberg        2014-06-06  2213  		return SMP_UNSPECIF=
IED;
191dc7fe2d3a8d Johan Hedberg        2014-06-06  2214  =

38606f1418cc9c Johan Hedberg        2014-06-25  2215  	set_bit(SMP_FLAG_WAI=
T_USER, &smp->flags);
38606f1418cc9c Johan Hedberg        2014-06-25  2216  =

191dc7fe2d3a8d Johan Hedberg        2014-06-06  2217  	return 0;
88ba43b662b6b9 Anderson Briglia     2011-06-09  2218  }

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============6766176512146840239==--

