Content-Type: multipart/mixed; boundary="===============4808178292957415064=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [linux-next:master 1252/9897] net/core/gro.c:493:5-12: ERROR: PTR_ERR applied after initialization to constant on line 441
Date: Tue, 04 Jan 2022 21:53:58 +0800
Message-ID: <202201042117.R2y8opKO-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4808178292957415064==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Eric Dumazet <edumazet@google.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git=
 master
head:   ea586a076e8aa606c59b66d86660590f18354b11
commit: 587652bbdd06ab38a4c1b85e40f933d2cf4a1147 [1252/9897] net: gro: popu=
late net/core/gro.c
:::::: branch date: 11 days ago
:::::: commit date: 7 weeks ago
config: x86_64-randconfig-c022-20211231 (https://download.01.org/0day-ci/ar=
chive/20220104/202201042117.R2y8opKO-lkp(a)intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Julia Lawall <julia.lawall@lip6.fr>


cocci warnings: (new ones prefixed by >>)
>> net/core/gro.c:493:5-12: ERROR: PTR_ERR applied after initialization to =
constant on line 441

vim +493 net/core/gro.c

587652bbdd06ab Eric Dumazet 2021-11-15  433  =

587652bbdd06ab Eric Dumazet 2021-11-15  434  static enum gro_result dev_gro=
_receive(struct napi_struct *napi, struct sk_buff *skb)
587652bbdd06ab Eric Dumazet 2021-11-15  435  {
587652bbdd06ab Eric Dumazet 2021-11-15  436  	u32 bucket =3D skb_get_hash_r=
aw(skb) & (GRO_HASH_BUCKETS - 1);
587652bbdd06ab Eric Dumazet 2021-11-15  437  	struct gro_list *gro_list =3D=
 &napi->gro_hash[bucket];
587652bbdd06ab Eric Dumazet 2021-11-15  438  	struct list_head *head =3D &o=
ffload_base;
587652bbdd06ab Eric Dumazet 2021-11-15  439  	struct packet_offload *ptype;
587652bbdd06ab Eric Dumazet 2021-11-15  440  	__be16 type =3D skb->protocol;
587652bbdd06ab Eric Dumazet 2021-11-15 @441  	struct sk_buff *pp =3D NULL;
587652bbdd06ab Eric Dumazet 2021-11-15  442  	enum gro_result ret;
587652bbdd06ab Eric Dumazet 2021-11-15  443  	int same_flow;
587652bbdd06ab Eric Dumazet 2021-11-15  444  	int grow;
587652bbdd06ab Eric Dumazet 2021-11-15  445  =

587652bbdd06ab Eric Dumazet 2021-11-15  446  	if (netif_elide_gro(skb->dev))
587652bbdd06ab Eric Dumazet 2021-11-15  447  		goto normal;
587652bbdd06ab Eric Dumazet 2021-11-15  448  =

587652bbdd06ab Eric Dumazet 2021-11-15  449  	gro_list_prepare(&gro_list->l=
ist, skb);
587652bbdd06ab Eric Dumazet 2021-11-15  450  =

587652bbdd06ab Eric Dumazet 2021-11-15  451  	rcu_read_lock();
587652bbdd06ab Eric Dumazet 2021-11-15  452  	list_for_each_entry_rcu(ptype=
, head, list) {
587652bbdd06ab Eric Dumazet 2021-11-15  453  		if (ptype->type !=3D type ||=
 !ptype->callbacks.gro_receive)
587652bbdd06ab Eric Dumazet 2021-11-15  454  			continue;
587652bbdd06ab Eric Dumazet 2021-11-15  455  =

587652bbdd06ab Eric Dumazet 2021-11-15  456  		skb_set_network_header(skb, =
skb_gro_offset(skb));
587652bbdd06ab Eric Dumazet 2021-11-15  457  		skb_reset_mac_len(skb);
587652bbdd06ab Eric Dumazet 2021-11-15  458  		NAPI_GRO_CB(skb)->same_flow =
=3D 0;
587652bbdd06ab Eric Dumazet 2021-11-15  459  		NAPI_GRO_CB(skb)->flush =3D =
skb_is_gso(skb) || skb_has_frag_list(skb);
587652bbdd06ab Eric Dumazet 2021-11-15  460  		NAPI_GRO_CB(skb)->free =3D 0;
587652bbdd06ab Eric Dumazet 2021-11-15  461  		NAPI_GRO_CB(skb)->encap_mark=
 =3D 0;
587652bbdd06ab Eric Dumazet 2021-11-15  462  		NAPI_GRO_CB(skb)->recursion_=
counter =3D 0;
587652bbdd06ab Eric Dumazet 2021-11-15  463  		NAPI_GRO_CB(skb)->is_fou =3D=
 0;
587652bbdd06ab Eric Dumazet 2021-11-15  464  		NAPI_GRO_CB(skb)->is_atomic =
=3D 1;
587652bbdd06ab Eric Dumazet 2021-11-15  465  		NAPI_GRO_CB(skb)->gro_remcsu=
m_start =3D 0;
587652bbdd06ab Eric Dumazet 2021-11-15  466  =

587652bbdd06ab Eric Dumazet 2021-11-15  467  		/* Setup for GRO checksum va=
lidation */
587652bbdd06ab Eric Dumazet 2021-11-15  468  		switch (skb->ip_summed) {
587652bbdd06ab Eric Dumazet 2021-11-15  469  		case CHECKSUM_COMPLETE:
587652bbdd06ab Eric Dumazet 2021-11-15  470  			NAPI_GRO_CB(skb)->csum =3D =
skb->csum;
587652bbdd06ab Eric Dumazet 2021-11-15  471  			NAPI_GRO_CB(skb)->csum_vali=
d =3D 1;
587652bbdd06ab Eric Dumazet 2021-11-15  472  			NAPI_GRO_CB(skb)->csum_cnt =
=3D 0;
587652bbdd06ab Eric Dumazet 2021-11-15  473  			break;
587652bbdd06ab Eric Dumazet 2021-11-15  474  		case CHECKSUM_UNNECESSARY:
587652bbdd06ab Eric Dumazet 2021-11-15  475  			NAPI_GRO_CB(skb)->csum_cnt =
=3D skb->csum_level + 1;
587652bbdd06ab Eric Dumazet 2021-11-15  476  			NAPI_GRO_CB(skb)->csum_vali=
d =3D 0;
587652bbdd06ab Eric Dumazet 2021-11-15  477  			break;
587652bbdd06ab Eric Dumazet 2021-11-15  478  		default:
587652bbdd06ab Eric Dumazet 2021-11-15  479  			NAPI_GRO_CB(skb)->csum_cnt =
=3D 0;
587652bbdd06ab Eric Dumazet 2021-11-15  480  			NAPI_GRO_CB(skb)->csum_vali=
d =3D 0;
587652bbdd06ab Eric Dumazet 2021-11-15  481  		}
587652bbdd06ab Eric Dumazet 2021-11-15  482  =

587652bbdd06ab Eric Dumazet 2021-11-15  483  		pp =3D INDIRECT_CALL_INET(pt=
ype->callbacks.gro_receive,
587652bbdd06ab Eric Dumazet 2021-11-15  484  					ipv6_gro_receive, inet_gr=
o_receive,
587652bbdd06ab Eric Dumazet 2021-11-15  485  					&gro_list->list, skb);
587652bbdd06ab Eric Dumazet 2021-11-15  486  		break;
587652bbdd06ab Eric Dumazet 2021-11-15  487  	}
587652bbdd06ab Eric Dumazet 2021-11-15  488  	rcu_read_unlock();
587652bbdd06ab Eric Dumazet 2021-11-15  489  =

587652bbdd06ab Eric Dumazet 2021-11-15  490  	if (&ptype->list =3D=3D head)
587652bbdd06ab Eric Dumazet 2021-11-15  491  		goto normal;
587652bbdd06ab Eric Dumazet 2021-11-15  492  =

587652bbdd06ab Eric Dumazet 2021-11-15 @493  	if (PTR_ERR(pp) =3D=3D -EINPR=
OGRESS) {
587652bbdd06ab Eric Dumazet 2021-11-15  494  		ret =3D GRO_CONSUMED;
587652bbdd06ab Eric Dumazet 2021-11-15  495  		goto ok;
587652bbdd06ab Eric Dumazet 2021-11-15  496  	}
587652bbdd06ab Eric Dumazet 2021-11-15  497  =

587652bbdd06ab Eric Dumazet 2021-11-15  498  	same_flow =3D NAPI_GRO_CB(skb=
)->same_flow;
587652bbdd06ab Eric Dumazet 2021-11-15  499  	ret =3D NAPI_GRO_CB(skb)->fre=
e ? GRO_MERGED_FREE : GRO_MERGED;
587652bbdd06ab Eric Dumazet 2021-11-15  500  =

587652bbdd06ab Eric Dumazet 2021-11-15  501  	if (pp) {
587652bbdd06ab Eric Dumazet 2021-11-15  502  		skb_list_del_init(pp);
587652bbdd06ab Eric Dumazet 2021-11-15  503  		napi_gro_complete(napi, pp);
587652bbdd06ab Eric Dumazet 2021-11-15  504  		gro_list->count--;
587652bbdd06ab Eric Dumazet 2021-11-15  505  	}
587652bbdd06ab Eric Dumazet 2021-11-15  506  =

587652bbdd06ab Eric Dumazet 2021-11-15  507  	if (same_flow)
587652bbdd06ab Eric Dumazet 2021-11-15  508  		goto ok;
587652bbdd06ab Eric Dumazet 2021-11-15  509  =

587652bbdd06ab Eric Dumazet 2021-11-15  510  	if (NAPI_GRO_CB(skb)->flush)
587652bbdd06ab Eric Dumazet 2021-11-15  511  		goto normal;
587652bbdd06ab Eric Dumazet 2021-11-15  512  =

587652bbdd06ab Eric Dumazet 2021-11-15  513  	if (unlikely(gro_list->count =
>=3D MAX_GRO_SKBS))
587652bbdd06ab Eric Dumazet 2021-11-15  514  		gro_flush_oldest(napi, &gro_=
list->list);
587652bbdd06ab Eric Dumazet 2021-11-15  515  	else
587652bbdd06ab Eric Dumazet 2021-11-15  516  		gro_list->count++;
587652bbdd06ab Eric Dumazet 2021-11-15  517  =

587652bbdd06ab Eric Dumazet 2021-11-15  518  	NAPI_GRO_CB(skb)->count =3D 1;
587652bbdd06ab Eric Dumazet 2021-11-15  519  	NAPI_GRO_CB(skb)->age =3D jif=
fies;
587652bbdd06ab Eric Dumazet 2021-11-15  520  	NAPI_GRO_CB(skb)->last =3D sk=
b;
587652bbdd06ab Eric Dumazet 2021-11-15  521  	skb_shinfo(skb)->gso_size =3D=
 skb_gro_len(skb);
587652bbdd06ab Eric Dumazet 2021-11-15  522  	list_add(&skb->list, &gro_lis=
t->list);
587652bbdd06ab Eric Dumazet 2021-11-15  523  	ret =3D GRO_HELD;
587652bbdd06ab Eric Dumazet 2021-11-15  524  =

587652bbdd06ab Eric Dumazet 2021-11-15  525  pull:
587652bbdd06ab Eric Dumazet 2021-11-15  526  	grow =3D skb_gro_offset(skb) =
- skb_headlen(skb);
587652bbdd06ab Eric Dumazet 2021-11-15  527  	if (grow > 0)
587652bbdd06ab Eric Dumazet 2021-11-15  528  		gro_pull_from_frag0(skb, gro=
w);
587652bbdd06ab Eric Dumazet 2021-11-15  529  ok:
587652bbdd06ab Eric Dumazet 2021-11-15  530  	if (gro_list->count) {
587652bbdd06ab Eric Dumazet 2021-11-15  531  		if (!test_bit(bucket, &napi-=
>gro_bitmask))
587652bbdd06ab Eric Dumazet 2021-11-15  532  			__set_bit(bucket, &napi->gr=
o_bitmask);
587652bbdd06ab Eric Dumazet 2021-11-15  533  	} else if (test_bit(bucket, &=
napi->gro_bitmask)) {
587652bbdd06ab Eric Dumazet 2021-11-15  534  		__clear_bit(bucket, &napi->g=
ro_bitmask);
587652bbdd06ab Eric Dumazet 2021-11-15  535  	}
587652bbdd06ab Eric Dumazet 2021-11-15  536  =

587652bbdd06ab Eric Dumazet 2021-11-15  537  	return ret;
587652bbdd06ab Eric Dumazet 2021-11-15  538  =

587652bbdd06ab Eric Dumazet 2021-11-15  539  normal:
587652bbdd06ab Eric Dumazet 2021-11-15  540  	ret =3D GRO_NORMAL;
587652bbdd06ab Eric Dumazet 2021-11-15  541  	goto pull;
587652bbdd06ab Eric Dumazet 2021-11-15  542  }
587652bbdd06ab Eric Dumazet 2021-11-15  543  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4808178292957415064==--

