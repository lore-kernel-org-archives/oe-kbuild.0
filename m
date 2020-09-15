Content-Type: multipart/mixed; boundary="===============8060582721249266500=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/net/thunderbolt.c:1088:8: warning: Variable 'dest' is reassigned a value before the old one has been used.
Date: Tue, 15 Sep 2020 21:27:03 +0800
Message-ID: <202009152157.UlKtLonP%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============8060582721249266500==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: David Manouchehri <david.manouchehri@riseup.net>
CC: Mika Westerberg <mika.westerberg@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   fc4f28bb3daf3265d6bc5f73b497306985bb23ab
commit: eb4a6de4962ecacb5717a45057efc60bb2eca892 thunderbolt: Update Kconfi=
g to allow building on other architectures.
date:   4 months ago
:::::: branch date: 15 hours ago
:::::: commit date: 4 months ago
compiler: sparc-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck warnings: (new ones prefixed by >>)

>> drivers/net/thunderbolt.c:1088:8: warning: Variable 'dest' is reassigned=
 a value before the old one has been used. [redundantAssignment]
     dest =3D hdr + 1;
          ^
   drivers/net/thunderbolt.c:1063:9: note: Variable 'dest' is reassigned a =
value before the old one has been used.
      dest +=3D len;
           ^
   drivers/net/thunderbolt.c:1088:8: note: Variable 'dest' is reassigned a =
value before the old one has been used.
     dest =3D hdr + 1;
          ^

# https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/commit=
/?id=3Deb4a6de4962ecacb5717a45057efc60bb2eca892
git remote add linus https://git.kernel.org/pub/scm/linux/kernel/git/torval=
ds/linux.git
git fetch --no-tags linus master
git checkout eb4a6de4962ecacb5717a45057efc60bb2eca892
vim +/dest +1088 drivers/net/thunderbolt.c

e69b6c02b4c3b8d Amir Levy 2017-10-02  1010  =

e69b6c02b4c3b8d Amir Levy 2017-10-02  1011  static netdev_tx_t tbnet_start_=
xmit(struct sk_buff *skb,
e69b6c02b4c3b8d Amir Levy 2017-10-02  1012  				    struct net_device *dev)
e69b6c02b4c3b8d Amir Levy 2017-10-02  1013  {
e69b6c02b4c3b8d Amir Levy 2017-10-02  1014  	struct tbnet *net =3D netdev_p=
riv(dev);
e69b6c02b4c3b8d Amir Levy 2017-10-02  1015  	struct tbnet_frame *frames[MAX=
_SKB_FRAGS];
e69b6c02b4c3b8d Amir Levy 2017-10-02  1016  	u16 frame_id =3D atomic_read(&=
net->frame_id);
e69b6c02b4c3b8d Amir Levy 2017-10-02  1017  	struct thunderbolt_ip_frame_he=
ader *hdr;
e69b6c02b4c3b8d Amir Levy 2017-10-02  1018  	unsigned int len =3D skb_headl=
en(skb);
e69b6c02b4c3b8d Amir Levy 2017-10-02  1019  	unsigned int data_len =3D skb-=
>len;
e69b6c02b4c3b8d Amir Levy 2017-10-02  1020  	unsigned int nframes, i;
e69b6c02b4c3b8d Amir Levy 2017-10-02  1021  	unsigned int frag =3D 0;
e69b6c02b4c3b8d Amir Levy 2017-10-02  1022  	void *src =3D skb->data;
e69b6c02b4c3b8d Amir Levy 2017-10-02  1023  	u32 frame_index =3D 0;
e69b6c02b4c3b8d Amir Levy 2017-10-02  1024  	bool unmap =3D false;
e69b6c02b4c3b8d Amir Levy 2017-10-02  1025  	void *dest;
e69b6c02b4c3b8d Amir Levy 2017-10-02  1026  =

e69b6c02b4c3b8d Amir Levy 2017-10-02  1027  	nframes =3D DIV_ROUND_UP(data_=
len, TBNET_MAX_PAYLOAD_SIZE);
e69b6c02b4c3b8d Amir Levy 2017-10-02  1028  	if (tbnet_available_buffers(&n=
et->tx_ring) < nframes) {
e69b6c02b4c3b8d Amir Levy 2017-10-02  1029  		netif_stop_queue(net->dev);
e69b6c02b4c3b8d Amir Levy 2017-10-02  1030  		return NETDEV_TX_BUSY;
e69b6c02b4c3b8d Amir Levy 2017-10-02  1031  	}
e69b6c02b4c3b8d Amir Levy 2017-10-02  1032  =

e69b6c02b4c3b8d Amir Levy 2017-10-02  1033  	frames[frame_index] =3D tbnet_=
get_tx_buffer(net);
e69b6c02b4c3b8d Amir Levy 2017-10-02  1034  	if (!frames[frame_index])
e69b6c02b4c3b8d Amir Levy 2017-10-02  1035  		goto err_drop;
e69b6c02b4c3b8d Amir Levy 2017-10-02  1036  =

e69b6c02b4c3b8d Amir Levy 2017-10-02  1037  	hdr =3D page_address(frames[fr=
ame_index]->page);
e69b6c02b4c3b8d Amir Levy 2017-10-02  1038  	dest =3D hdr + 1;
e69b6c02b4c3b8d Amir Levy 2017-10-02  1039  =

e69b6c02b4c3b8d Amir Levy 2017-10-02  1040  	/* If overall packet is bigger=
 than the frame data size */
e69b6c02b4c3b8d Amir Levy 2017-10-02  1041  	while (data_len > TBNET_MAX_PA=
YLOAD_SIZE) {
e69b6c02b4c3b8d Amir Levy 2017-10-02  1042  		unsigned int size_left =3D TB=
NET_MAX_PAYLOAD_SIZE;
e69b6c02b4c3b8d Amir Levy 2017-10-02  1043  =

e69b6c02b4c3b8d Amir Levy 2017-10-02  1044  		hdr->frame_size =3D cpu_to_le=
32(TBNET_MAX_PAYLOAD_SIZE);
e69b6c02b4c3b8d Amir Levy 2017-10-02  1045  		hdr->frame_index =3D cpu_to_l=
e16(frame_index);
e69b6c02b4c3b8d Amir Levy 2017-10-02  1046  		hdr->frame_id =3D cpu_to_le16=
(frame_id);
e69b6c02b4c3b8d Amir Levy 2017-10-02  1047  =

e69b6c02b4c3b8d Amir Levy 2017-10-02  1048  		do {
e69b6c02b4c3b8d Amir Levy 2017-10-02  1049  			if (len > size_left) {
e69b6c02b4c3b8d Amir Levy 2017-10-02  1050  				/* Copy data onto Tx buffer=
 data with
e69b6c02b4c3b8d Amir Levy 2017-10-02  1051  				 * full frame size then bre=
ak and go to
e69b6c02b4c3b8d Amir Levy 2017-10-02  1052  				 * next frame
e69b6c02b4c3b8d Amir Levy 2017-10-02  1053  				 */
e69b6c02b4c3b8d Amir Levy 2017-10-02  1054  				memcpy(dest, src, size_left=
);
e69b6c02b4c3b8d Amir Levy 2017-10-02  1055  				len -=3D size_left;
e69b6c02b4c3b8d Amir Levy 2017-10-02  1056  				dest +=3D size_left;
e69b6c02b4c3b8d Amir Levy 2017-10-02  1057  				src +=3D size_left;
e69b6c02b4c3b8d Amir Levy 2017-10-02  1058  				break;
e69b6c02b4c3b8d Amir Levy 2017-10-02  1059  			}
e69b6c02b4c3b8d Amir Levy 2017-10-02  1060  =

e69b6c02b4c3b8d Amir Levy 2017-10-02  1061  			memcpy(dest, src, len);
e69b6c02b4c3b8d Amir Levy 2017-10-02  1062  			size_left -=3D len;
e69b6c02b4c3b8d Amir Levy 2017-10-02  1063  			dest +=3D len;
e69b6c02b4c3b8d Amir Levy 2017-10-02  1064  =

e69b6c02b4c3b8d Amir Levy 2017-10-02  1065  			if (unmap) {
e69b6c02b4c3b8d Amir Levy 2017-10-02  1066  				kunmap_atomic(src);
e69b6c02b4c3b8d Amir Levy 2017-10-02  1067  				unmap =3D false;
e69b6c02b4c3b8d Amir Levy 2017-10-02  1068  			}
e69b6c02b4c3b8d Amir Levy 2017-10-02  1069  =

e69b6c02b4c3b8d Amir Levy 2017-10-02  1070  			/* Ensure all fragments have=
 been processed */
e69b6c02b4c3b8d Amir Levy 2017-10-02  1071  			if (frag < skb_shinfo(skb)->=
nr_frags) {
e69b6c02b4c3b8d Amir Levy 2017-10-02  1072  				/* Map and then unmap quick=
ly */
e69b6c02b4c3b8d Amir Levy 2017-10-02  1073  				src =3D tbnet_kmap_frag(skb=
, frag++, &len);
e69b6c02b4c3b8d Amir Levy 2017-10-02  1074  				unmap =3D true;
e69b6c02b4c3b8d Amir Levy 2017-10-02  1075  			} else if (unlikely(size_lef=
t > 0)) {
e69b6c02b4c3b8d Amir Levy 2017-10-02  1076  				goto err_drop;
e69b6c02b4c3b8d Amir Levy 2017-10-02  1077  			}
e69b6c02b4c3b8d Amir Levy 2017-10-02  1078  		} while (size_left > 0);
e69b6c02b4c3b8d Amir Levy 2017-10-02  1079  =

e69b6c02b4c3b8d Amir Levy 2017-10-02  1080  		data_len -=3D TBNET_MAX_PAYLO=
AD_SIZE;
e69b6c02b4c3b8d Amir Levy 2017-10-02  1081  		frame_index++;
e69b6c02b4c3b8d Amir Levy 2017-10-02  1082  =

e69b6c02b4c3b8d Amir Levy 2017-10-02  1083  		frames[frame_index] =3D tbnet=
_get_tx_buffer(net);
e69b6c02b4c3b8d Amir Levy 2017-10-02  1084  		if (!frames[frame_index])
e69b6c02b4c3b8d Amir Levy 2017-10-02  1085  			goto err_drop;
e69b6c02b4c3b8d Amir Levy 2017-10-02  1086  =

e69b6c02b4c3b8d Amir Levy 2017-10-02  1087  		hdr =3D page_address(frames[f=
rame_index]->page);
e69b6c02b4c3b8d Amir Levy 2017-10-02 @1088  		dest =3D hdr + 1;
e69b6c02b4c3b8d Amir Levy 2017-10-02  1089  	}
e69b6c02b4c3b8d Amir Levy 2017-10-02  1090  =

e69b6c02b4c3b8d Amir Levy 2017-10-02  1091  	hdr->frame_size =3D cpu_to_le3=
2(data_len);
e69b6c02b4c3b8d Amir Levy 2017-10-02  1092  	hdr->frame_index =3D cpu_to_le=
16(frame_index);
e69b6c02b4c3b8d Amir Levy 2017-10-02  1093  	hdr->frame_id =3D cpu_to_le16(=
frame_id);
e69b6c02b4c3b8d Amir Levy 2017-10-02  1094  =

e69b6c02b4c3b8d Amir Levy 2017-10-02  1095  	frames[frame_index]->frame.siz=
e =3D data_len + sizeof(*hdr);
e69b6c02b4c3b8d Amir Levy 2017-10-02  1096  =

e69b6c02b4c3b8d Amir Levy 2017-10-02  1097  	/* In case the remaining data_=
len is smaller than a frame */
e69b6c02b4c3b8d Amir Levy 2017-10-02  1098  	while (len < data_len) {
e69b6c02b4c3b8d Amir Levy 2017-10-02  1099  		memcpy(dest, src, len);
e69b6c02b4c3b8d Amir Levy 2017-10-02  1100  		data_len -=3D len;
e69b6c02b4c3b8d Amir Levy 2017-10-02  1101  		dest +=3D len;
e69b6c02b4c3b8d Amir Levy 2017-10-02  1102  =

e69b6c02b4c3b8d Amir Levy 2017-10-02  1103  		if (unmap) {
e69b6c02b4c3b8d Amir Levy 2017-10-02  1104  			kunmap_atomic(src);
e69b6c02b4c3b8d Amir Levy 2017-10-02  1105  			unmap =3D false;
e69b6c02b4c3b8d Amir Levy 2017-10-02  1106  		}
e69b6c02b4c3b8d Amir Levy 2017-10-02  1107  =

e69b6c02b4c3b8d Amir Levy 2017-10-02  1108  		if (frag < skb_shinfo(skb)->n=
r_frags) {
e69b6c02b4c3b8d Amir Levy 2017-10-02  1109  			src =3D tbnet_kmap_frag(skb,=
 frag++, &len);
e69b6c02b4c3b8d Amir Levy 2017-10-02  1110  			unmap =3D true;
e69b6c02b4c3b8d Amir Levy 2017-10-02  1111  		} else if (unlikely(data_len =
> 0)) {
e69b6c02b4c3b8d Amir Levy 2017-10-02  1112  			goto err_drop;
e69b6c02b4c3b8d Amir Levy 2017-10-02  1113  		}
e69b6c02b4c3b8d Amir Levy 2017-10-02  1114  	}
e69b6c02b4c3b8d Amir Levy 2017-10-02  1115  =

e69b6c02b4c3b8d Amir Levy 2017-10-02  1116  	memcpy(dest, src, data_len);
e69b6c02b4c3b8d Amir Levy 2017-10-02  1117  =

e69b6c02b4c3b8d Amir Levy 2017-10-02  1118  	if (unmap)
e69b6c02b4c3b8d Amir Levy 2017-10-02  1119  		kunmap_atomic(src);
e69b6c02b4c3b8d Amir Levy 2017-10-02  1120  =

e69b6c02b4c3b8d Amir Levy 2017-10-02  1121  	if (!tbnet_xmit_csum_and_map(n=
et, skb, frames, frame_index + 1))
e69b6c02b4c3b8d Amir Levy 2017-10-02  1122  		goto err_drop;
e69b6c02b4c3b8d Amir Levy 2017-10-02  1123  =

e69b6c02b4c3b8d Amir Levy 2017-10-02  1124  	for (i =3D 0; i < frame_index =
+ 1; i++)
e69b6c02b4c3b8d Amir Levy 2017-10-02  1125  		tb_ring_tx(net->tx_ring.ring,=
 &frames[i]->frame);
e69b6c02b4c3b8d Amir Levy 2017-10-02  1126  =

e69b6c02b4c3b8d Amir Levy 2017-10-02  1127  	if (net->svc->prtcstns & TBNET=
_MATCH_FRAGS_ID)
e69b6c02b4c3b8d Amir Levy 2017-10-02  1128  		atomic_inc(&net->frame_id);
e69b6c02b4c3b8d Amir Levy 2017-10-02  1129  =

e69b6c02b4c3b8d Amir Levy 2017-10-02  1130  	net->stats.tx_packets++;
e69b6c02b4c3b8d Amir Levy 2017-10-02  1131  	net->stats.tx_bytes +=3D skb->=
len;
e69b6c02b4c3b8d Amir Levy 2017-10-02  1132  =

e69b6c02b4c3b8d Amir Levy 2017-10-02  1133  	dev_consume_skb_any(skb);
e69b6c02b4c3b8d Amir Levy 2017-10-02  1134  =

e69b6c02b4c3b8d Amir Levy 2017-10-02  1135  	return NETDEV_TX_OK;
e69b6c02b4c3b8d Amir Levy 2017-10-02  1136  =

e69b6c02b4c3b8d Amir Levy 2017-10-02  1137  err_drop:
e69b6c02b4c3b8d Amir Levy 2017-10-02  1138  	/* We can re-use the buffers */
e69b6c02b4c3b8d Amir Levy 2017-10-02  1139  	net->tx_ring.cons -=3D frame_i=
ndex;
e69b6c02b4c3b8d Amir Levy 2017-10-02  1140  =

e69b6c02b4c3b8d Amir Levy 2017-10-02  1141  	dev_kfree_skb_any(skb);
e69b6c02b4c3b8d Amir Levy 2017-10-02  1142  	net->stats.tx_errors++;
e69b6c02b4c3b8d Amir Levy 2017-10-02  1143  =

e69b6c02b4c3b8d Amir Levy 2017-10-02  1144  	return NETDEV_TX_OK;
e69b6c02b4c3b8d Amir Levy 2017-10-02  1145  }
e69b6c02b4c3b8d Amir Levy 2017-10-02  1146  =


:::::: The code at line 1088 was first introduced by commit
:::::: e69b6c02b4c3b8d03be7136f90dd9551ad5a5a5e net: Add support for networ=
king over Thunderbolt cable

:::::: TO: Amir Levy <amir.jer.levy@intel.com>
:::::: CC: David S. Miller <davem@davemloft.net>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============8060582721249266500==--

