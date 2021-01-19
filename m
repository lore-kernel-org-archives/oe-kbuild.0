Content-Type: multipart/mixed; boundary="===============4573892490780150879=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: net/ceph/messenger_v1.c:1099:23: warning: Boolean result is used in bitwise operation. Clarify expression with parentheses.
Date: Tue, 19 Jan 2021 16:18:37 +0800
Message-ID: <202101191631.7YFuNRXU-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4573892490780150879==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Ilya Dryomov <idryomov@gmail.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   1e2a199f6ccdc15cf111d68d212e2fd4ce65682e
commit: 2f713615ddd9d805b6c5e79c52e0e11af99d2bf1 libceph: move msgr1 protoc=
ol implementation to its own file
date:   5 weeks ago
:::::: branch date: 13 hours ago
:::::: commit date: 5 weeks ago
compiler: gcc-9 (Debian 9.3.0-15) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> net/ceph/messenger_v1.c:1099:23: warning: Boolean result is used in bitw=
ise operation. Clarify expression with parentheses. [clarifyCondition]
     BUG_ON(!con->in_msg ^ skip);
                         ^

vim +1099 net/ceph/messenger_v1.c

2f713615ddd9d805 Ilya Dryomov 2020-11-12  1029  =

2f713615ddd9d805 Ilya Dryomov 2020-11-12  1030  /*
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1031   * read (part of) a message.
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1032   */
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1033  static int read_partial_mes=
sage(struct ceph_connection *con)
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1034  {
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1035  	struct ceph_msg *m =3D con=
->in_msg;
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1036  	int size;
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1037  	int end;
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1038  	int ret;
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1039  	unsigned int front_len, mi=
ddle_len, data_len;
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1040  	bool do_datacrc =3D !ceph_=
test_opt(from_msgr(con->msgr), NOCRC);
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1041  	bool need_sign =3D (con->p=
eer_features & CEPH_FEATURE_MSG_AUTH);
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1042  	u64 seq;
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1043  	u32 crc;
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1044  =

2f713615ddd9d805 Ilya Dryomov 2020-11-12  1045  	dout("read_partial_message=
 con %p msg %p\n", con, m);
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1046  =

2f713615ddd9d805 Ilya Dryomov 2020-11-12  1047  	/* header */
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1048  	size =3D sizeof (con->in_h=
dr);
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1049  	end =3D size;
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1050  	ret =3D read_partial(con, =
end, size, &con->in_hdr);
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1051  	if (ret <=3D 0)
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1052  		return ret;
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1053  =

2f713615ddd9d805 Ilya Dryomov 2020-11-12  1054  	crc =3D crc32c(0, &con->in=
_hdr, offsetof(struct ceph_msg_header, crc));
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1055  	if (cpu_to_le32(crc) !=3D =
con->in_hdr.crc) {
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1056  		pr_err("read_partial_mess=
age bad hdr crc %u !=3D expected %u\n",
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1057  		       crc, con->in_hdr.c=
rc);
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1058  		return -EBADMSG;
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1059  	}
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1060  =

2f713615ddd9d805 Ilya Dryomov 2020-11-12  1061  	front_len =3D le32_to_cpu(=
con->in_hdr.front_len);
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1062  	if (front_len > CEPH_MSG_M=
AX_FRONT_LEN)
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1063  		return -EIO;
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1064  	middle_len =3D le32_to_cpu=
(con->in_hdr.middle_len);
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1065  	if (middle_len > CEPH_MSG_=
MAX_MIDDLE_LEN)
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1066  		return -EIO;
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1067  	data_len =3D le32_to_cpu(c=
on->in_hdr.data_len);
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1068  	if (data_len > CEPH_MSG_MA=
X_DATA_LEN)
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1069  		return -EIO;
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1070  =

2f713615ddd9d805 Ilya Dryomov 2020-11-12  1071  	/* verify seq# */
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1072  	seq =3D le64_to_cpu(con->i=
n_hdr.seq);
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1073  	if ((s64)seq - (s64)con->i=
n_seq < 1) {
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1074  		pr_info("skipping %s%lld =
%s seq %lld expected %lld\n",
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1075  			ENTITY_NAME(con->peer_na=
me),
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1076  			ceph_pr_addr(&con->peer_=
addr),
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1077  			seq, con->in_seq + 1);
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1078  		con->in_base_pos =3D -fro=
nt_len - middle_len - data_len -
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1079  			sizeof_footer(con);
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1080  		con->in_tag =3D CEPH_MSGR=
_TAG_READY;
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1081  		return 1;
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1082  	} else if ((s64)seq - (s64=
)con->in_seq > 1) {
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1083  		pr_err("read_partial_mess=
age bad seq %lld expected %lld\n",
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1084  		       seq, con->in_seq +=
 1);
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1085  		con->error_msg =3D "bad m=
essage sequence # for incoming message";
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1086  		return -EBADE;
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1087  	}
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1088  =

2f713615ddd9d805 Ilya Dryomov 2020-11-12  1089  	/* allocate message? */
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1090  	if (!con->in_msg) {
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1091  		int skip =3D 0;
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1092  =

2f713615ddd9d805 Ilya Dryomov 2020-11-12  1093  		dout("got hdr type %d fro=
nt %d data %d\n", con->in_hdr.type,
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1094  		     front_len, data_len);
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1095  		ret =3D ceph_con_in_msg_a=
lloc(con, &con->in_hdr, &skip);
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1096  		if (ret < 0)
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1097  			return ret;
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1098  =

2f713615ddd9d805 Ilya Dryomov 2020-11-12 @1099  		BUG_ON(!con->in_msg ^ ski=
p);
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1100  		if (skip) {
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1101  			/* skip this message */
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1102  			dout("alloc_msg said ski=
p message\n");
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1103  			con->in_base_pos =3D -fr=
ont_len - middle_len - data_len -
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1104  				sizeof_footer(con);
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1105  			con->in_tag =3D CEPH_MSG=
R_TAG_READY;
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1106  			con->in_seq++;
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1107  			return 1;
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1108  		}
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1109  =

2f713615ddd9d805 Ilya Dryomov 2020-11-12  1110  		BUG_ON(!con->in_msg);
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1111  		BUG_ON(con->in_msg->con !=
=3D con);
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1112  		m =3D con->in_msg;
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1113  		m->front.iov_len =3D 0;  =
  /* haven't read it yet */
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1114  		if (m->middle)
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1115  			m->middle->vec.iov_len =
=3D 0;
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1116  =

2f713615ddd9d805 Ilya Dryomov 2020-11-12  1117  		/* prepare for data paylo=
ad, if any */
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1118  =

2f713615ddd9d805 Ilya Dryomov 2020-11-12  1119  		if (data_len)
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1120  			prepare_message_data(con=
->in_msg, data_len);
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1121  	}
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1122  =

2f713615ddd9d805 Ilya Dryomov 2020-11-12  1123  	/* front */
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1124  	ret =3D read_partial_messa=
ge_section(con, &m->front, front_len,
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1125  					   &con->in_front_crc);
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1126  	if (ret <=3D 0)
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1127  		return ret;
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1128  =

2f713615ddd9d805 Ilya Dryomov 2020-11-12  1129  	/* middle */
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1130  	if (m->middle) {
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1131  		ret =3D read_partial_mess=
age_section(con, &m->middle->vec,
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1132  						   middle_len,
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1133  						   &con->in_middle_cr=
c);
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1134  		if (ret <=3D 0)
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1135  			return ret;
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1136  	}
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1137  =

2f713615ddd9d805 Ilya Dryomov 2020-11-12  1138  	/* (page) data */
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1139  	if (data_len) {
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1140  		ret =3D read_partial_msg_=
data(con);
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1141  		if (ret <=3D 0)
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1142  			return ret;
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1143  	}
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1144  =

2f713615ddd9d805 Ilya Dryomov 2020-11-12  1145  	/* footer */
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1146  	size =3D sizeof_footer(con=
);
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1147  	end +=3D size;
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1148  	ret =3D read_partial(con, =
end, size, &m->footer);
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1149  	if (ret <=3D 0)
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1150  		return ret;
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1151  =

2f713615ddd9d805 Ilya Dryomov 2020-11-12  1152  	if (!need_sign) {
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1153  		m->footer.flags =3D m->ol=
d_footer.flags;
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1154  		m->footer.sig =3D 0;
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1155  	}
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1156  =

2f713615ddd9d805 Ilya Dryomov 2020-11-12  1157  	dout("read_partial_message=
 got msg %p %d (%u) + %d (%u) + %d (%u)\n",
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1158  	     m, front_len, m->foot=
er.front_crc, middle_len,
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1159  	     m->footer.middle_crc,=
 data_len, m->footer.data_crc);
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1160  =

2f713615ddd9d805 Ilya Dryomov 2020-11-12  1161  	/* crc ok? */
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1162  	if (con->in_front_crc !=3D=
 le32_to_cpu(m->footer.front_crc)) {
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1163  		pr_err("read_partial_mess=
age %p front crc %u !=3D exp. %u\n",
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1164  		       m, con->in_front_c=
rc, m->footer.front_crc);
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1165  		return -EBADMSG;
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1166  	}
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1167  	if (con->in_middle_crc !=
=3D le32_to_cpu(m->footer.middle_crc)) {
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1168  		pr_err("read_partial_mess=
age %p middle crc %u !=3D exp %u\n",
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1169  		       m, con->in_middle_=
crc, m->footer.middle_crc);
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1170  		return -EBADMSG;
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1171  	}
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1172  	if (do_datacrc &&
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1173  	    (m->footer.flags & CEP=
H_MSG_FOOTER_NOCRC) =3D=3D 0 &&
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1174  	    con->in_data_crc !=3D =
le32_to_cpu(m->footer.data_crc)) {
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1175  		pr_err("read_partial_mess=
age %p data crc %u !=3D exp. %u\n", m,
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1176  		       con->in_data_crc, =
le32_to_cpu(m->footer.data_crc));
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1177  		return -EBADMSG;
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1178  	}
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1179  =

2f713615ddd9d805 Ilya Dryomov 2020-11-12  1180  	if (need_sign && con->ops-=
>check_message_signature &&
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1181  	    con->ops->check_messag=
e_signature(m)) {
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1182  		pr_err("read_partial_mess=
age %p signature check failed\n", m);
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1183  		return -EBADMSG;
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1184  	}
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1185  =

2f713615ddd9d805 Ilya Dryomov 2020-11-12  1186  	return 1; /* done! */
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1187  }
2f713615ddd9d805 Ilya Dryomov 2020-11-12  1188  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============4573892490780150879==--

