Content-Type: multipart/mixed; boundary="===============5231807114531430247=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: net/mptcp/options.c:291:3: warning: Assignment of function parameter has no effect outside the function. Did you forget dereferencing
Date: Tue, 19 Jan 2021 18:20:02 +0800
Message-ID: <202101191857.meF1nN15-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5231807114531430247==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Florian Westphal <fw@strlen.de>
CC: Jakub Kicinski <kuba@kernel.org>
CC: Matthieu Baerts <matthieu.baerts@tessares.net>
CC: Mat Martineau <mathew.j.martineau@linux.intel.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   1e2a199f6ccdc15cf111d68d212e2fd4ce65682e
commit: 50c504a20a754ca37b5e1f4e660cd687769a7dca mptcp: parse and act on in=
coming FASTCLOSE option
date:   5 weeks ago
:::::: branch date: 15 hours ago
:::::: commit date: 5 weeks ago
compiler: gcc-9 (Debian 9.3.0-15) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

>> net/mptcp/options.c:291:3: warning: Assignment of function parameter has=
 no effect outside the function. Did you forget dereferencing it? [uselessA=
ssignmentPtrArg]
     ptr +=3D 8;
     ^
   net/mptcp/options.c:515:3: warning: Assignment of function parameter has=
 no effect outside the function. [uselessAssignmentArg]
     remaining -=3D map_size;
     ^
   net/mptcp/options.c:718:3: warning: Assignment of function parameter has=
 no effect outside the function. [uselessAssignmentArg]
     remaining -=3D opt_size;
     ^

vim +291 net/mptcp/options.c

65492c5a6ab5df50 Paolo Abeni      2020-01-21   20  =

cfde141ea3faa30e Paolo Abeni      2020-04-30   21  static void mptcp_parse_=
option(const struct sk_buff *skb,
cfde141ea3faa30e Paolo Abeni      2020-04-30   22  			       const unsigned=
 char *ptr, int opsize,
cfde141ea3faa30e Paolo Abeni      2020-04-30   23  			       struct mptcp_o=
ptions_received *mp_opt)
eda7acddf8080bb2 Peter Krystad    2020-01-21   24  {
eda7acddf8080bb2 Peter Krystad    2020-01-21   25  	u8 subtype =3D *ptr >> =
4;
648ef4b88673dadb Mat Martineau    2020-01-21   26  	int expected_opsize;
eda7acddf8080bb2 Peter Krystad    2020-01-21   27  	u8 version;
eda7acddf8080bb2 Peter Krystad    2020-01-21   28  	u8 flags;
eda7acddf8080bb2 Peter Krystad    2020-01-21   29  =

eda7acddf8080bb2 Peter Krystad    2020-01-21   30  	switch (subtype) {
eda7acddf8080bb2 Peter Krystad    2020-01-21   31  	case MPTCPOPT_MP_CAPABL=
E:
cc7972ea1932335e Christoph Paasch 2020-01-21   32  		/* strict size checkin=
g */
cc7972ea1932335e Christoph Paasch 2020-01-21   33  		if (!(TCP_SKB_CB(skb)-=
>tcp_flags & TCPHDR_SYN)) {
cc7972ea1932335e Christoph Paasch 2020-01-21   34  			if (skb->len > tcp_hd=
r(skb)->doff << 2)
cc7972ea1932335e Christoph Paasch 2020-01-21   35  				expected_opsize =3D =
TCPOLEN_MPTCP_MPC_ACK_DATA;
cc7972ea1932335e Christoph Paasch 2020-01-21   36  			else
cc7972ea1932335e Christoph Paasch 2020-01-21   37  				expected_opsize =3D =
TCPOLEN_MPTCP_MPC_ACK;
cc7972ea1932335e Christoph Paasch 2020-01-21   38  		} else {
cc7972ea1932335e Christoph Paasch 2020-01-21   39  			if (TCP_SKB_CB(skb)->=
tcp_flags & TCPHDR_ACK)
cc7972ea1932335e Christoph Paasch 2020-01-21   40  				expected_opsize =3D =
TCPOLEN_MPTCP_MPC_SYNACK;
cc7972ea1932335e Christoph Paasch 2020-01-21   41  			else
cc7972ea1932335e Christoph Paasch 2020-01-21   42  				expected_opsize =3D =
TCPOLEN_MPTCP_MPC_SYN;
cc7972ea1932335e Christoph Paasch 2020-01-21   43  		}
cc7972ea1932335e Christoph Paasch 2020-01-21   44  		if (opsize !=3D expect=
ed_opsize)
eda7acddf8080bb2 Peter Krystad    2020-01-21   45  			break;
eda7acddf8080bb2 Peter Krystad    2020-01-21   46  =

cc7972ea1932335e Christoph Paasch 2020-01-21   47  		/* try to be gentle vs=
 future versions on the initial syn */
eda7acddf8080bb2 Peter Krystad    2020-01-21   48  		version =3D *ptr++ & M=
PTCP_VERSION_MASK;
cc7972ea1932335e Christoph Paasch 2020-01-21   49  		if (opsize !=3D TCPOLE=
N_MPTCP_MPC_SYN) {
eda7acddf8080bb2 Peter Krystad    2020-01-21   50  			if (version !=3D MPTC=
P_SUPPORTED_VERSION)
eda7acddf8080bb2 Peter Krystad    2020-01-21   51  				break;
cc7972ea1932335e Christoph Paasch 2020-01-21   52  		} else if (version < M=
PTCP_SUPPORTED_VERSION) {
cc7972ea1932335e Christoph Paasch 2020-01-21   53  			break;
cc7972ea1932335e Christoph Paasch 2020-01-21   54  		}
eda7acddf8080bb2 Peter Krystad    2020-01-21   55  =

eda7acddf8080bb2 Peter Krystad    2020-01-21   56  		flags =3D *ptr++;
65492c5a6ab5df50 Paolo Abeni      2020-01-21   57  		if (!mptcp_cap_flag_sh=
a256(flags) ||
eda7acddf8080bb2 Peter Krystad    2020-01-21   58  		    (flags & MPTCP_CAP=
_EXTENSIBILITY))
eda7acddf8080bb2 Peter Krystad    2020-01-21   59  			break;
eda7acddf8080bb2 Peter Krystad    2020-01-21   60  =

eda7acddf8080bb2 Peter Krystad    2020-01-21   61  		/* RFC 6824, Section 3=
.1:
eda7acddf8080bb2 Peter Krystad    2020-01-21   62  		 * "For the Checksum R=
equired bit (labeled "A"), if either
eda7acddf8080bb2 Peter Krystad    2020-01-21   63  		 * host requires the u=
se of checksums, checksums MUST be used.
eda7acddf8080bb2 Peter Krystad    2020-01-21   64  		 * In other words, the=
 only way for checksums not to be used
eda7acddf8080bb2 Peter Krystad    2020-01-21   65  		 * is if both hosts in=
 their SYNs set A=3D0."
eda7acddf8080bb2 Peter Krystad    2020-01-21   66  		 *
eda7acddf8080bb2 Peter Krystad    2020-01-21   67  		 * Section 3.3.0:
eda7acddf8080bb2 Peter Krystad    2020-01-21   68  		 * "If a checksum is n=
ot present when its use has been
eda7acddf8080bb2 Peter Krystad    2020-01-21   69  		 * negotiated, the rec=
eiver MUST close the subflow with a RST as
eda7acddf8080bb2 Peter Krystad    2020-01-21   70  		 * it is considered br=
oken."
eda7acddf8080bb2 Peter Krystad    2020-01-21   71  		 *
eda7acddf8080bb2 Peter Krystad    2020-01-21   72  		 * We don't implement =
DSS checksum - fall back to TCP.
eda7acddf8080bb2 Peter Krystad    2020-01-21   73  		 */
eda7acddf8080bb2 Peter Krystad    2020-01-21   74  		if (flags & MPTCP_CAP_=
CHECKSUM_REQD)
eda7acddf8080bb2 Peter Krystad    2020-01-21   75  			break;
eda7acddf8080bb2 Peter Krystad    2020-01-21   76  =

eda7acddf8080bb2 Peter Krystad    2020-01-21   77  		mp_opt->mp_capable =3D=
 1;
cc7972ea1932335e Christoph Paasch 2020-01-21   78  		if (opsize >=3D TCPOLE=
N_MPTCP_MPC_SYNACK) {
eda7acddf8080bb2 Peter Krystad    2020-01-21   79  			mp_opt->sndr_key =3D =
get_unaligned_be64(ptr);
eda7acddf8080bb2 Peter Krystad    2020-01-21   80  			ptr +=3D 8;
cc7972ea1932335e Christoph Paasch 2020-01-21   81  		}
cc7972ea1932335e Christoph Paasch 2020-01-21   82  		if (opsize >=3D TCPOLE=
N_MPTCP_MPC_ACK) {
eda7acddf8080bb2 Peter Krystad    2020-01-21   83  			mp_opt->rcvr_key =3D =
get_unaligned_be64(ptr);
eda7acddf8080bb2 Peter Krystad    2020-01-21   84  			ptr +=3D 8;
eda7acddf8080bb2 Peter Krystad    2020-01-21   85  		}
cc7972ea1932335e Christoph Paasch 2020-01-21   86  		if (opsize =3D=3D TCPO=
LEN_MPTCP_MPC_ACK_DATA) {
cc7972ea1932335e Christoph Paasch 2020-01-21   87  			/* Section 3.1.:
cc7972ea1932335e Christoph Paasch 2020-01-21   88  			 * "the data paramete=
rs in a MP_CAPABLE are semantically
cc7972ea1932335e Christoph Paasch 2020-01-21   89  			 * equivalent to thos=
e in a DSS option and can be used
cc7972ea1932335e Christoph Paasch 2020-01-21   90  			 * interchangeably."
cc7972ea1932335e Christoph Paasch 2020-01-21   91  			 */
cc7972ea1932335e Christoph Paasch 2020-01-21   92  			mp_opt->dss =3D 1;
cc7972ea1932335e Christoph Paasch 2020-01-21   93  			mp_opt->use_map =3D 1;
cc7972ea1932335e Christoph Paasch 2020-01-21   94  			mp_opt->mpc_map =3D 1;
cc7972ea1932335e Christoph Paasch 2020-01-21   95  			mp_opt->data_len =3D =
get_unaligned_be16(ptr);
cc7972ea1932335e Christoph Paasch 2020-01-21   96  			ptr +=3D 2;
cc7972ea1932335e Christoph Paasch 2020-01-21   97  		}
cc7972ea1932335e Christoph Paasch 2020-01-21   98  		pr_debug("MP_CAPABLE v=
ersion=3D%x, flags=3D%x, optlen=3D%d sndr=3D%llu, rcvr=3D%llu len=3D%d",
cc7972ea1932335e Christoph Paasch 2020-01-21   99  			 version, flags, opsi=
ze, mp_opt->sndr_key,
cc7972ea1932335e Christoph Paasch 2020-01-21  100  			 mp_opt->rcvr_key, mp=
_opt->data_len);
eda7acddf8080bb2 Peter Krystad    2020-01-21  101  		break;
eda7acddf8080bb2 Peter Krystad    2020-01-21  102  =

f296234c98a8fcec Peter Krystad    2020-03-27  103  	case MPTCPOPT_MP_JOIN:
f296234c98a8fcec Peter Krystad    2020-03-27  104  		mp_opt->mp_join =3D 1;
f296234c98a8fcec Peter Krystad    2020-03-27  105  		if (opsize =3D=3D TCPO=
LEN_MPTCP_MPJ_SYN) {
f296234c98a8fcec Peter Krystad    2020-03-27  106  			mp_opt->backup =3D *p=
tr++ & MPTCPOPT_BACKUP;
f296234c98a8fcec Peter Krystad    2020-03-27  107  			mp_opt->join_id =3D *=
ptr++;
f296234c98a8fcec Peter Krystad    2020-03-27  108  			mp_opt->token =3D get=
_unaligned_be32(ptr);
f296234c98a8fcec Peter Krystad    2020-03-27  109  			ptr +=3D 4;
f296234c98a8fcec Peter Krystad    2020-03-27  110  			mp_opt->nonce =3D get=
_unaligned_be32(ptr);
f296234c98a8fcec Peter Krystad    2020-03-27  111  			ptr +=3D 4;
f296234c98a8fcec Peter Krystad    2020-03-27  112  			pr_debug("MP_JOIN bku=
p=3D%u, id=3D%u, token=3D%u, nonce=3D%u",
f296234c98a8fcec Peter Krystad    2020-03-27  113  				 mp_opt->backup, mp_=
opt->join_id,
f296234c98a8fcec Peter Krystad    2020-03-27  114  				 mp_opt->token, mp_o=
pt->nonce);
f296234c98a8fcec Peter Krystad    2020-03-27  115  		} else if (opsize =3D=
=3D TCPOLEN_MPTCP_MPJ_SYNACK) {
f296234c98a8fcec Peter Krystad    2020-03-27  116  			mp_opt->backup =3D *p=
tr++ & MPTCPOPT_BACKUP;
f296234c98a8fcec Peter Krystad    2020-03-27  117  			mp_opt->join_id =3D *=
ptr++;
f296234c98a8fcec Peter Krystad    2020-03-27  118  			mp_opt->thmac =3D get=
_unaligned_be64(ptr);
f296234c98a8fcec Peter Krystad    2020-03-27  119  			ptr +=3D 8;
f296234c98a8fcec Peter Krystad    2020-03-27  120  			mp_opt->nonce =3D get=
_unaligned_be32(ptr);
f296234c98a8fcec Peter Krystad    2020-03-27  121  			ptr +=3D 4;
f296234c98a8fcec Peter Krystad    2020-03-27  122  			pr_debug("MP_JOIN bku=
p=3D%u, id=3D%u, thmac=3D%llu, nonce=3D%u",
f296234c98a8fcec Peter Krystad    2020-03-27  123  				 mp_opt->backup, mp_=
opt->join_id,
f296234c98a8fcec Peter Krystad    2020-03-27  124  				 mp_opt->thmac, mp_o=
pt->nonce);
f296234c98a8fcec Peter Krystad    2020-03-27  125  		} else if (opsize =3D=
=3D TCPOLEN_MPTCP_MPJ_ACK) {
f296234c98a8fcec Peter Krystad    2020-03-27  126  			ptr +=3D 2;
f296234c98a8fcec Peter Krystad    2020-03-27  127  			memcpy(mp_opt->hmac, =
ptr, MPTCPOPT_HMAC_LEN);
f296234c98a8fcec Peter Krystad    2020-03-27  128  			pr_debug("MP_JOIN hma=
c");
f296234c98a8fcec Peter Krystad    2020-03-27  129  		} else {
f296234c98a8fcec Peter Krystad    2020-03-27  130  			pr_warn("MP_JOIN bad =
option size");
f296234c98a8fcec Peter Krystad    2020-03-27  131  			mp_opt->mp_join =3D 0;
f296234c98a8fcec Peter Krystad    2020-03-27  132  		}
f296234c98a8fcec Peter Krystad    2020-03-27  133  		break;
f296234c98a8fcec Peter Krystad    2020-03-27  134  =

eda7acddf8080bb2 Peter Krystad    2020-01-21  135  	case MPTCPOPT_DSS:
eda7acddf8080bb2 Peter Krystad    2020-01-21  136  		pr_debug("DSS");
648ef4b88673dadb Mat Martineau    2020-01-21  137  		ptr++;
648ef4b88673dadb Mat Martineau    2020-01-21  138  =

cc7972ea1932335e Christoph Paasch 2020-01-21  139  		/* we must clear 'mpc_=
map' be able to detect MP_CAPABLE
cc7972ea1932335e Christoph Paasch 2020-01-21  140  		 * map vs DSS map in m=
ptcp_incoming_options(), and reconstruct
cc7972ea1932335e Christoph Paasch 2020-01-21  141  		 * map info accordingly
cc7972ea1932335e Christoph Paasch 2020-01-21  142  		 */
cc7972ea1932335e Christoph Paasch 2020-01-21  143  		mp_opt->mpc_map =3D 0;
648ef4b88673dadb Mat Martineau    2020-01-21  144  		flags =3D (*ptr++) & M=
PTCP_DSS_FLAG_MASK;
648ef4b88673dadb Mat Martineau    2020-01-21  145  		mp_opt->data_fin =3D (=
flags & MPTCP_DSS_DATA_FIN) !=3D 0;
648ef4b88673dadb Mat Martineau    2020-01-21  146  		mp_opt->dsn64 =3D (fla=
gs & MPTCP_DSS_DSN64) !=3D 0;
648ef4b88673dadb Mat Martineau    2020-01-21  147  		mp_opt->use_map =3D (f=
lags & MPTCP_DSS_HAS_MAP) !=3D 0;
648ef4b88673dadb Mat Martineau    2020-01-21  148  		mp_opt->ack64 =3D (fla=
gs & MPTCP_DSS_ACK64) !=3D 0;
648ef4b88673dadb Mat Martineau    2020-01-21  149  		mp_opt->use_ack =3D (f=
lags & MPTCP_DSS_HAS_ACK);
648ef4b88673dadb Mat Martineau    2020-01-21  150  =

648ef4b88673dadb Mat Martineau    2020-01-21  151  		pr_debug("data_fin=3D%=
d dsn64=3D%d use_map=3D%d ack64=3D%d use_ack=3D%d",
648ef4b88673dadb Mat Martineau    2020-01-21  152  			 mp_opt->data_fin, mp=
_opt->dsn64,
648ef4b88673dadb Mat Martineau    2020-01-21  153  			 mp_opt->use_map, mp_=
opt->ack64,
648ef4b88673dadb Mat Martineau    2020-01-21  154  			 mp_opt->use_ack);
648ef4b88673dadb Mat Martineau    2020-01-21  155  =

648ef4b88673dadb Mat Martineau    2020-01-21  156  		expected_opsize =3D TC=
POLEN_MPTCP_DSS_BASE;
648ef4b88673dadb Mat Martineau    2020-01-21  157  =

648ef4b88673dadb Mat Martineau    2020-01-21  158  		if (mp_opt->use_ack) {
648ef4b88673dadb Mat Martineau    2020-01-21  159  			if (mp_opt->ack64)
648ef4b88673dadb Mat Martineau    2020-01-21  160  				expected_opsize +=3D=
 TCPOLEN_MPTCP_DSS_ACK64;
648ef4b88673dadb Mat Martineau    2020-01-21  161  			else
648ef4b88673dadb Mat Martineau    2020-01-21  162  				expected_opsize +=3D=
 TCPOLEN_MPTCP_DSS_ACK32;
648ef4b88673dadb Mat Martineau    2020-01-21  163  		}
648ef4b88673dadb Mat Martineau    2020-01-21  164  =

648ef4b88673dadb Mat Martineau    2020-01-21  165  		if (mp_opt->use_map) {
648ef4b88673dadb Mat Martineau    2020-01-21  166  			if (mp_opt->dsn64)
648ef4b88673dadb Mat Martineau    2020-01-21  167  				expected_opsize +=3D=
 TCPOLEN_MPTCP_DSS_MAP64;
648ef4b88673dadb Mat Martineau    2020-01-21  168  			else
648ef4b88673dadb Mat Martineau    2020-01-21  169  				expected_opsize +=3D=
 TCPOLEN_MPTCP_DSS_MAP32;
648ef4b88673dadb Mat Martineau    2020-01-21  170  		}
648ef4b88673dadb Mat Martineau    2020-01-21  171  =

648ef4b88673dadb Mat Martineau    2020-01-21  172  		/* RFC 6824, Section 3=
.3:
648ef4b88673dadb Mat Martineau    2020-01-21  173  		 * If a checksum is pr=
esent, but its use had
648ef4b88673dadb Mat Martineau    2020-01-21  174  		 * not been negotiated=
 in the MP_CAPABLE handshake,
648ef4b88673dadb Mat Martineau    2020-01-21  175  		 * the checksum field =
MUST be ignored.
648ef4b88673dadb Mat Martineau    2020-01-21  176  		 */
648ef4b88673dadb Mat Martineau    2020-01-21  177  		if (opsize !=3D expect=
ed_opsize &&
648ef4b88673dadb Mat Martineau    2020-01-21  178  		    opsize !=3D expect=
ed_opsize + TCPOLEN_MPTCP_DSS_CHECKSUM)
648ef4b88673dadb Mat Martineau    2020-01-21  179  			break;
648ef4b88673dadb Mat Martineau    2020-01-21  180  =

eda7acddf8080bb2 Peter Krystad    2020-01-21  181  		mp_opt->dss =3D 1;
648ef4b88673dadb Mat Martineau    2020-01-21  182  =

648ef4b88673dadb Mat Martineau    2020-01-21  183  		if (mp_opt->use_ack) {
648ef4b88673dadb Mat Martineau    2020-01-21  184  			if (mp_opt->ack64) {
648ef4b88673dadb Mat Martineau    2020-01-21  185  				mp_opt->data_ack =3D=
 get_unaligned_be64(ptr);
648ef4b88673dadb Mat Martineau    2020-01-21  186  				ptr +=3D 8;
648ef4b88673dadb Mat Martineau    2020-01-21  187  			} else {
648ef4b88673dadb Mat Martineau    2020-01-21  188  				mp_opt->data_ack =3D=
 get_unaligned_be32(ptr);
648ef4b88673dadb Mat Martineau    2020-01-21  189  				ptr +=3D 4;
648ef4b88673dadb Mat Martineau    2020-01-21  190  			}
648ef4b88673dadb Mat Martineau    2020-01-21  191  =

648ef4b88673dadb Mat Martineau    2020-01-21  192  			pr_debug("data_ack=3D=
%llu", mp_opt->data_ack);
648ef4b88673dadb Mat Martineau    2020-01-21  193  		}
648ef4b88673dadb Mat Martineau    2020-01-21  194  =

648ef4b88673dadb Mat Martineau    2020-01-21  195  		if (mp_opt->use_map) {
648ef4b88673dadb Mat Martineau    2020-01-21  196  			if (mp_opt->dsn64) {
648ef4b88673dadb Mat Martineau    2020-01-21  197  				mp_opt->data_seq =3D=
 get_unaligned_be64(ptr);
648ef4b88673dadb Mat Martineau    2020-01-21  198  				ptr +=3D 8;
648ef4b88673dadb Mat Martineau    2020-01-21  199  			} else {
648ef4b88673dadb Mat Martineau    2020-01-21  200  				mp_opt->data_seq =3D=
 get_unaligned_be32(ptr);
648ef4b88673dadb Mat Martineau    2020-01-21  201  				ptr +=3D 4;
648ef4b88673dadb Mat Martineau    2020-01-21  202  			}
648ef4b88673dadb Mat Martineau    2020-01-21  203  =

648ef4b88673dadb Mat Martineau    2020-01-21  204  			mp_opt->subflow_seq =
=3D get_unaligned_be32(ptr);
648ef4b88673dadb Mat Martineau    2020-01-21  205  			ptr +=3D 4;
648ef4b88673dadb Mat Martineau    2020-01-21  206  =

648ef4b88673dadb Mat Martineau    2020-01-21  207  			mp_opt->data_len =3D =
get_unaligned_be16(ptr);
648ef4b88673dadb Mat Martineau    2020-01-21  208  			ptr +=3D 2;
648ef4b88673dadb Mat Martineau    2020-01-21  209  =

648ef4b88673dadb Mat Martineau    2020-01-21  210  			pr_debug("data_seq=3D=
%llu subflow_seq=3D%u data_len=3D%u",
648ef4b88673dadb Mat Martineau    2020-01-21  211  				 mp_opt->data_seq, m=
p_opt->subflow_seq,
648ef4b88673dadb Mat Martineau    2020-01-21  212  				 mp_opt->data_len);
648ef4b88673dadb Mat Martineau    2020-01-21  213  		}
648ef4b88673dadb Mat Martineau    2020-01-21  214  =

eda7acddf8080bb2 Peter Krystad    2020-01-21  215  		break;
eda7acddf8080bb2 Peter Krystad    2020-01-21  216  =

3df523ab582c52f7 Peter Krystad    2020-03-27  217  	case MPTCPOPT_ADD_ADDR:
3df523ab582c52f7 Peter Krystad    2020-03-27  218  		mp_opt->echo =3D (*ptr=
++) & MPTCP_ADDR_ECHO;
3df523ab582c52f7 Peter Krystad    2020-03-27  219  		if (!mp_opt->echo) {
3df523ab582c52f7 Peter Krystad    2020-03-27  220  			if (opsize =3D=3D TCP=
OLEN_MPTCP_ADD_ADDR ||
3df523ab582c52f7 Peter Krystad    2020-03-27  221  			    opsize =3D=3D TCP=
OLEN_MPTCP_ADD_ADDR_PORT)
3df523ab582c52f7 Peter Krystad    2020-03-27  222  				mp_opt->family =3D M=
PTCP_ADDR_IPVERSION_4;
3df523ab582c52f7 Peter Krystad    2020-03-27  223  #if IS_ENABLED(CONFIG_MP=
TCP_IPV6)
3df523ab582c52f7 Peter Krystad    2020-03-27  224  			else if (opsize =3D=
=3D TCPOLEN_MPTCP_ADD_ADDR6 ||
3df523ab582c52f7 Peter Krystad    2020-03-27  225  				 opsize =3D=3D TCPOL=
EN_MPTCP_ADD_ADDR6_PORT)
3df523ab582c52f7 Peter Krystad    2020-03-27  226  				mp_opt->family =3D M=
PTCP_ADDR_IPVERSION_6;
3df523ab582c52f7 Peter Krystad    2020-03-27  227  #endif
3df523ab582c52f7 Peter Krystad    2020-03-27  228  			else
3df523ab582c52f7 Peter Krystad    2020-03-27  229  				break;
3df523ab582c52f7 Peter Krystad    2020-03-27  230  		} else {
3df523ab582c52f7 Peter Krystad    2020-03-27  231  			if (opsize =3D=3D TCP=
OLEN_MPTCP_ADD_ADDR_BASE ||
3df523ab582c52f7 Peter Krystad    2020-03-27  232  			    opsize =3D=3D TCP=
OLEN_MPTCP_ADD_ADDR_BASE_PORT)
3df523ab582c52f7 Peter Krystad    2020-03-27  233  				mp_opt->family =3D M=
PTCP_ADDR_IPVERSION_4;
3df523ab582c52f7 Peter Krystad    2020-03-27  234  #if IS_ENABLED(CONFIG_MP=
TCP_IPV6)
3df523ab582c52f7 Peter Krystad    2020-03-27  235  			else if (opsize =3D=
=3D TCPOLEN_MPTCP_ADD_ADDR6_BASE ||
3df523ab582c52f7 Peter Krystad    2020-03-27  236  				 opsize =3D=3D TCPOL=
EN_MPTCP_ADD_ADDR6_BASE_PORT)
3df523ab582c52f7 Peter Krystad    2020-03-27  237  				mp_opt->family =3D M=
PTCP_ADDR_IPVERSION_6;
3df523ab582c52f7 Peter Krystad    2020-03-27  238  #endif
3df523ab582c52f7 Peter Krystad    2020-03-27  239  			else
3df523ab582c52f7 Peter Krystad    2020-03-27  240  				break;
3df523ab582c52f7 Peter Krystad    2020-03-27  241  		}
3df523ab582c52f7 Peter Krystad    2020-03-27  242  =

3df523ab582c52f7 Peter Krystad    2020-03-27  243  		mp_opt->add_addr =3D 1;
3df523ab582c52f7 Peter Krystad    2020-03-27  244  		mp_opt->addr_id =3D *p=
tr++;
3df523ab582c52f7 Peter Krystad    2020-03-27  245  		if (mp_opt->family =3D=
=3D MPTCP_ADDR_IPVERSION_4) {
3df523ab582c52f7 Peter Krystad    2020-03-27  246  			memcpy((u8 *)&mp_opt-=
>addr.s_addr, (u8 *)ptr, 4);
3df523ab582c52f7 Peter Krystad    2020-03-27  247  			ptr +=3D 4;
3df523ab582c52f7 Peter Krystad    2020-03-27  248  			if (opsize =3D=3D TCP=
OLEN_MPTCP_ADD_ADDR_PORT ||
3df523ab582c52f7 Peter Krystad    2020-03-27  249  			    opsize =3D=3D TCP=
OLEN_MPTCP_ADD_ADDR_BASE_PORT) {
3df523ab582c52f7 Peter Krystad    2020-03-27  250  				mp_opt->port =3D get=
_unaligned_be16(ptr);
3df523ab582c52f7 Peter Krystad    2020-03-27  251  				ptr +=3D 2;
3df523ab582c52f7 Peter Krystad    2020-03-27  252  			}
3df523ab582c52f7 Peter Krystad    2020-03-27  253  		}
3df523ab582c52f7 Peter Krystad    2020-03-27  254  #if IS_ENABLED(CONFIG_MP=
TCP_IPV6)
3df523ab582c52f7 Peter Krystad    2020-03-27  255  		else {
3df523ab582c52f7 Peter Krystad    2020-03-27  256  			memcpy(mp_opt->addr6.=
s6_addr, (u8 *)ptr, 16);
3df523ab582c52f7 Peter Krystad    2020-03-27  257  			ptr +=3D 16;
3df523ab582c52f7 Peter Krystad    2020-03-27  258  			if (opsize =3D=3D TCP=
OLEN_MPTCP_ADD_ADDR6_PORT ||
3df523ab582c52f7 Peter Krystad    2020-03-27  259  			    opsize =3D=3D TCP=
OLEN_MPTCP_ADD_ADDR6_BASE_PORT) {
3df523ab582c52f7 Peter Krystad    2020-03-27  260  				mp_opt->port =3D get=
_unaligned_be16(ptr);
3df523ab582c52f7 Peter Krystad    2020-03-27  261  				ptr +=3D 2;
3df523ab582c52f7 Peter Krystad    2020-03-27  262  			}
3df523ab582c52f7 Peter Krystad    2020-03-27  263  		}
3df523ab582c52f7 Peter Krystad    2020-03-27  264  #endif
3df523ab582c52f7 Peter Krystad    2020-03-27  265  		if (!mp_opt->echo) {
3df523ab582c52f7 Peter Krystad    2020-03-27  266  			mp_opt->ahmac =3D get=
_unaligned_be64(ptr);
3df523ab582c52f7 Peter Krystad    2020-03-27  267  			ptr +=3D 8;
3df523ab582c52f7 Peter Krystad    2020-03-27  268  		}
90a4aea8b6edff45 Geliang Tang     2020-12-09  269  		pr_debug("ADD_ADDR%s: =
id=3D%d, ahmac=3D%llu, echo=3D%d, port=3D%d",
90a4aea8b6edff45 Geliang Tang     2020-12-09  270  			 (mp_opt->family =3D=
=3D MPTCP_ADDR_IPVERSION_6) ? "6" : "",
90a4aea8b6edff45 Geliang Tang     2020-12-09  271  			 mp_opt->addr_id, mp_=
opt->ahmac, mp_opt->echo, mp_opt->port);
3df523ab582c52f7 Peter Krystad    2020-03-27  272  		break;
3df523ab582c52f7 Peter Krystad    2020-03-27  273  =

3df523ab582c52f7 Peter Krystad    2020-03-27  274  	case MPTCPOPT_RM_ADDR:
3df523ab582c52f7 Peter Krystad    2020-03-27  275  		if (opsize !=3D TCPOLE=
N_MPTCP_RM_ADDR_BASE)
3df523ab582c52f7 Peter Krystad    2020-03-27  276  			break;
3df523ab582c52f7 Peter Krystad    2020-03-27  277  =

8e60eed6b38e464e Geliang Tang     2020-06-08  278  		ptr++;
8e60eed6b38e464e Geliang Tang     2020-06-08  279  =

3df523ab582c52f7 Peter Krystad    2020-03-27  280  		mp_opt->rm_addr =3D 1;
3df523ab582c52f7 Peter Krystad    2020-03-27  281  		mp_opt->rm_id =3D *ptr=
++;
3df523ab582c52f7 Peter Krystad    2020-03-27  282  		pr_debug("RM_ADDR: id=
=3D%d", mp_opt->rm_id);
3df523ab582c52f7 Peter Krystad    2020-03-27  283  		break;
3df523ab582c52f7 Peter Krystad    2020-03-27  284  =

50c504a20a754ca3 Florian Westphal 2020-12-10  285  	case MPTCPOPT_MP_FASTCL=
OSE:
50c504a20a754ca3 Florian Westphal 2020-12-10  286  		if (opsize !=3D TCPOLE=
N_MPTCP_FASTCLOSE)
50c504a20a754ca3 Florian Westphal 2020-12-10  287  			break;
50c504a20a754ca3 Florian Westphal 2020-12-10  288  =

50c504a20a754ca3 Florian Westphal 2020-12-10  289  		ptr +=3D 2;
50c504a20a754ca3 Florian Westphal 2020-12-10  290  		mp_opt->rcvr_key =3D g=
et_unaligned_be64(ptr);
50c504a20a754ca3 Florian Westphal 2020-12-10 @291  		ptr +=3D 8;
50c504a20a754ca3 Florian Westphal 2020-12-10  292  		mp_opt->fastclose =3D =
1;
50c504a20a754ca3 Florian Westphal 2020-12-10  293  		break;
50c504a20a754ca3 Florian Westphal 2020-12-10  294  =

eda7acddf8080bb2 Peter Krystad    2020-01-21  295  	default:
eda7acddf8080bb2 Peter Krystad    2020-01-21  296  		break;
eda7acddf8080bb2 Peter Krystad    2020-01-21  297  	}
eda7acddf8080bb2 Peter Krystad    2020-01-21  298  }
eda7acddf8080bb2 Peter Krystad    2020-01-21  299  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5231807114531430247==--

