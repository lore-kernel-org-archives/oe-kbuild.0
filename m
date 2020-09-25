Content-Type: multipart/mixed; boundary="===============4281144283445251188=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [dhowells-fs:rxrpc-rxgk 23/24] net/rxrpc/rxgk.c:796:2: sparse: sparse: TODO
Date: Fri, 25 Sep 2020 14:25:13 +0800
Message-ID: <202009251409.2CM8fWb3%lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4281144283445251188==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
TO: David Howells <dhowells@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.g=
it rxrpc-rxgk
head:   e1b46e393c5b514df661f2f027241d3b4745cda2
commit: 4c409d90406b58d4e7fa61cfcc82b54880ff34dd [23/24] rxrpc: rxgk: Imple=
ment the yfs-rxgk security class (GSSAPI)
:::::: branch date: 21 hours ago
:::::: commit date: 21 hours ago
config: openrisc-randconfig-s031-20200925 (attached as .config)
compiler: or1k-linux-gcc (GCC) 9.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.2-201-g24bdaac6-dirty
        git checkout 4c409d90406b58d4e7fa61cfcc82b54880ff34dd
        # save the attached .config to linux build tree
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cross =
C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' ARCH=3Dopenrisc =


If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)

>> net/rxrpc/rxgk.c:796:2: sparse: sparse: TODO
   net/rxrpc/rxgk.c:908:2: sparse: sparse: TODO
   net/rxrpc/rxgk.c:794:17: sparse: sparse: return with no return value
>> net/rxrpc/rxgk.c:858:20: sparse: sparse: restricted __be32 degrades to i=
nteger
>> net/rxrpc/rxgk.c:858:20: sparse: sparse: cast to restricted __be32
>> net/rxrpc/rxgk.c:858:20: sparse: sparse: restricted __be32 degrades to i=
nteger
   net/rxrpc/rxgk.c:859:20: sparse: sparse: restricted __be32 degrades to i=
nteger
   net/rxrpc/rxgk.c:859:20: sparse: sparse: cast to restricted __be32
   net/rxrpc/rxgk.c:859:20: sparse: sparse: restricted __be32 degrades to i=
nteger

# https://git.kernel.org/pub/scm/linux/kernel/git/dhowells/linux-fs.git/com=
mit/?id=3D4c409d90406b58d4e7fa61cfcc82b54880ff34dd
git remote add dhowells-fs https://git.kernel.org/pub/scm/linux/kernel/git/=
dhowells/linux-fs.git
git fetch --no-tags dhowells-fs rxrpc-rxgk
git checkout 4c409d90406b58d4e7fa61cfcc82b54880ff34dd
vim +796 net/rxrpc/rxgk.c

4c409d90406b58d David Howells 2020-09-08  760  =

4c409d90406b58d David Howells 2020-09-08  761  /*
4c409d90406b58d David Howells 2020-09-08  762   * Decode the ticket in a re=
sponse.
4c409d90406b58d David Howells 2020-09-08  763   *
4c409d90406b58d David Howells 2020-09-08  764   * struct RXGK_AuthName {
4c409d90406b58d David Howells 2020-09-08  765   *	afs_int32	kind;
4c409d90406b58d David Howells 2020-09-08  766   *	opaque		data<AUTHDATAMAX>;
4c409d90406b58d David Howells 2020-09-08  767   *	opaque		display<AUTHPRINT=
ABLEMAX>;
4c409d90406b58d David Howells 2020-09-08  768   * };
4c409d90406b58d David Howells 2020-09-08  769   *
4c409d90406b58d David Howells 2020-09-08  770   * struct RXGK_Token {
4c409d90406b58d David Howells 2020-09-08  771   *	rxgk_key		K0;
4c409d90406b58d David Howells 2020-09-08  772   *	RXGK_Level		level;
4c409d90406b58d David Howells 2020-09-08  773   *	rxgkTime		starttime;
4c409d90406b58d David Howells 2020-09-08  774   *	afs_int32		lifetime;
4c409d90406b58d David Howells 2020-09-08  775   *	afs_int32		bytelife;
4c409d90406b58d David Howells 2020-09-08  776   *	rxgkTime		expirationtime;
4c409d90406b58d David Howells 2020-09-08  777   *	struct RXGK_AuthName	iden=
tities<>;
4c409d90406b58d David Howells 2020-09-08  778   * };
4c409d90406b58d David Howells 2020-09-08  779   */
4c409d90406b58d David Howells 2020-09-08  780  static int rxgk_decode_ticke=
t(struct sk_buff *skb,
4c409d90406b58d David Howells 2020-09-08  781  			      unsigned int ticket=
_offset, unsigned int ticket_len,
4c409d90406b58d David Howells 2020-09-08  782  			      u32 *_abort_code)
4c409d90406b58d David Howells 2020-09-08  783  {
4c409d90406b58d David Howells 2020-09-08  784  	struct key *key;
4c409d90406b58d David Howells 2020-09-08  785  	__be32 *xdr, *p;
4c409d90406b58d David Howells 2020-09-08  786  	int ret;
4c409d90406b58d David Howells 2020-09-08  787  =

4c409d90406b58d David Howells 2020-09-08  788  	xdr =3D kmalloc(ticket_len,=
 GFP_NOFS);
4c409d90406b58d David Howells 2020-09-08  789  	if (!xdr)
4c409d90406b58d David Howells 2020-09-08  790  		return -ENOMEM;
4c409d90406b58d David Howells 2020-09-08  791  =

4c409d90406b58d David Howells 2020-09-08  792  	ret =3D skb_copy_bits(skb, =
ticket_offset, xdr, ticket_len);
4c409d90406b58d David Howells 2020-09-08  793  	if (ret < 0)
4c409d90406b58d David Howells 2020-09-08  794  		return;
4c409d90406b58d David Howells 2020-09-08  795  =

4c409d90406b58d David Howells 2020-09-08 @796  #warning TODO
4c409d90406b58d David Howells 2020-09-08  797  }
4c409d90406b58d David Howells 2020-09-08  798  =

4c409d90406b58d David Howells 2020-09-08  799  /*
4c409d90406b58d David Howells 2020-09-08  800   * Verify a response.
4c409d90406b58d David Howells 2020-09-08  801   *
4c409d90406b58d David Howells 2020-09-08  802   * struct RXGK_Response {
4c409d90406b58d David Howells 2020-09-08  803   *	rxgkTime	start_time;
4c409d90406b58d David Howells 2020-09-08  804   *	RXGK_Data	token;
4c409d90406b58d David Howells 2020-09-08  805   *	opaque		authenticator<RXG=
K_MAXAUTHENTICATOR>
4c409d90406b58d David Howells 2020-09-08  806   * };
4c409d90406b58d David Howells 2020-09-08  807   *
4c409d90406b58d David Howells 2020-09-08  808   * struct RXGK_TokenContaine=
r {
4c409d90406b58d David Howells 2020-09-08  809   *	afs_int32	kvno;
4c409d90406b58d David Howells 2020-09-08  810   *	afs_int32	enctype;
4c409d90406b58d David Howells 2020-09-08  811   *	opaque		encrypted_token<>;
4c409d90406b58d David Howells 2020-09-08  812   * };
4c409d90406b58d David Howells 2020-09-08  813   */
4c409d90406b58d David Howells 2020-09-08  814  static int rxgk_verify_respo=
nse(struct rxrpc_connection *conn,
4c409d90406b58d David Howells 2020-09-08  815  				struct sk_buff *skb,
4c409d90406b58d David Howells 2020-09-08  816  				u32 *_abort_code)
4c409d90406b58d David Howells 2020-09-08  817  {
4c409d90406b58d David Howells 2020-09-08  818  	const struct rxgk_krb5_enct=
ype *gk5e;
4c409d90406b58d David Howells 2020-09-08  819  	const struct rxgk_buffer *s=
erver_secret;
4c409d90406b58d David Howells 2020-09-08  820  	struct rxrpc_skb_priv *sp =
=3D rxrpc_skb(skb);
4c409d90406b58d David Howells 2020-09-08  821  	struct rxgk_enc_keys token_=
enc =3D { NULL, NULL};
4c409d90406b58d David Howells 2020-09-08  822  	struct key *server_key;
4c409d90406b58d David Howells 2020-09-08  823  	const char *eproto;
4c409d90406b58d David Howells 2020-09-08  824  	unsigned int offset =3D siz=
eof(struct rxrpc_wire_header);
4c409d90406b58d David Howells 2020-09-08  825  	unsigned int len =3D skb->l=
en - sizeof(struct rxrpc_wire_header);
4c409d90406b58d David Howells 2020-09-08  826  	unsigned int token_offset, =
token_len;
4c409d90406b58d David Howells 2020-09-08  827  	unsigned int ticket_offset,=
 ticket_len;
4c409d90406b58d David Howells 2020-09-08  828  	unsigned int auth_offset, a=
uth_len;
4c409d90406b58d David Howells 2020-09-08  829  	__be32 xauth_len;
4c409d90406b58d David Howells 2020-09-08  830  	u32 kvno, enctype, abort_co=
de;
4c409d90406b58d David Howells 2020-09-08  831  	int ret;
4c409d90406b58d David Howells 2020-09-08  832  =

4c409d90406b58d David Howells 2020-09-08  833  	struct {
4c409d90406b58d David Howells 2020-09-08  834  		struct rxgk_response respo=
nse;
4c409d90406b58d David Howells 2020-09-08  835  		struct {
4c409d90406b58d David Howells 2020-09-08  836  			__be32 kvno;
4c409d90406b58d David Howells 2020-09-08  837  			__be32 enctype;
4c409d90406b58d David Howells 2020-09-08  838  			__be32 token_len;
4c409d90406b58d David Howells 2020-09-08  839  		} container;
4c409d90406b58d David Howells 2020-09-08  840  	} __packed rhdr;
4c409d90406b58d David Howells 2020-09-08  841  =

4c409d90406b58d David Howells 2020-09-08  842  	_enter("{%d}", conn->debug_=
id);
4c409d90406b58d David Howells 2020-09-08  843  =

4c409d90406b58d David Howells 2020-09-08  844  	/* Parse the RXGK_Response =
object */
4c409d90406b58d David Howells 2020-09-08  845  	if (sizeof(rhdr) + sizeof(_=
_be32) > len)
4c409d90406b58d David Howells 2020-09-08  846  		goto short_packet;
4c409d90406b58d David Howells 2020-09-08  847  =

4c409d90406b58d David Howells 2020-09-08  848  	if (skb_copy_bits(skb, offs=
et, &rhdr, sizeof(rhdr)) < 0)
4c409d90406b58d David Howells 2020-09-08  849  		goto short_packet;
4c409d90406b58d David Howells 2020-09-08  850  	offset	+=3D sizeof(rhdr.res=
ponse);
4c409d90406b58d David Howells 2020-09-08  851  	len	-=3D sizeof(rhdr.respon=
se);
4c409d90406b58d David Howells 2020-09-08  852  =

4c409d90406b58d David Howells 2020-09-08  853  	token_offset	=3D offset;
4c409d90406b58d David Howells 2020-09-08  854  	token_len	=3D ntohl(rhdr.re=
sponse.token_len);
4c409d90406b58d David Howells 2020-09-08  855  	if (xdr_round_up(token_len)=
 + sizeof(__be32) > len)
4c409d90406b58d David Howells 2020-09-08  856  		goto short_packet;
4c409d90406b58d David Howells 2020-09-08  857  =

4c409d90406b58d David Howells 2020-09-08 @858  	offset	+=3D xdr_round_up(rh=
dr.response.token_len);
4c409d90406b58d David Howells 2020-09-08  859  	len	-=3D xdr_round_up(rhdr.=
response.token_len);
4c409d90406b58d David Howells 2020-09-08  860  =

4c409d90406b58d David Howells 2020-09-08  861  	if (skb_copy_bits(skb, offs=
et, &xauth_len, sizeof(xauth_len)) < 0)
4c409d90406b58d David Howells 2020-09-08  862  		goto short_packet;
4c409d90406b58d David Howells 2020-09-08  863  	offset	+=3D sizeof(xauth_le=
n);
4c409d90406b58d David Howells 2020-09-08  864  	len	-=3D sizeof(xauth_len);
4c409d90406b58d David Howells 2020-09-08  865  =

4c409d90406b58d David Howells 2020-09-08  866  	auth_offset	=3D offset;
4c409d90406b58d David Howells 2020-09-08  867  	auth_len	=3D ntohl(xauth_le=
n);
4c409d90406b58d David Howells 2020-09-08  868  	if (auth_len < len)
4c409d90406b58d David Howells 2020-09-08  869  		goto short_packet;
4c409d90406b58d David Howells 2020-09-08  870  =

4c409d90406b58d David Howells 2020-09-08  871  	/* We have to decode the to=
ken first to gain access to K0, from which
4c409d90406b58d David Howells 2020-09-08  872  	 * we can derive the transp=
ort key and thence decode the authenticator.
4c409d90406b58d David Howells 2020-09-08  873  	 *
4c409d90406b58d David Howells 2020-09-08  874  	 * Start off by decoding th=
e RXGK_TokenContainer object.
4c409d90406b58d David Howells 2020-09-08  875  	 */
4c409d90406b58d David Howells 2020-09-08  876  	kvno		=3D ntohl(rhdr.contai=
ner.kvno);
4c409d90406b58d David Howells 2020-09-08  877  	enctype		=3D ntohl(rhdr.con=
tainer.enctype);
4c409d90406b58d David Howells 2020-09-08  878  	ticket_len	=3D ntohl(rhdr.c=
ontainer.token_len);
4c409d90406b58d David Howells 2020-09-08  879  	ticket_offset	=3D token_off=
set + 3 * 4;
4c409d90406b58d David Howells 2020-09-08  880  =

4c409d90406b58d David Howells 2020-09-08  881  	if (xdr_round_up(ticket_len=
) > token_len - 3 * 4)
4c409d90406b58d David Howells 2020-09-08  882  		goto short_packet;
4c409d90406b58d David Howells 2020-09-08  883  =

4c409d90406b58d David Howells 2020-09-08  884  	kdebug("KVNO %u", kvno);
4c409d90406b58d David Howells 2020-09-08  885  	kdebug("ENC  %u", enctype);
4c409d90406b58d David Howells 2020-09-08  886  	kdebug("TLEN %u", ticket_le=
n);
4c409d90406b58d David Howells 2020-09-08  887  =

4c409d90406b58d David Howells 2020-09-08  888  	server_key =3D rxrpc_look_u=
p_server_security(conn, skb, kvno, enctype);
4c409d90406b58d David Howells 2020-09-08  889  	if (IS_ERR(server_key))
4c409d90406b58d David Howells 2020-09-08  890  		goto cant_get_server_key;
4c409d90406b58d David Howells 2020-09-08  891  =

4c409d90406b58d David Howells 2020-09-08  892  	down_read(&server_key->sem);
4c409d90406b58d David Howells 2020-09-08  893  	server_secret =3D (const vo=
id *)&server_key->payload.data[2];
4c409d90406b58d David Howells 2020-09-08  894  	ret =3D rxgk_set_up_token_c=
ipher(server_secret, &token_enc, enctype, &gk5e, GFP_KERNEL);
4c409d90406b58d David Howells 2020-09-08  895  	up_read(&server_key->sem);
4c409d90406b58d David Howells 2020-09-08  896  	key_put(server_key);
4c409d90406b58d David Howells 2020-09-08  897  	if (ret < 0)
4c409d90406b58d David Howells 2020-09-08  898  		goto cant_get_token;
4c409d90406b58d David Howells 2020-09-08  899  =

4c409d90406b58d David Howells 2020-09-08  900  	eproto =3D tracepoint_strin=
g("rxgk_rsp_dec_tkt");
4c409d90406b58d David Howells 2020-09-08  901  	ret =3D gk5e->scheme->decry=
pt_skb(NULL, gk5e, &token_enc, skb,
4c409d90406b58d David Howells 2020-09-08  902  					&ticket_offset, &ticket=
_len, &abort_code);
4c409d90406b58d David Howells 2020-09-08  903  	if (ret < 0)
4c409d90406b58d David Howells 2020-09-08  904  		goto protocol_error;
4c409d90406b58d David Howells 2020-09-08  905  =

4c409d90406b58d David Howells 2020-09-08  906  	ret =3D rxgk_decode_ticket(=
skb, ticket_offset, ticket_len, &abort_code);
4c409d90406b58d David Howells 2020-09-08  907  =


---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all@lists.01.org

--===============4281144283445251188==
Content-Type: application/gzip
MIME-Version: 1.0
Content-Transfer-Encoding: base64
Content-Disposition: attachment; filename="config.gz"

H4sICL2CbV8AAy5jb25maWcAjDzLctu4svvzFaxM1a1zFpmx5MQzube8gECQQkQSDADKcjYsRVES
VRw7JckzJ39/uwE+ABJUMouJ2d14NRr9QkO//eu3iDyfn75tz4fd9uHhR/R5/7g/bs/7j9Gnw8P+
/6JYRIXQEYu5/h2Is8Pj83//ePq+fzweTrvo9e9vfr96edxdR6v98XH/ENGnx0+Hz8/Qw+Hp8V+/
/YuKIuFpTWm9ZlJxUdSabfTti6fj7OvLB+zs5efdLvp3Sul/oje/X/9+9cJpw1UNiNsfLSjt+7l9
c3V9ddUisriDz69fXZn/un4yUqQd+srpfklUTVRep0KLfhAHwYuMF6xHcfmuvhNyBRBY229Rapj1
EJ325+fv/Wp5wXXNinVNJEyN51zfXs+BvB1A5CXPGHBC6ehwih6fzthDtxZBSdZO98WLELgmlTvj
RcWBAYpk2qGPWUKqTJvJBMBLoXRBcnb74t+PT4/7/7zo56fu1ZqX1J1ahyuF4ps6f1exigUJ7oim
y3oaT6VQqs5ZLuR9TbQmdBngQaVYxhf9CkkF8tdyHXYhOj1/OP04nfffeq6nrGCSU7NJpRQLZ99c
lFqKuzCGF28Z1cj1IJoueemLQixywgsfpnjeA5akiGGjLR2ie5QqiVTMh7mjxWxRpYkC5G/R/vFj
9PRpsO5Qoxx2ljejynG/FGRoxdas0Ooisl5IQWJKVMdyffi2P55CXNecrmpRMGCrdhb+vi6hVxFz
albQgAuBGA6zC+y5QTpd8HRZS6ZghByk3mXEaDaOfErG8lJDZ0VojBa9FllVaCLv3dk1yAvNqIBW
LU9oWf2ht6ev0RmmE21haqfz9nyKtrvd0/Pj+fD4ecAlaFATavrgReqOvFAxiixlcDSAQgdPjiZq
pTTRKnwwFffhDa9+YZbO4YQZciUygqfA7c4sWNIqUgEJAObUgOu3Dj5qtgEBcCRCeRSmzQCEyzNN
G4kMoEagKmYhuJaEBuYE3MsyVL+5e8YRUzAGCpSldJFxpX1cQgpRGQ0+AtYZI8mto9pNX4IukJPT
m9jPDwScxHW+CG6dz+9OyazsH47aWXViKqgLXkLn9uh0NgSNRQI6kCf6dn7lwnHvc7Jx8LN5L/+8
0CuwMAkb9DG7trKhdl/2H58f9sfo0357fj7uTwbcrCSA7axtKkVVKvc0gHGgadh4GOJa0SWLLxGU
PA6fkgYv45xcwicgnu+ZDJOUYJwmDmHTPGZrTifMn6WATibPeUOyKJPLY4B9CBKgVQfrAsok3H7J
6KoUsKGoXbWQ4YkaHhs/w4wXprlXiYKZgHqkRE9siWQZuQ/o1EW2QkYZ/0TGjtjiN8mhYyUqSZnj
u8i4Tt+7RhgACwDMPUj2PiceYPN+gBeD71fe93ulY085C4GaH/8OLAO8RVGCieLvWZ0IiWYP/slJ
QZnbyZBMwR+B3oCjVGeuA7FmdcXj2Y3j7ZVJ/zFUswNa4xCAvDrOgEqZzkELmbFAHzoYs50jcGL9
iR5gfcDOLHs6wnVKHRXFsgRYKJ1OFgS8n6TyBqogNhh8wlF2eimFN1+eFiRLHNkxc0q83TMeTRKH
eL0EReOSEi6CEsxFXcHiwqeNxGsOK2m4pgLjwCgLIiV3N2GFtPe5GkNqj/cd1LALj5Lma+bJwnjD
cL9zAZYxlkAsPVkGejitGbh3Ya9bmuhgwMJ8weJ44niXdHb1auQqNNFguT9+ejp+2z7u9hH7e/8I
fgcBi0DR8wAPzjURv9iiH3id2721ThmIYlhFZdXigq7EUIxo8HdXE63JIiQ50KnLIJWJxWR72H+Z
sjbuCvYGRGhx0PWoJRw24YQQPnZJZAzekbc9alklCUQZJYFhQBAgTgStPjFtY+Yh9NCc+Cdfs7yO
iSYYKPOEU9IEQo53LBKejY5Bs31+JNz2K0pWSK4cpwSHX6BMFTEnjhOW546v1oYkyzsGQYCj3SBE
4KIUUoOn4pgB605BAJRkJAUNVpVIEwhxVOVyFmLPlW06aoGxENg1B2FktTw+7fan09MxOv/4br1p
x91pFy1nq3o2v7rqu4NYCsxpfSe5ZnoJ9jRd9siWSSaMh8igjvUCjZ4NMh62p1PEecQfT+fj8w7T
Ku5YbVtjKHgBIpIks0DfDj6budsaoACjEZCeAGHM125YFp5rt3fSuE63nVOp8tKdCASGs6ur4DEC
1Pz1JOrab+V15+wBxJYzJytk/ZulxMgsyA+QNVWCoZZ1rDY/5Ydakljc1WnpmkSaxyZ/1G5mvP/w
/PkzhFzR0/fBRr6t8rKuSlHUVWHtbQy2nbJyeAy7YRnMrKNAa2s9u+DpDAzcoi6JtJfj2h53Xw7n
/Q5RLz/uv0N7UM/jlVBJ1HJg7A2LiKRLe1SXQqzGpxPkwaQGajghELg4yR9siCk58NohSNPAInOe
pkgoRGVyiuh6vuC6FklSa0/71CnRSyZx20EFp87kwZRWGVNoHY0fg1bYcXtSTRYw6QyMUeZId2NZ
7HDol/jKxbVdqksnUrF++WF72n+Mvlpz+P349OnwYFMJnQggWb1ismBZWBdf6maosH+yrZ1fjGoB
/DHmiLfxSVSOvsfVgFleOGdA6PVSjB5J2I9oqKriEkWT/gyb+qYHJWmXJc2yi5Q87BQ0aNxBiJAu
Dobm9q7OuVJgGPvIq+Y5mo1w06oASYrB5uYLkYVJtOR5S7dC/y9ItUBBCmWrCBpyR+5V4ZiEqrBZ
bdBuvDD8pqvBGUFJNxnc2BAhhbPt05hhY3kXbtrDjViz/+53z+fth4e9uXOIjAN4dlTKghdJrvHw
eRFFo2McZ06Cn4WKtE1y43FtkiChCNR2q6jkpaMMGnDu+y3QN3bt2rupeZtF5ftvT8cfUb593H7e
fwtqSvBWtA1BHAAoIPDcAey7OKrMQI+U2ugOY0dfDbxYOszZddKQYuSA8mizjo7OK4QGX88PEVYq
D/TScjSHWQFr4GzFsbx9dfXmpuMQaF2rcr098RMtDfR9KUTmkr1fVKGA5P11IjJHg7832kZ4OeUW
1mlimGE5cFOHpJhGdTIOces9o3VaeVxKJJxp8IkpuNSeN8wkurKjfGyrojGBwwq6zIlcuTIzLRad
n8Rch5fhBU6KasiRhdUCLL9mhdGF7Skq9ud/no5fg94FSMfK7dZ+g/9GUk8xbPwvOBr5ANI06TVV
MOTdJNJpiF+gKVPhNjRADDgnmsOyNUajlA06UhDElCLj9H6AyHkqiR6Rww5B5MSpGk5oOQCA6vYZ
v2Le9UADascJB3w5Da0nhkgCb1fcexcHONgIbkWgzz+UNo+DFzLhBEWJaQhMOYFuFWCmQ0wForJw
L7DMdx0vaTkYDMGY9Aon/RoCSWQZGMUIbMnLIeN4maJyZnkV8qUtRa2rAnwab4q5WU+fs3dyjwVA
xYqzkADaDtea+ztaxeNBEJ6IagToJ6T8rbGS0/MDQSA7YWbZiaCCDm0JYkeLLkYn09LRMgTGJQXA
ktyNzmrXM+yD0lLch30PGAf+TDuRCky8o6HVwr2oaa1Ei799sXv+cNi98HvP49cqmEuFHbvxZXF9
0wg0Zq3C+XBDZHOreMzrOJjawrXfeGfeQuyh91hkgBghTHqiHRXoKDq98TcXdh4nnfPyxhV2AHE3
tLB9dPLhrxhke6pfxfWgW4DUN16SHaFFbOPcmOn7kg2Q47MIQO+ctJAwqdFYJUZzaJTVaP6gxvES
MHR4bXuz76NmjT4Y9D4tGCXPVV6v55O8YulNnd1NMNlgwYaHlHpP4CXkrcyWmdtp63GVmpaDc2pg
gwNsYcPDANRYegJDUnQqJpReqUsseIF4JLn3VJppWy7vTSwKRjEvPT8HKBKead8V7IBBXWBD0qfj
Hl0PcIDP++NU+U/f0ciZ6VHwF8QlqxAqITnP7uuF5HHKwjNsWuP1ZPhWDC8gisJ4eCHeJfYSdHA3
3ICh85itPXAn1kNQa75H8HEn4OxXecoKH9bks30gzMJbN4KwsCi4lLFRQZhYvAUd6sPeVcKNFBEk
GVbBhGAjx8TOFvMcEyzHhLUK1fcgKnELfBpAcAj0ziYHsC7UFBtKKTb33mbE4JmHdmIKntzFYThM
dgTvpHHTiYc5JRsTJZ6i3dO3D4fH/cfo2xNeh59CJ2SDye2+xKxtet4eP+/PJzcP5LXRRKZMT4t/
gLZIBtQXaEEj5Wq0Hgh3d1/205PKTTEYhopoYX4+MUtvvftwNcsldeP5qIpN+sprNVJjvPzfX9Bi
CTo4khgl/8qX0kYODSasXqwstk3HWmMA7w/dCIGiOoaa0zOeV9P9hLeeBDszOg9aDLpC6PT6/Om6
/AYkL0OGuq1ru8D8Znf+vvm1/el34cZncsf8mwnm30wx/2aojhqO3UyrtUCzy60Gw41YPvCKb36B
pZc4FhToIGM6i+ss0MLqnA0tR4MYGxBbMzToqqEGLFsMjWmDAwSWIlZ63AxRyOuhy+KhCxIyDA7J
X1fz+jrYN8mF6x65GFkG4X7M6yFugprIIZky5Q5Jl0gao8qVHqrXMZHS4WmvM1JM9AsrlazMgsU7
PVVcuLm0wYxrPdG3ZDGXbKICyp12MeFcuNybsHkOyZSpA9e9FaFeX8V05KYjqPXS7VUeACJKeXya
0kZNRzUSzW0JwmgUg7yeAE+10YmktVcd7WHaVv3l39RU+4U0xRfL7e6rV7badhzuc9DKaaSoK234
VceLFD1QWughoskZ2GSOibYwQ+Dleqbo1JLMJqrXJlpM1AUb+vEMprA47kBC7IiDjIuMQ/EtRK5u
cSt8gTKFppjL8XKriKHyvtRiopdB4Ei0X8+kc4gFecjwIwoOPvPaQuApyLCDhZzf/PUqyORsrkN9
e5om9dRlPtadI9XB0xwEqBCiHBZJWzwqrEbxT9VktRYq6POYu2hzppW32AYUaGFGBFMxc0r1e1id
rt1VOYjcQ8SMeoGh/W7SWz04y6j3MXe3iGQrt4N1TcoyYz6Yl3FcDj5rVlDiydZm/jqw0oyUjlop
l2IQjd1k4q4koVsmzhjDVb/2nb8OWhdZ84epWOQ5K2DaFztqnDlHeggdD2HP3lQ9cExD9VtxobD2
VWRrl/MLEHeCF1vrEKz9c+2JpIPOQqLjEMRETzQtQuklB583LzECfXaPRCZwQYyp83TngjUla3XH
dfAtzrq/uuiL79ybiyDnO4oMTvIinHRZc6m5cAcIIwLp/zbdMxy/FZUy83NMBlKnyruDMjA8gOHr
QmxWKC/Zv1ThonAjhYaBcConKbJrkGGFse6AqqF5J7XnzOJ3rfKwaBukrkKH0UycKvfyA75qwXIs
Saoxnoez1GNl6TBLJuYNips92vj1+U0Fukk3yomaWYfGpiNDSXmj//DFgbqv/dLexbvhDQ3WWdin
dP59Z3Ten/y3NmZeK23zap3HMiIfINx7U2e/SS5JzEP2l/p+M3zipUuYGYBb0NC1OmJS5zkafr+d
vbl+064SAFG8//uw20fx8fC3LZp1iNfUraI0kM0IpLIRyOatvBlSktF6wTXepATPAxIlGdsEVp5K
6psFv+f6Ipb++We4uA+xPOH4b7CCG/F5aCMMsC4zorEWf7JvS6bhf682rzeTZOotwcrBiQkokTSF
Fd2GqZJHB6xX/rTd+dkxbLDk17NZ6BbUTImW89ezjSu5gR79Do2mbx6dhNMBASlyLFEo8iQJnEzp
+qktZJAr6MHm9SSoeze732EH1khuVm6Fn9ykK6/RinqFupKRvDYPJh17jYkWWXl5gzuIKTPveoEm
KfoMjrduHZGZeX2LVfKe7DTUyEyWgVmU9R2RBWxvyI/vqCmTuquZrkVRBSYADse7CqZnXi3gPT1L
40VwbCygstV9lgiLDi4OzzZakp4WAmusOB13DBQw1SyrMiJBCoupR0wuPRY7bkzd9cRrqJ5jNtgq
f9Jp47JcZKeMiVN5Pe7jDlYcMvrWP3T2uoWY0lBJAwgImHOsZZbeRZ2D7QqffoXq9sW3A9Y+7x/q
L2dnCzrSnPnXIWOKjAVjxg7vvgsO9K7aMqap2MjvCJoU1aXhlCbmDsc8DcRHS32p5x0HmHv2kMT2
aophb//qXYoVd627/QaNUVZ6BE1L7rzPQmP+phx+Nw7iMA54E3gW1+lJnvhWgicXifvLHb9NpUIR
BWXl0s/JtBAsXND6vs+gDPF43N2AZOKma+I5viLgxAZfU2MaPHGrjkf30S3Ev8COFbhsTRlfAwJf
zigOT+oSwjMxNV+ml1qIrHXTR/ctI5emXxGlRI7vmU258mHXtIjEsMKtsvXUS5aVro3wwGBB9NL7
KYS1zkv/LLWwOsdb2GB2gxQxyYSbO4EtNsMkXOZgL5j9QYbWI0gOx2//bI/76OFp+3F/dOo/70w5
tGfTWpCpR4zxoW2PtHq+HcRZSN8KC+p6JvR7FSKAHcyyYWQWaBKug248i+HiOm1AgB+YofAKZ1sD
b6qmXWw4eLd+jXnEFixJbdweyQZbiHA0701bOFo5SGq42gnJiLovaEtsfjoiVNLZPiIqq9bXcnQX
S71yXftd8zkdwZT7orGB5bmr89rG7k9DtI0pdXSMeQ+xBFkwgpL4e47IhBXUmgMW3L2JU2XEdvF8
ij6aY+ocs1xstJ8SypccA7hg924XnV4UoHKaatru+Ahaj36WonDduNx/kgufZufGF7nl9ng+4Cqi
79vjaaBbsBmRf5r3bxNl/UDRvNoZUzk0IrFob4Z4qWEeC19A2VsP/O0TU71/+3I22UFdFc1rPvcR
y5gMH8uIIrt3Y4YxGwwfKvgzym3tgXlXqY/bx9ODuQ6Isu2PAL+EKKeYYJ4RossL8mfzGq3KkyT/
Q4r8j+Rhe/oS7b4cvkcfh9GrYXXCh9v6lsWMTp1BJIBzOPx5l6Yrk9wS5j2UGiMLoe78HGiLWYDC
vtfgmQN+WiqAMPtVwpSJnGkZujlDEjzJC1KswGeK9bKe+ZMdYOcXsa/GC+WzAGw+XLgI5u47+kJD
ILXRAR7nsRofRsSAZQylQFt0pXk2EGOSDwBiACALxQrtCvYFybLPLrbfv2MqpwHimwxLtd3hM7eB
+Al0njbti4GB0JTLe5WPJaYBXyp8cslEuGrVJUGP1xTJTJ2zjGjLq/4ZwU+WaX+TY//w6eXu6fG8
NTVH0FWjjZ3D6E0Inw0lWbhiy8geXZbz69X89Y3PKaX0/PVgc1XWTtlbMQCnOtfxUCDgu9ZCk8xG
Hu5rkwbLpHmDhtjZ/K/Gtzycvr4Ujy8p8mMqd2aWK2jq3v5TfLZoHsDezl6Nodo8uWl/0eSnvLVJ
SnAW/UERMngdaY5jwRATBNon2ff2+XCYYvSTOS5S6JEQt6j5BnVpOr0rhopRCjoPk6G5/4QoTICv
IIYn/a4eL89tCmzujMf2nz/Aam0fHvYPhoHRJ3vYgdvHJ4AO99H0k2+Gy7eM8aLJDtymBod8sbsD
bm9Bp+yPISEgdybtaJXO4bQbniVDhv9TPJyA7IhirlaiwF8XmxgRPMaWe33WGgXLjJmVqDn+x/47
j0qaR9/sI6OgyTVkPkfe8SIRnU3thvh5x/5izDRFOB5EfLUIVawjZnkP4cjCzZrF2tlM4UXu4HpV
BdcTP573/5w9y3bcOo6/kuXM4vbVW6rFLFiUqkqxXhZVVXI2Or6Jp+MzvnGO7dud+fshSD1IClT1
9CKPAkCQFEkQBAGQYyGKDlzLVQZDRtriAUfd1fvPGiB9qEiZaw0Q4lkzLHKYpqDXBz1yqwanLn7Y
uoBypAb5SQQc9TUYHKULoucjIy2YwFY6bnUps0/sr58/X98+1BQaGnyemGslnu+prG7ZUOTMLy6O
p+3mJA29sB/SpsY+Lz+rlQ9jx5dbXsp2vscCx0VK8JVU1OwMhk/+MfRTE2lStkscj+iWhZwV3s5x
fOx2WKA8Jax/6kzHMWGIIPYnN44dlf+EEdXvHMwUfypp5Iea0pQyN0qwOAKYU7xfXJI1/pgnSGmF
tqf1kECjH1h6yJTp1VwaUqnzjXpq0oks40uz/PQ+D/j0ZQV8IJ2nXYgvYOyGf8QW2ZGoAXQjuCR9
lMQhwm7n0x53Y5sJ+j7AvBtHPNdWh2R3ajLWr6rNMtdxAlX2GH2WOQiffj2+j7kl/hSZYd6/P77x
zfcDDjFA9+mFb8afvvFJ//wT/qvm3xuYpkf+G8yw5aOf5jWMPPsrNg9+PiKgJDfFakXnPz74Xsdl
Dhe3b08vIv3qu7LARx6XurGetbdYzJ+bnmpNi1TFg1QZKcsnRWY14QAJge8qC6yAYoJcGUrEhbAR
t72vq9RmrhYCB8XAXc/xbNgKl1l5fyZFbsvhJuLpMmLZmAkFJx6L97gVdeltGFDOLOanPWmzc4of
Jo+WAEzePpbh5mDeL9BV68Ji7DrjDeTw4SJGRiRntZS+ZB1+dzF6a1QWj/uqKNHAdPAukzY3TfoL
sHXUAWuLuZM2fclxbXF+5kv9+Y+/YF2wfz5/fP3+iSipL7Qj0eTk+C8WmZcXJBBZhW9fsiqtW77+
CQX9nZ4QqdAxmwl/Kl2SL1pckoLiM73qcoIj1UsvFX5u61b39ROQodonCXrVrRSW2WFrTXneB7iP
4J5CgJNlZsi0U6aOs65wVMjRnlByydWsTipKpDzQennM+AEln0cKFzkVHk+0MM6+jLmAF3EjIEPV
ML48K8KrgfsAs+NrTse6PhZ4x05ncs1yFJUnXEXrcRQYblBMSbguWmgxjuWlxH1b1GK8DKnqXitX
9PzIRm2pIzn6cL3BNaetHm95x5IkxJ15JYqzxfwFDab1amQq6iWfI9zBhCN7L+DYGzNecGZ87qBf
tiKdHZd1bV3VJT7GlWb+5BOzB7fV/88ESvydptvymV1j7oRKkYZrKZBkDm0RbJvgbafyvKckdhxn
EE4omCcaBR3OiJKdsW15sxMt7ycjDG1QCy6ALYpipGRn3UeY9cd9NhgbFVIyy+5xlnVBWn5KbPHx
YjUFc3ePi3jWiXmitacrwV/8doMeqrrh4lA7cFzp0BdHPPpYKXvJNRHHfw7gvELzDrM/KwWv+RfD
v1dChmtoy8Q2E+BJ1xTm8qijMh8PP6TP7ZNlpCkKrp7ZaJrTQ5Hj+RalWAGBsduFlhS/IPKQDL3y
9ogyzEQ6XaqssUqrGkuOXMMBXzA8vb5//Pb+/O3pE7gTjHqzoHp6+gZPL7y+CczktEi+Pf6EMK6V
Sn41oncmB6jhinqRAPmsAqRllyleVxqu07WU7rSRQxOw4Co0mk3kFTMA7C5GvMgOv3bmmOgOz9rF
Ua6Dl7rSyo963IMPirmY97He4VLdNlUUru34aF0cLk/WOLalJbPNakAe8LWutobmjNZ4Q42t30S1
LNc2XHgAwnKN1YTB6HJ9ozWITsGXZtZ2BB/3CTl0fG6AIwO+Qq+QlAozy2h1Q8iMdQajusA1L6iL
7GRI+ZaMuQiWfazzelToacUy0OiNctckuVWMaYoA/znsUBdRtRDTneOukHL0RpFOq+ZauJ5F5QKU
ZT1xVGJFmToh0oYvD6m61asocZLJKl1lX3z4rjZTOhxAB5g0K0F7fS5Jz/9+e3p5en//tH97ffz2
B+S4XIyi0sb2Q6RxU6Xxxytn8zRyAASyI9xkr3ybG2Ez2FFYwR7IXVbgm55CRbokag+ej2/eCmHJ
qYLPwU06Sr3Qu0lF0kPsBd7NSmnrOfimrFDZh1nakzaw2z5pOUvXb1rkP37+9WG1eBkeiuKn8NA0
YYcDGPl112OJgbgGLUmEBMvnX+6M+2WJK0nX5j3gVs0FB44XmGC4e/lYvobEkZY4FEnyuX7AQ1Ak
OrsYro8T2NABlE9ou2iVJe+yh31NWu2mYYLx6dOEoS4jbUQ7pMkLSXe3x2u471zHkkBYo7HEISg0
nms5Ss406RiX1EZJuE1Z3PH2bpPA9eVtCjHJLBFwM2FHSRS4uA1fJUoC98ZQyPl5o29l4nu4kqTR
+DdouHyN/XB3g4ji6sZC0LSuZzEuTDRVdu1q3D4600CgHGxxN6o71kV6yNlpdGrbJmZdfSVXgquM
C9W5ujlZ+GHTkmRlJsnvWeTdGLqaCx7cmLdMk9IbuvpMTxyyTdl3N5tNSeO6Fo1iGcHubmjgdsMm
soTQU+614efQMA8BDaQwHpyZMfsHW+7hiaKojzn/13LaW+j4iZ40kHbyX6UbWGnc7axo6UOjX0Iv
KJHXSrzqgncsK0C1QuM7lbZkcITQ/CiWCsRw5xb2B3icbpM/PxTKJweM0jKCGZhvfKg9LcNdjCWe
kXj6QBqy5g2dhnu4Dc4X1vc97rcm8KP/iFFqGbRt7gsdHjYwb8ZsTEM/wifIQCoiM3+tEL620y3w
FDvZzGha73Wz/4w5HjzskLzgW/0spSEGiwf3QnTO+Q5V1rjFfSYT51RiyQoyU7E8za55lVr0vJmu
K1N8cJb6RFLybZorvN2Cvqcxk5TkKKzkyDiJdOB1u7eh9kQ/Pi9YCCq82cNrnn6uMTPfTPLllFWn
M8GmEAsdNVhqRoByaHjsz7i+seTEnCkaBjRWY/FC17eYNJ/xB5aTaG/qzSJTkCaEJAQW2MC/J7U0
T6XKG35Ev0V1IhU/suEWL4XsDnIX3SJqsiNh5r29TibFI59stC7xzXfsP0hKRtsss1xQy80wZ9i3
bcs8WN2+C6BNjAmkbSglssQEm0AdHMW7coKIntYG3EtH3wmTXp2fI8QzIb6zggQmJFxDwsm/5vT4
9k2EsOS/15/g/Ke5SmmNFT/hb/21GAku8r2mb0hoS64maLz0RYg5CDKbrgq0FKMmDVahPBCo8LPR
iyMpM+OBnBEyVIwfsrQL0wlTGLNytIBgH29xSUHO1vK4+v3x7fErWLRXzmldp/nAXbCrI8hEvkuG
pntQ3zYUhlcrcHy70wtnF+JCpL+FF+4g0GmaDezp7fnxZe07OS5Q4UdI1av4EZF4uvPZDFTex1sH
J6h0bhSGDhkuhIMqPd2GSnaATRLbqlUiKr1AbDzKDCLN0aetFKqqHc4ikiXAsC08Y1pmMwlakUhT
b3s6TCUkrIEnOC/A7SZxiqdZ0FrXeUmCnylGMgjhQRIESA/L1x+/ARsOEbNBGATX/lCSET+i+q6z
HnwJ71dw6GKheXIbCGX0LATzyLgGhe5YrgCtPFl+0F6U08D2UpRWfWMBb5Ryo5zFfY/Myxln3YtW
hLZ9aSQcxeznjhzNWYUSAtGqyQoOBlS86rJaDyrRnpxT8QyB64ae49haJWjp2ldLJ84PfdRHDvK5
xovShg23VgxpNz/ngRVD0dxiIqjyCrJ/3CKlcEEuoj/zY065bEWfohuXCJdDX1xfOpzOkRWaADZL
0K4tVqeyEVlBnAaE57ZYtpDZKiO3GAQ6eokjwrMajsxidj7DZXVnyaUv3/m1PckwPj6nJb0+XSjy
buPYQQiZXTmALhvn+AYnUtPooof0LG/K+cVwpODpunqRcAbJ5zbzWnNvX7B7EvjaU3MLSjZnq7qB
8oHWfTt453lNSCGOuDOe8uwo/9PgI8aXTvFgc6NdayaKvjv2uj2zTjyQIQOk1wZxLsDWVwlqKDD/
MQi7FkReaKPBEevAMhUpXoC86KzKcz+pL+VfLx/PP1+efvEeQDtEEBTiSgzFSLuX2iJnyk/n/Lhp
qZTzNwJpFqis2wAXHQ18J1ojGkp2YeDaEL/MbyFQeQWLHj/ujDRthp/UAC8eHcG4GDzKoqdNoXk3
b35NvZYxph7USUsdwr43jRNwIy9/f317/vj+57s2TcRTOXvtDYcR2NADBiRqkw3Gc2Wzog5B2cuE
WCaseGX80x8Qsj0GFf7Hn6/vHy//++npzz+evoFbyu8j1W9cPYJow/80ZxTlPbTfWcjBgPw3IkkC
pn0plOsJJ+aqzMYikw2p50UguMvKRn0uCmC1sNfrMP7J1AgwdYzyssuMhTp7Mo2PlXHh8INvUBz1
Ox9S/r0eR++c1ZkBSnekZgOXXFP5+uO7nExjYeWDqzfL1iHTPyfrzpZLYUAWxOJ2LkdCvBlpc+Jc
SGCS3SCxBiUoklAp52PGCT2SosnNlFEAmqPMVVg2f1tQCMvH9zHh9RgsuL6ShFJSDdM5gWca/Msl
Ya6m9wAYX497YvgaNjkWKqjhl+mO93gAdRm0Ktl7rax1HQESFDKr/svxNZ95eYVrJYAHt0oz5FAj
4Gp2krPIwW/1BYU4Ilj6NYZjagV68Cmy0K/dBQH65aG6L5vheI877IhBK1Nt+BWJjWx7omn6E1Rz
0ebt9eP16+vLOIWMCcP/GHfiAJ2SWw6WcESg6Yos8nrHLLpaneq0MSMQWaP6F5+Y/kPTJaRNi+VG
vOwCfnmGeKeld8AA1IqFZaNfj/Gf1lRJVdeM5NKBsmFTBWsVCPjQIgfH5juhOpqVjEhhmEHqUkjG
zWGu8+/iNdOP17fV3tZ0DW/R69f/waYDvJbjhknC2RpPaapeQaPDKbhd2B7SmbyFuHDn28E3kXqD
7xGi4ve/aU6kq/bM3ZMaijIMeaVpV0DA/6ecXcaUNCuElMoLw6XDEjQQ5scevrQnkpTsnGibBJIV
+szB3QUmIngZFT3jzgS9Gzo91krWlQfchjO3gPRxHHmY39tE0t4lTohxr2lWoEGuEwGfE6eKHNWV
AfNOS/M1ArhawjpILzXmKA3d+SHg+mCoMlORvL03HRTluFkFv1CARPZe7HgLyFUeAAEVThTOckaQ
Udx/Pv78yZU6UdtKdRHl4qDvjdxEMleFsXnKQ4QZpCOg6VWmlNb7cOjgH8fFxk3tBxqnLwna7a90
Kq640VFg4RKfXjAZI7/XPolY3K8qLbPqi+vFtmKMlCRMPT5/6v3Z+A4sr3sT9MCoakgWwHkf1L53
mQ6HMXBMf0cUG8NZpRfQp18/ueBaj+3odLXq4wiH2Wn/fiStsGQFcmSug6aEKzPQwaCe2dsRakaZ
y3sNOCb6uExYCCxuXCPBIQnjDQ5dk1MvcQ0WikJrfFa5pA7p+nPrfPdp7CYe5gksFwoXt6FnfArz
QCMnb+PvAn8FTGJ/PWMBHEZYIPj8qUF8IiMQR6GzYrfyMNI/HONlkshgJsCem2DgJDIHX4B3rvkh
uvuyX3O+FpETmI2/lslupwWTI4MzK32ba4TLPzcK1h/Hd3cuOmsddy0zqO8niVXQNTmrWWsKgZa4
gWMOsZJ7bTKVrjugr/Hjsc2ORDsnj6zo3Vkx31+1dl9dMBSutCH3t38+j4fRRUNWC025zZkXoIkS
VBL3WqrVTwh9p1zg7JirHUeaojaRvTz+Q71T5HyEtj1A2Kder4QzzYQ5g6EnTmhDJFaESMkGxwLj
qy40LpbcQucSWdh7Po4wtBytjI8GBmgU5gxQULiLpk6DRjgoFKF6EaYi4sSxIVxLRzMnsGHcGJkm
43SY1bv6Coa6i3bGETGMtMH9bWQJSOeCqosCC/mKCz19iwLfCJ/SyE5XPOimSYkkXDrOBU6y88IZ
vNi+IaWlgCKM4KB3FA96NqETaYO+Jx1fag8DoV2yC0LcUX8iolfPcbF9ZSKAEdRvrlQMKhA1AmXw
Nbi3hrO9mm977KAGlCG1BnAqvr/34l4NpzYQZiYPE31KcU3JpEu74czHsYOnQC+YHWTuJ1cFVKcW
Fa7npJkwfC64sWMJ5zCI8COdRuS5lmT447flOhSfPBa5MBGJ+Ykm8ZkoQDnx4vXQmbd7C0cxipu1
Fp0fhVgeIqVZbhDGSLVp1gmbsiSJ1CR3SuFJMUIxOx/FcIUkWSP4vAjcsMcRXoi0EBCxH6KI0MYq
TPQI8XmBlHs/wM4yE4HU53ZIZ0eVLl5P0SM5HzO4/vF2ASpcpuvWjenfdqHjIx+y7bhUQjp/psx1
HA/pfLrb7VTPLyFdjZ/DJU9N0Ggal4dz6RDy+MEPV5hX0JhKKo19V6lJgQeulp5Jw2C75kJQuo7n
YjwBEdoQkQ2xsyB8Sx2uukgUxM4LkDRbJO3i3sXzbHGUj571VYrAXjhwLa+8qTQRpnJqFLGl2YGe
8WpGMT/ebDSj/OzkokX7fDjA0yZ11bU1dum4MAG/J6RdXd8g40L5XyRvQVOpsYpTFlnC9RYKN/Iw
ATkTiF2Gfxi6rv7Aj7BOeMBqBlTiHTAb8UIS+nHI1myPjGIsS+r6ceJDUza4HovQTViJMeAoz2Ho
lcNEwXUUgjSIDyzKUN5A4q63E9EpP0UuqnFPFHmXxBj7z9SyO08EXKtrXQ81dy65x6qMHLN1nxBr
5owS8hpdBBIVbzhl6XR2nyyFbrc9RcF7wEU3cZXCc20NDjxvSxYICmtvA88S4KfTbAsk0CBcd6sH
QBE5ESLFBcZFhLVARAmO2CGyWlgqYs+zYXxU4EIOwMgSLKfR+FgwpkYR4FVHhmlJQ+0wlURv9w6R
4yVtfHS37GgUWjZgagk6m0e6jDD1dUFjGwqH+ujUKmM8HFQhiG8RbOkLRZmgzUkszUmw05uCRiZU
UWKfnkORceZQH4WGno+Oh0AFm6teUCBLpqFJ7EdI0wAReEhPqo5KY1DOpHVs1ZyKdnyxbY0/UMQx
0hyO4Adc5JtUDS3jvsfaeUjCnTJ7m1JLhzvT4WDQ1jxcidlnxdAccBfTcTPalwM9HBqEb16x5twO
ecNQbOuHHq7/cFTiRFi83kLRsDBwkAWbsyJK+MaPTR6PHzsjdPLAtrK9PDrqJ65N3joRorxLgYu1
kWM8J/YxOSQwIfpVpPTaXHdAEgSYfg3HyEi/r5lnRZ/xHWNLKeAHtoCf/FGdhuNCP4q3hPmZpjvH
QRoFCM9BhXmfNpm7uQ9/KSIXL9tcS1PLMijYqcO3f47Y1G453v+17ggHU2Sc0zLj2yQyFTOum2oW
egXhuQ4qcjkqAqvZppBnJaNBXG52YSTBpK7E7X1MHWBdx+TMXBUqI0wT4Tuk6yVp4qKzjqQsNu6z
cJp4qzOEf5QE27fzingOogUB3AwgmDG+tzn4HY2RZd6dSoolju7KxnXwJQMY3PqlkWzJI06Aij+A
o3pM2YQuOq8unett6prXxI9j/4iVBVTiYt7yKsXORU6oAuHZEGhLBWZL/HGCggvIDtltJCqqbN2I
vPh02GbNSbKT4iUjFAA9Jn0EYe+WGRSsI10OkapsxZCv9Kw9ZhUEnoEZvj7AU3MFeRhK9l/OujKb
0X/C6/nvJyi8BgGxo0PX5pZHFyfS6Q3DY33h7c6a4ZqjCWcx+gOYG8QjU1gjVEqR900ENW+wXrFE
8HMTsRqBADwxxV+bvb7ZJnjJa5kDIzDNLoc2u9+aHFl5LsRTn5vVg98MSjBduk+USMuk7xXWhiuB
N6Zr1MwCkcY1Y/leC71ie+3H9MyZftO6pyVBCgNYs+ICGSSOg0yYmAkX8FMFkPiSltWqvNIAK4vR
9XcJafjvv358Fa9UrdIzTl/1sHpWhUOmuywDyvxYeyZ0hOkKEqQbke4wFpOaKEY6L4mdlR+1SgK5
BeXDydr7RjPqVFDV2AYIkfDC0fc5AU93YeyWVzy3k2DZN55jD6IDkhKiVrCUF6LH4vZJ9TqcgKp3
CrAZDYWa37YCN27NZgwm/ydkhFQR+QgbN8TUXUAeSZeBi+ZkVVT7TV1fu+hTgOtuTAgtcEcgGi8S
xnStUac84vu2LUcNVy+HhrCcKiojwDhzzcEHOMkcPTrMdAQCWJI0/MjvYMDQbJ0AR+hTF3JGmJdi
I9TwDlqgIQpVXXQWqGoImKFJsIYmO2fdBLjkNrsj79QwS9GCTQxOXaSZCCbYLl4xz6qD5+5LbByz
LyJUqTHLUABamtNm3Vmvd7o/VRbZCBnN7osMmuAWaSn4T/dlWotaGnYhar8Q2Lv/o+zKmhvHkfRf
0dNMT+xONO/jYR8gkpLY4lUkJcv1ovC41FOOcVkVtmuma3/9ZoIXjoTc+1DdVn6JgwkgkbgyIyvS
klR+H5BnUoh2WaL5juD03AuD0y0F2JW+pWhbTtKd6yCyv4+gL1ILR7Y++ZalVYKt8fn1zQrgtbVp
OoEfT4+v18vz5fH99fry9Pi2Gq615ZNLPSosLWdRtaqETS84prtZf74YqarTpVBJKD2+c3Bd/3Tu
u4Q+DkG2+WaglBiP2UkPpGPORXlQkzSsKBl1yRhPfm3Ll+al4ZyY3H8YoFBRZvpFwYUaWwRVOmqe
aj1deNTJvriYFTKJCOpwA1EW9nAF0TTB6DcURao+XcyINsMAAvpbvnnV3xWe5Rp783jlkbB00GNr
6JIjtChd33BZg1cjcf0oNk0N6s1LnqFwlCQbH23+ua7YTetj4qGf9PBPKSNP3hgaqa5927AZWUxn
UBOLbxkG8sgwXB8VFWO9K4f7u7pFNmFg8pjG2JLcUbpg16O9oOpGfPWgfX2Sxq6nnFeIr1RNBvKU
MwbLKZiy2T0Tje97Fo5NfkIHHXXRS8eLCwM+6j4MDgC6g/K6Z+HCFRlfkM18N0sFw2Ur3RKWINn+
WSA0+yNRC8jQuCIgasdS343pPS2BiS8fblZbX00s2GTbf1CK+b64wnMipaOa8TIi2vIyEhhqPZji
N2sDLI5NtgdHbArZsMp3fZ9sKo5FEZmjvHxd6HlXxK5FZocHC05oMwoDFRnI1+cFbNJ2HzQYzr4h
vburMNGH/CJTFBq8dMpMLqW1ZRZatNo0KUDDfGCCgjCgIH0FIWN+FNDSvfGCS2WST40lNAo82kes
wmU425e5YBXyZ7jI+HoKDz3OOBS6RiiObskqoqLsqUzyBqyCRhZlXqtMDt3Q47JYcyMncYTkykPm
iWJaOEljQ1PTWON7tqkjNVFkcBQsMwUfjayy+RTGH/VIWDrSGg0RxyR9wPzbKn1ek2oIPm3yTGNA
XX+SLPqtXZ1pc/ic2fSs2hxBGQdmiNbUHIppSHwEspD5XfzxxTPxHRxGt4pH2l/uwjmtcnUALDKS
ri2lF6xzyoaRIU5lno7uFp1fRmFANmxXbDHgDimixUKkqgRLZSugdvIknsjxSEOAQ2FF543Hwjb0
5JuZU8tBGXXc4PZAGpZ9DqkM9eWjikWkjhKWkoZq+bb70SQ8rTw/rr20slQx74ZwfEUX0UzSWlPC
ptWjborLD8kXQF9aSRisfG7Whw+9gq3ztXCo0CbKchQIQ1yD8XeRt/IDimbDaRhLNDM0A3oWSQBu
6ZMtjh8xtCh1rpOpNUJKVfcYVkZes2IMGY4anKQtDPhAhw5UOPCMuJ77CMD6qaC9gE1s67Q9cv9B
XVZkyRz+t7x8eXqYVnXvP7+LD9vG6rGSh5adayChgwvpc380MaCfth7WbWaOlmHMLAPYpa0Jml5v
m3D+UkkU3Py4WftkQRSP11ciVMcxTzMe10stBH7gHexCfDuVHteLASMVKmXOCz0+fblcveLp5ccf
q+t3XGK/qaUevUIYogtN3gwS6NjYGTS27PRlYGDp8cZrsYFnWIuXecUjFVVbchjwkjYF63YYsuSc
wF/CWfWA3lUwxkQpUF8ryX52q6PJQhU3SpkSsJbDGJ/1n0/vD8+r/ijkPH82NlhZGkwcBOkYgzwZ
O4FMWYMRsP7HDkRoiljGBSnH3kOU+w3rYCjmdQWrQIyMSx68IvOhyOZTSyGArPZN4pDWd5mHgTbV
lmpTbP71YeMoCm6hE32R08usrMVbfEKKkhWwxpW6xjJ0ibBEQx+85fpo7Mn8bYPpK0avdUqawf8B
namHDiNLB/5RUX6FxiAqP6KorG5+mlcMWokoQFVPoruFgfTw8vj0/Pzw+pM4nh50cd8z7sdh8NHQ
cn8CA+/q4cf79e9v/Lzg8mX1j5+rvzKgDAQ957+qOihvR23Ds2Y/vjxdQYM+XvFV+H+vvr9eHy9v
b+gfB93YfHv6Q6rdkEV/ZIdU3FYZySkLPdfR2wqAOPIo827EM4w442sqkNPFY8WxP3SNqxgnY0/r
XJe8SzXBviveCl6oheswrfDi6DoWyxPHXavYIWW26xFfCqZRaLi+vTCQ9+FHpd84YVc2J7XArq7u
z+t+cx6wuYf9uebjLd2m3cyoNmjHWDD5+BhzltiX+U3MQp+P8NWP8dsG3CUnstCLKAN3wQPLoxMC
gGbXzcQR1VQjoCZWuNZ9ZNN7BTPuU9ssMxoEalvuO8t2Qr1CZREF8D0BtZCYmym0bW08DGStz/Dt
udAjBD4hNwXXHxvf9vRckexrdQByaFnU2L9zIotaLExwHIvXYwWqJjik6l9/bE6u4xDaAObz2JH3
wIR+jMPjQRo9xKAI7ZCYepKT40fqG2rRLCIHzuXlRjHi0wOBHPl0v7XJ94YibkjoGuKRChwxte8z
4bEbxZo2ZPsosgk59bsuctT4wJKcZpkIcnr6Bkrs35dvl5f3FfoOJTTNoUkDD1a01IaGyDEqG6lI
PftlHvx1YHm8Ag9oUTwkm2qgqcvQd3adpoqNOQw3CtJ29f7jBeZwJVu0NvBBwNRu09UAhX+wIJ7e
Hi8wxb9crj/eVl8vz9/1/Gb5h64+uErfCWNivNBHneMXY6iQJk/HET7ZN+aqDI328O3y+gC5vcCM
pEdwGHtP0+cVLgELvUq73L+hXfMSJOapn8epMfF5JQ7bm5mFxByDdMMzxJnBvTlFIAN5mW2A66MT
eJpWQ6ofU9SIaDpOv1WETxYBVEJPcDp9sDEx4MO8mwx+cENDcVizw5AaE9TQEZ8izNTQ0aYmoJKf
GQYhKbMwNDjCmBgiZW7XGOLghlWLsE8WbLuRT58dj1NaFwSOec4s+7i0LE0onOxq+wtItm2Ku1Gu
lMxAbxkenywctk1t+M74cQgYpSc8Wob91IWDfg876qHWcq0mcbVWruq6smwSKv2yLoh1aZuypCRP
b0b8N9+rNLl1/j5gTM+N081TJ8Belmx1w97f+2u2UclZH2X7iColCd3SJadUWttyRVwATV9qTpO6
H1HmE9uHbmjWKeldHOrKF6niy+OZGlnh+ZiU4uwhVYpXc/P88PbVOE+keNynzWZ4ZynQ2hyP6b1A
LE3Oe3brpsyfigy2nR2ork0Fl2r6jDcs7xFjg69v4TOSU+pEkTX47W2P+o6XlEzZAD1UfFtyqOKP
t/frt6f/veB+EbcPtP0Dzo9Oyhvxlr6IwZrclkMRKWjkxLdA6a6elm9oG9E4El8MS2DG/DAwpeSg
fAdXgMsut8gzN4mpd6yTod6IBYYP5phrLLp3nICyUhQm2zV8GgYUtg1FnxLHki6DSZgvHQbKmGfE
ylMBCUX/Gjoa6nvwA5p4XhdZZmGgFRvQOyB6NzEEEBYZNwm060cNy5kcU504arjWqFeJmtdEtmwU
rKEosDENj0BEKUVR2wWQj/mYaKzTgcXSVC8Pb8f2jSMi72Pb4ABVZGtB+X9UC+gSrmW3G0P3Le3U
BhGLThw0fA0fK/napJSYqN3eLqv0uF5tXq8v75Bk9kzO7zC+vcPy/eH1y+qXt4d3WIE8vV/+tvpd
YJX257t+bUUxtek2ourz4oF8tGLrD2MiQG0qUWDbt1IFkinGjx1gvMm3RTk1itLOVR6PUgJ45J7H
/2sFkwasON8xJJIsCiHTtD3t1YImfZ04KbUDz6ud45DWalhFkWe4obbgev0B+3v35xouOTmeTd6v
nlH5Ag0vt3fJMYzY5wJa2g3kBhiIsdaW/s72DA+6pi7gGILRT/3KUnc/1PQ3eiXvSXSvNEkEJ2Yr
0iSCTWxZ5G2wKZUTKL3ymHX2KdazGlVLat/6tIFraD3KJF5KPcmlgroLpDtFSy8I1KoMZHqdunSP
G/KHXm24W8ur0sHEa04Ng9MytgO6BWd6jYd2kG9+zkOiX/1iHMJyvRswoEwlc1BTJiAKJ7zRXgNu
Hsp8KJA3fEatksotVgTe4JeT+HyP2ufnB7OnPrB0PQzDmXzjM41cV1wS8Orka2yack2TE40cIpmk
NmplgB6bm338wEjOi21iy9YGUpbYxnxwkLviDbChjWD14Fit3rZA92zywgjibV84kauJdSCbBMs1
fqSm+ZzaYAbgcXdNu8yf6yObQHMfT8bpyjhBodaJHGX8D2J1bJKqCXZQq6FWPus7KL66vr5/XTFY
KD89Prz8ur++Xh5eVv0y8H5N+Hya9kdjJaGjOpalaK669W1HndqRaIs7MkhcJ7Bi1TV7sU171yUf
Xgqwrwy0gRowlQzNp0iRj2HRTwbvm4fIdxyKdgYJqFUckaNHvkSfyuBCGI6tu/T/o9digy+xceBF
H+hbx+qkgmUb4y8f10bsXAm+fFAEww0az52jY0yXNoQMV9eX55+jNftrUxTqNwLJpDv4lAmfCROE
2v8XiK/Ih72LLJluyEybGqvfr6+DdaVZfW58uv9N6SPVeueo3QlpsUZr1LHHaY7aPfDZhGfRS78Z
v9HGA26yF3A/QhvsxbaLtoW5SI7fmORZvwZDm3TBOOqYIPD/kD8+Pzm+5R+VvoELOsdSTRfU/a4y
P+3q9tC5TBtcXVL3DvWUjyfKiqyaX6Ym12/fri/CA9Ffssq3HMf+m3hrirg2NCloy2x3NtIJj2kx
xjPtr9fnNwxoBB3w8nz9vnq5/Mc8vtNDWd6fN8o9IGkDTL8WwzPZvj58/4rvYrW7fKnopB9+8EOq
c7rOKWqnUNMGNNpJD5TJMe7Yt5SchS70Lis2hjheyLQvuzHKI5UpFFt2/bmvm7qot/fnNtt0ajEb
fuuPdB8icGFU0TMstNPzJm9LjB2nVbcxHPEjuM3KM3fTQVQVP8GEdckum0Op4aHheIq7AvVDH0di
qiEmKVhVgVrJIZxiYZNu4CYGDH+Hm4dxdKLSz7B6LiWEYzFVczAP2lLYeF4OdQWyWKXjNlN63hFE
JlPahIHavjvv0jInkOKYau0+Rt/dNgeDKBpWZcUyAb19f374uWoeXi7Pirg545lhnlnbQS8qtM4x
snSH7vzZsqBHln7jnyuwt/2YPvZaUq3r7LzL8Q2SE8bkvoHE2h9ty747lOeqCGRRDDyULAZk2MK+
WUBW5Ck771PX721J2c4cmyw/5dV5D5U456WzZuKjIYntHh0Gbe5hDna8NHcC5lopxZpjdPU9/C92
HTKvmSGPo8hOSJaqqgsMOGuF8eeEUSy/pfm56KE2ZWb56uJo5trn1TbNuwYdR+1TKw5T8sKNIO6M
pVi7ot9DtjvX9oI7slkWPih9l4JtHhuaiZXdAURXpLFFHokKmQLXGpZtn+hGQHjr+bJv1AWu8IJ+
EcEqa1eQ28ICa31kWHveo8X9dZIFFmlk16yLvMxO5yJJ8c/qAB2pJvnavMO4ALtz3eNr45jRH1B3
Kf6Drtg7fhSefbcnb6fOCeC/rKurPDkfjyfb2liuV1nk17Ssa9ZZ295jLMn6kOy6pM2yima9T3MY
j20ZhHZs01UVmNR7PDpvXa3rc7uGvpq6ZO2mLtIFqR2khq68MGXujpHLU4o3cH+zThY59iWu8oOa
ZVHErDP89Hwn24j77jQ3Y3SGWb6vz557d9zYW8OHgtXRnItP0A9auzuRR1cad2e54TFM7wwVm5g8
t7eLzDK0apf30Fj5CVbKYfhRuRIvLV+RJYqPJA/eXmXJyXM8tm9ucfiBz/YlxdE3eI/YcqIeBpnh
00Yezy37jN3+Ms7abG1aL/Ttobgfp8LwfPfptCXV8zHvwDqrTzhCYieOKR7QF00G3eXUNJbvJ04o
2dfKFC4mX7d5KvpPEGbUCZGsgGU1sH59+vLPi2IQJGnVjTawJLlkB83XQ65onJFvPrkhOU4vQKqm
eNpSNjiDn/EdFn2Zllvh2ZZhqAx0MJo2J3wbvM3O68i3ju55c2dMh7Zd01euZ3iTPQimZWl2broo
IF3JKjyepn7AAIV/eWSKijDw5LHlkDs0Izp4rJaIaL6Qbdnv8goDjSWBC8KzweBQ8Lrb5Ws2XtYN
bqOh+j0KTt1742wwU2waJaLGCHRV4EOHoc8NxrRNajudJXpLRmR4SQY6gVWnwJXvmKl4GJ1MEp3Z
UkVn8Ij26TH0bU0RCNCNpQ9plY9ETEYNUX18iYmzvmLHXNF+I5HwHYlf1ybNVnKohHG4EdmdItcP
Kat64kCz0hF3b0TA9Wwa8MRHsBNQ5qBT3U+9jrRZwxolYtgIga73yX4hMISur2sJVAH3NxUz2FFZ
1fNl7/nTIW/3867e5vXh22X1jx+//46x2tVLQps1LFjTQorHDjT+mPNeJAl/j6tmvoaWUiXwb5MX
RTs8r5SBpG7uIRXTAFgPbbM1GP4S0t13dF4IkHkhQOe1qdss31bnrEpzJr3HBnBd97sRIVUYssD/
dI4Fh/J6UFdz9spXSO/CNvjwbQPmZpaexbdAWAxL9kW+3cmVx0e844ZCp1Qdl6f4sX0uu2rV2/3r
w+uX/zy8En49IZvDMetkUdYw9+IDOLnenZ1ODh7FWnBfcybRoff77an3fNIQBoYpYJVU0ujqSJZD
hhZTXcodVb2rhaQOD1ykQIXkGOBSWj88/uv56Z9f31d/WcFiZXoUS8Qyx6UMf+M5vowmPmduQIlx
qdyCS54ZFrLqVEhGRGcnC7K4cNQg/pz8rhDjHy0gS9FXhxJBUAINYX6Fr7gVp25h485/LFO8Q4mL
2l8VWJrI90nxCG7sqK8xOZRaWFRXiUKhR9+xwoLyPrkwrdPAtkylt8kpqSjVIRTC22jurx/0yik9
v22p6IcRGufppffWW8Vb8liUtku8pOnqQ5VqemWXp/qO8i5PxdLg5xI9sm/BkO93ZPMDY8vuCNEc
dlLYOMhvCb0+nOR8vzzi0RFWR1NqyM883FZQa8WS9kAZThxrJFXCSQeYZQqZts6KfV7JtGSHGwgq
LYdfKrE+SCGikFayhBWFysjvgim0+wZ0cicTQYDbumoHd96zXTDRzpuNKoKshDmJcuXOwSKTvChz
2ud9dq82RrnOW7WFNq2ScluAXVIfOrUKkB/faTFUYn+fqSnuWNHX1BhE8Jhnd3yvRyn9vuUGkZpX
jk+rDVnlvVb0b2xNenNGrL/Lqx1TOsM+qzqYkXu95CIxxY3laKYItMiq+lgrNDDtx45NUPFHI7oG
meibjUxsD+W6AEs1dZQeguA29iyli0j43S7LCrUTSR8KZlielNDyJjmDXY/TuToQ7rk/BVVsYCvx
Dm3KK0/auqs3vZquxCV6m1GWM4cPRZ/zfihXo+pzmVC3fbaXSWB14/IE+rfQZgJREjhPkPWsuK9O
ah0bUBKo4k2SbApW8a2ihNrv5BwtnijIpXUs16o87sApRHQhgKEY1Hp1fcaoyH4jBu0P2jjTRjaU
0BSk2yjekPKkxAcp7rWyLjeNsK5kbf9bfY+5LlUXqYSK6/MjHRuAg2CPK34TZHwHg7e8AbeHrh/i
phvqfMBJ7dx0rqbF8ryse9OYOOVVqYz2z1lby18+UbQO9vk+hclN1zlDgI7z7rA2TXtFI73IpGbW
+dCSnP1x92CyAISTQ4l3AkTiPNl3sOTYJblpIYU44f8HyYeiyc+KnzKJAf6sTN69EQfrDLQm6867
JFUy10wfpGHFBYNjpjdff749PYLYioef9C2Cqm54iacky+n4AojyEJiq57VlJ4HtjrVat1m2N+qh
FMLSrezQZSnhvjFsRmLCtobm6e7yPqHtuZL06l6CydHniaCPJooSieLy7fr6s3t/evwXJcA50aHq
2CbDgPGHMtNaScxld317XyXL5Y5UtRSr7A7nXWGA4S/Vmc9CO08TlI7w6QSUed0q8LpFG78Cy+28
u8OLE9V2uQkAHLr9ypMx1tuO/OJ4oFeu5fxfZc/WnEau9F+h9mm3KrvHYOzYD3nQDAPMMjfPBbBf
pohNHCo2uAyus/l+/dctzaUltdiclzh09+jakvqm1tUtt2EqfHF5rT3JoaD4NNal2TI/vr6k92R6
6NWNVbGfX1xgoBrnJZUEQTQEXenS8LhKlMyRzZkAeuzIaIa8jMYBb0drrvzriyEn2Ut0lzSSAjHh
o11tA7U0Qol0bCSqCZgdfmy2F4BXVicyUGMxxWesvZfd4fRH/3owr2h3ePaF5gZ7oz0R0AJvaLhj
3/sre3wb+NkBQJprar6QUNOm0QGvRlYtcIINR+Pigr2UreqghhMJYRNvKz6ejG4c4dlqAMrLKzZt
g2IZlWbVqK30BaZMtOoqI//qdsja5FVp1qseBHxr1oLrgQbQSeCinIyub+1BC4vL4TS6HLIp5imF
etfN2HVk+OPXl93+x+/DP+QJks88iYfCPvYY+cMIBIPfe0npD2Pf8lCcjK1mqpcXnOMTrWEirY8w
m7l7AvFKqHfPylNqUuTjC451hhvJZwY4+myuYZKFU6t9Fl8Oxxd0SMv33fOzcWqpIuAImLmSLQrf
D/BlKAx+4XSVEP5NQk8kRNXoYeoNrlicQaoKznxMo7IIMk0wah3/l4E+pz8NR8jEZJJDD0XCZoud
xKIuwpXj2zBLQ48dlbz01cHKOxbxkSUrQaXy7MbCq6Z2/rziPvHRpaAp+MVKwnmBpynJUT+gQMNc
Bo2z5BxZG/nIhqwoknkgqJuAQnHplIF2CdzoY/uVqNaNy5laAsfjz3r2izCeYeBsGNZOzbMcXi9Y
t7ZyNykhBhinKLTXChpPe5qWHe633/piMWgU7egePrrHDywl4XYLgjdEsQajCfHsYYXeBTt1nQoi
pF83YYVxkFRsU5eTjDdqL+UTbuZ3TRqax/fD8fDtNJj/fNu+/7kcPH9sQUalDocuTcx50rbhoEHf
688Wl+1qbUcmRWMi7ZqCOF+l6NDq9UHJwuFDUC+8L6OL8c0ZMjjQKOWFVWUcFj6f/U+nCwvBkelE
NyOafp8Aa+rQauAL9TcKPToSeRlFjh2oGUd1K9eaSbF/ej/snuhWD+wIWym3g+tqOTpp1ZqWC5zV
5driu1lu/GS1kUNwBipJNhO45IjCnIRQfpHpL8igx3DKRV83HCTXbU6tvy2CC5RucSgVuIs0/Jkd
OJ1xZUVpmqFT5EyB0oBqF5iLFVfgMvRylA3PdVoGmcARN7+3izWVgBbOJ33q2rhixrDQk9G24Eqw
SY+zcCyDclUk/+b4Y3viAq0NTF/8OoxqsQ5x6qbcHjgNg2iC9Wsx/PMY1UtsV1FrWwr6sBoMm/AX
P8zyFI71QDPRrKacUEp8vv14tPydhRmf9FSJcSATcOwxX8H4JlEqjQxqTb4cHn8MisPHO/ecZRnG
IPik9LVaCYFOeDSxdbQoMJF2TJectDdjSBa0tbwea0l42Vq7D0UYeSl9+7FNlRrPyRN2AhNZizrW
SJtvZfZUIqzBmFTENqbYZbvHi3oDiRxkm+ftSd7OK+wz5t9I9XrkcTHtIkvy7evhtMXcmfb45gEa
OmE0tczkPbT2gfHYjY8pVdX29np8ZirK4oIcdfKnFAVMmHSGzxpTtwODAK29Eq/kAL6xWqMM1+kq
zG3rFD7s+nvx83javg7S/cD/vnv7Y3BEDesbzMNENyyK15fDM4CLg68ZxNozgkGr76DA7ZPzMxur
YiHeD5unx8Or6zsWLwmSdfaf6ft2e3zcAPPcHd7DO1ch/0YqaXd/xWtXARZOIu8+Ni/QNGfbWXwn
MAE/Sp+P/GK9A234H6ugfmMNk3W99CuWIbiPO8P6L019tzfE7VvJbcOan4PZAQj3B7oK2leV5fPO
KngyTZTuRvmZkmVBjluPcOWY1mjx0C3Ekr1RQui6x8eclYI+Fy7tVdF2zbLP9qNQB8sg0Q6XYF3y
FgXMxS298b3ExSoC2jkNP1Ao02+VIdCdLB6x0wIUkZIT+hAr35q9EHot9jOSCJXWM9bwJVtGn9gM
8zt5CYvxxOR3eDDRsgW0L+SklTTOqMc8zYeLWkF6L45ZERlRmOaF6XnptvkiKHU5gRwBiPNyPy5K
D3/57AvdiiyUIdYzcstGwTHMtn3IU44ICG9wZn09ysXVD0cTM2LIdj2wueKo0H3ojh/XC3xCsSq8
EZJxcwIfNxnaa5Avc8WaDNIsnOKKMMj5h6IpkYiWqVkCcl0Yr2/iO9MZRIjicA2jR7tIkNla1KOb
BDSQgnKBhsL+mzXHIsvmaQK6/yS+vmaj+pAs9YMoLWvYDyaB5l3UZ6r7BDcYnz5qEvue9gNWjS5K
CNvy06tkLe8nkzzVQ5MaUO2FsD/mwMb+L6lfE+phT5aaxUz+7PYOHZjFwKoTEbeMOl8NTu+bx93+
mYsxLNiNRK2CUhOXW1htRFaZ6Lio2M+ykn/DsyNgdr3Wg2t3odMqspnQ9x4pyWY4zq4nV/GbOp7l
HXGhv+Ta4ZuTl0eGfjC+cOBi4c/X6YjBmhcMmibAcRM8kOsH5uGf5fL1nAqOWU6zlEXnwczQ+tMp
xbi+m0wjo5EAqcVUm8Zpwb7tig5IaNO6z3kos169vWz/0VzSHT2+3DH7fDvSJq0BF8Mx+ygAovXX
IRHSaEj6m6lGxeRMT2mQUhGmmsMJf9et9s20oIjCWDd4AUBJ8c27TBo75766feNQKqukdPgY4rQo
2RWgIoh7iU2GW+9AnFW7mp4RU+A92zKAOcOrNAXPMWjXKPBmh09mP1ijVkc3lRZSe6jp1npgeQhC
H4I10x9KgGgAuTfxhJdqOGfy+8y8Mk8plnBisr6JadFdFegFPtsg3k2HxEg5kbRc2GXcVWnJG1fx
BadpMYaamQoUsqZjNq0wClKT6nwjLs20+LJFpzAGeJeLlt3DMEYtxLsKNfw5TyCilZDXAqIo1YxW
hBgPJ85yQkjioBR4D6Kzd2wev2811puCbOXP+cwRDbUSno7bj6fD4BtwcM/A7VpFXZ12WQIW+us4
EoYCWRkZwEyglyBNQsM/q0wA8zCagOTE9HMR5Amt1ThcQRjWZ1QC+jXER7ZImrUoS/6VMHwG2s8D
UVL7j/zTclQvxNgjRrYNtHDjalMmXt7KnQTlKs0XLrqWKqISRVS0pvYvv+2OB3yO888h8a4gAd4l
lIM+vuQexNBIPl9qfmwdx+Yw1khuqDfbwIycmCtnlTdX/9piLV7BwAydGGdjri+dmLETc+XEXDsx
tw7M7aXrm1vn4N5euvpzO3bVc/PZ6E9YpMg+9Y1zNoajK062N2mGZgHSr8izPKmXvy9EKfi4DUrB
eScp3tHlKx58zYOtFdIi+KcLtD7+WwOHY1fhQ9fiW6ThTZ2bn0kol/sEkSD91nka6/feWgRoaSVr
HOgJQDyq8pT9OE9FyV+K60ju8zCKqILZYmYiiEKfKxYjgjkTf4sHUT8y7FodKqlCzpuijYMWWtpi
yipfGB4JRFXllL0DHOkpjiLGStTgqiT01RuAOqBO0PgWhQ/qzmYbIUBPGU2kVMbj7ePH++700w5u
WAT35KjAXyBw3FX41JoUAsi5HORFCAdOUiJZDtKgdpJ6zedMVxoxMZjYtdWTOV4aVPct6Lkd+BVK
jvUkDgppvSnz0NeseC0JJ+g3KHr0z8UyqGXuqSRQ4SsoBNXyiT0zCswic7l5YQ1IGrxLpa5SsYZO
5ebu+yQIX0dF/OU3dP48Hf67//Rz87r59HLYPL3t9p+Om29bKGf39Gm3P22fcQI/fX379pua08X2
fb99kTc0t3tUqvu5JeGsg91+d9ptXnb/t0EssfiBbIVdAHUgSRNNW5Uo4C05Nl3zWdWzJUXNl1Bq
Gh3fjhbt7kZn/jaZtxOykKvSTo59//l2OqiHQrucU+Q5AEkMfZoJqs5r4JEND2h8FAHapMXCD7M5
1U8MhP3JXI9D6YE2aa7FZXQwlrCT9qyGO1siXI1fZJlNvaBaeFsCqNEMKeybcOLb5TZwzUzYoMzY
PfZDTJEhPNBMZXiUVfxsOhzdxFVkIZIq4oF20zP51wLLPwxTVOUcNjqmP2bqOqU7fXx92T3++WP7
c/AoGfcZ71P+tPg11wJSFGxiM03gczUH/oQz8nXYfMKUDpvUMhhdXclHnZR59OP0fbs/7R43+AJm
sJcNxre2/rvD7K7H4+FxJ1GTzWlj9cD3Y3t6GJg/h/NGjC6yNLofaqlXu2U3C4shjTpvF1hwR1NB
dN2bC9ielm0vPOlhfz080TQGbd2eb7eH5i5oYaXNyT7DfoFvfxvlKwuWMnVkqjHmXK7ZIMB2QQb3
q1zYizKZu0cTr8qUVcyxDfraLI6d44MujuGLhT1+cw645kZ6qSjbLK/b48muIfcvR8wcIdiuZM1u
rF4kFsHIHnAFtycRCi+HF5NwarMvW75zqOPJmIExdCGwrPS8cAyQxxNgfjcPIJ6quT14dHXNgS9H
NnUxF0MOyBUB4Kshcw7OxSXT/CLm1JoWWYL84KX2EVfO8uGtXccqUzWrg3/39l1/+afdLwqmHQCt
S84K3uKTygvZD3N/zMqBHRulKwxEcheN78GDUsNsuQLFbSPanOCumOYgnE8b2Z4S7OPjDXLanm3m
V4u5eBB8bG87VyIqBPuOl7GRc0zAvzvdYfNM84d2rDNmyioDzgPaIlepnhxEh/eD3Sb4bd+PtLgI
ZKlIN+012/lDyjTqZszdpek+sfcBgM3tfe2hKLuLXvlm/3R4HSQfr1+37yrwyhDlO84twtrPOElx
knszGVfMY5qt2uIgiRMFf2WPEvmsaZRQWPX+HWKWhwA9/dm9hVW3Dxg5vUW0ojMnO0p8K3S7m9WR
cgPWIVkFACvHywim7vGy+/qO6ZTfDx+n3Z45KKPQa7YlBg77C4tozieSyMJJw+LUejz7uSLhUZ04
eL4EKjXa6PZsBHk2fAi+DM+RnKvGecb2vTgjQSJRd5iZrDPn0omI4j7GBEKg56O1Ai+59qUSZFZ5
UUNTVJ5Otr66uK39IC/DaeijR0+584hlZeEXN3gdH7OjyjI4is/tzQgHFtWMWiXcIB7RGZoxskB5
8dAbJ9tgeOwUD2/fTxhQBpK8ym1/3D3vN6cPUKcfv28ff4BuTu/EyCj0Eq+0K7tOrrkPbXyhXeho
8MG6zAUdG96YkyYTkd8ztZnlwTLAzDhFZ6LifVi/0FN1Ncu5njHxmcjrHG+z6IFfQjpKmX54IQg5
eC2BsEYbUgTyT+Jn9/U0T2PDyUlJoiBxYJOgrKsy1N/d9NN8whppMfNDAFpv7Gk3WZQVjqat6UKe
/BBDeamG0aIMMAjNoPHB5q6Bhtc6hS1XQ0FlVetf6aI9/NStnToGll/g3fPvQ2kkLiFOkoh8xXOh
wnuh3sJrbcf2DTHF5/xSsAfZyoxPlFpTe8F7G6W9KQLrTdJYH5MG9YD7HBxPutwioZY0A2IMCkNG
fiCEYqSKDR+z1CDD8HC2FJRuGHIJ5ujXDwg2f9drml+xgcl4MD3gq8GEgk1432AFzUDUw8p5RR82
ahB4P8Zujuf/bcH0een7Vs8ewoxFeIAYsZjoIRYsYv3goE8d8DELb2ROY3lT+3i7kdG8NzJQZikw
h2+gHY1F6oewnywDGMdcu1coCtw0aCAcgiZa72KhB6kgANoaiTwAzpkHetxkl4tDXtVE2mmaW1n0
EC6v8KWZnv0e4CjquTwxxSxSw0BWbFaBBk33vckd2TaTCIMFmMEsU9DttU0jeqhLQVgszO9QyCGF
xVlz9aytKYy13/BjOiGDkcrERzM4BGliMWnpnwQZve2FPpVkxrqQrJNPdzm00oCEvr3v9qcfA1BT
Bk+v2+Oz7WSC8yYpF/KmjHZWKjAmMeMF9TQpUhl8NIvg5Iw6u/ZnJ8VdFQbll3E3do3EZJUwJtN/
nwiYlTPh2hqFFY5IZJDYS1EKDPIcPuDjZ5yD1Smiu5ftn6fdayOLHCXpo4K/20Or2tToIhYMg4cq
PzBi+Ttsu/YdSY0IZZFFIR8IR4gmK5FP+eN1NgHJ28/DrOTDWoJEGvPjCg0h84C9yTfNYVBrqCP5
gumbKRdnsOFgJC19EyQHzU0WCija/znAQeyBJsOa4B+Ial6d8aWHNQ6LWJR0zzMxsk11mkT39jjD
RuSD9F0l6hMRYT7ZyxEXei13sZVIyqanWSo3VxqSRuHmfKuaVoFYoKsWtyi6oH+Zs7SbYM2Cn2y/
fjw/o3Mu3B9P7x+v2/2JxoNi0jYUwfM7sm31wM4xqGb5y8U/Q44KE4NR4dPGoaW/wuB21CX0zhfM
0Bdy217VxizbZOhLkpQxRnU6OaIrsHGYNsjKK7SkU/gT0xpotykU1MPrXZxZTqExAox+JFU6iWL3
kl+aJb0LGB8XRCbrNPVSt3FXGNnFcScFjQ2zFOoRyqoUxMtzktM48Nt0lWhqq9Rl0xAzMFLdUYfD
YINYnoSlfhtCp8HkZs5pS72/A+WkMRrcINj3pRyk6Of+BTJ5J5RN2qCRYSSfu1m5X8nN6hfqgwWP
IgkTlMySN7ttexgOyRkWVZ4MbHA3XsUMVE3+hv5LfKaqQQbJxLmLq0KWsd3vZSw9QWboqUmTeyb7
AjCbgV4zKyzGlhe6ZJQCw69ql8SbKWzeQQwYIV3GENqpiry1x8NG+r6USBcCF7Zt0lJYZADF45LF
MQECJkVR2o8ZQdEvSbMnxRwvXFl345B+kB7ejp8G0eHxx8eb2vLnm/2zFu+bCXzuBk6nNGVHQsNj
YHoFe7iORIZPq/ILyduAiTUxbLzKoJWlfMXCwcmIrOf4yEspigVLtLqDkxGO2knKi2hyp1S1OSLv
z42FipGCU/HpQyZ7I3ufwd9OHUFidTFMwuRaopPJVWPOJ47mIggyLj07tp5s9b8f33Z79GxDx14/
Ttt/tvCf7enxr7/+ovmV0jZlnkxMweREzHLMSNOE+bNDLMvA7pzZj0C5iqsyWLOup4ZX++v2+lJV
39nLdLVSONib0lUm2GtLTe2rIoiZEmTLXSeTIlGaGVQBo84XgOMmHQtnUvLIioDPyyoPDN2/7wWn
bf0Pc6opdCBlUA1XyqHQUUx0GAQT4EhlJbJ7tFBHgWPP+KEEiqfNaTNASeIRbaP6C5NqXMKzh2Zm
4nVGmJksIG9zhMZzBfLcSuqJKAWqXnnF3DfRFrmj8WbjfFCNgqQEqdK+DwgnLycAGTPbFYgHNd6K
tiJ9NAr6NTMoSJIH0xrvtZrMgzg8qaTC0u21oyHFt6yg1RncFWcu5Ond1OcCNlylUOS9KtFyuQAR
0L/n02rLZtS+vsIR6Nh3pvIDXp8WeB/dnp3D23b/vjs+alNE7RPl9njCdYQbvI933jfPW8q8iypx
KLMtB6IKn+awn/+tVD1OG5UaTUdBlDQRRkVEbToIURJra0bqu4+oKW4M/14Fq+qYNP22gC4fXhhs
hA8QOfx02cyYcUkW5Eh0ESAbqkxGjlRWIGDZTK9HdvKzYYV/KpPS/wNKMm4F+GoBAA==
--===============4281144283445251188==--

