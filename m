Content-Type: multipart/mixed; boundary="===============6824587821300780437=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ammarfaizi2-block:dhowells/linux-fs/rxrpc-multiqueue 5/9] net/rxrpc/af_rxrpc.c:948:2: sparse: sparse: compat_setsockopt disappeared
Date: Mon, 27 Jun 2022 06:03:55 +0800
Message-ID: <202206270544.ZjtwYn0F-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6824587821300780437==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: net/rxrpc=
/af_rxrpc.c:948:2: sparse: sparse: compat_setsockopt disappeared"
:::::: =


CC: kbuild-all(a)lists.01.org
BCC: lkp(a)intel.com
CC: "GNU/Weeb Mailing List" <gwml@vger.gnuweeb.org>
CC: linux-kernel(a)vger.kernel.org
TO: David Howells <dhowells@redhat.com>

tree:   https://github.com/ammarfaizi2/linux-block dhowells/linux-fs/rxrpc-=
multiqueue
head:   9d38361e5122a5aa9192faf3d3ea55bd7c302d09
commit: 313eea79a952d095d26bb59d1d560731b354a078 [5/9] rxrpc: Allow the cal=
l to interact with to be preselected
:::::: branch date: 3 days ago
:::::: commit date: 3 days ago
config: arm64-randconfig-s031-20220626
compiler: aarch64-linux-gcc (GCC) 11.3.0
reproduce:
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/=
make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # apt-get install sparse
        # sparse version: v0.6.4-31-g4880bd19-dirty
        # https://github.com/ammarfaizi2/linux-block/commit/313eea79a952d09=
5d26bb59d1d560731b354a078
        git remote add ammarfaizi2-block https://github.com/ammarfaizi2/lin=
ux-block
        git fetch --no-tags ammarfaizi2-block dhowells/linux-fs/rxrpc-multi=
queue
        git checkout 313eea79a952d095d26bb59d1d560731b354a078
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-11.3.0 make.cross=
 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3Dbuild_dir ARCH=3Da=
rm64 SHELL=3D/bin/bash net/rxrpc/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>


sparse warnings: (new ones prefixed by >>)
>> net/rxrpc/af_rxrpc.c:948:2: sparse: sparse: compat_setsockopt disappeared

vim +948 net/rxrpc/af_rxrpc.c

313eea79a952d0 David Howells     2019-10-10  848  =

17926a79320afa David Howells     2007-04-26  849  /*
17926a79320afa David Howells     2007-04-26  850   * set RxRPC socket optio=
ns
17926a79320afa David Howells     2007-04-26  851   */
17926a79320afa David Howells     2007-04-26  852  static int rxrpc_setsocko=
pt(struct socket *sock, int level, int optname,
a7b75c5a8c4144 Christoph Hellwig 2020-07-23  853  			    sockptr_t optval, =
unsigned int optlen)
17926a79320afa David Howells     2007-04-26  854  {
17926a79320afa David Howells     2007-04-26  855  	struct rxrpc_sock *rx =
=3D rxrpc_sk(sock->sk);
313eea79a952d0 David Howells     2019-10-10  856  	unsigned long long call_=
id;
95c961747284a6 Eric Dumazet      2012-04-15  857  	unsigned int min_sec_lev=
el;
4722974d90e06d David Howells     2017-06-05  858  	u16 service_upgrade[2];
a8b1b8262cc1a7 David Howells     2022-06-16  859  	int ret, fd;
17926a79320afa David Howells     2007-04-26  860  =

17926a79320afa David Howells     2007-04-26  861  	_enter(",%d,%d,,%d", lev=
el, optname, optlen);
17926a79320afa David Howells     2007-04-26  862  =

17926a79320afa David Howells     2007-04-26  863  	lock_sock(&rx->sk);
17926a79320afa David Howells     2007-04-26  864  	ret =3D -EOPNOTSUPP;
17926a79320afa David Howells     2007-04-26  865  =

17926a79320afa David Howells     2007-04-26  866  	if (level =3D=3D SOL_RXR=
PC) {
17926a79320afa David Howells     2007-04-26  867  		switch (optname) {
17926a79320afa David Howells     2007-04-26  868  		case RXRPC_EXCLUSIVE_CO=
NNECTION:
17926a79320afa David Howells     2007-04-26  869  			ret =3D -EINVAL;
17926a79320afa David Howells     2007-04-26  870  			if (optlen !=3D 0)
17926a79320afa David Howells     2007-04-26  871  				goto error;
17926a79320afa David Howells     2007-04-26  872  			ret =3D -EISCONN;
2341e077574786 David Howells     2016-06-09  873  			if (rx->sk.sk_state !=
=3D RXRPC_UNBOUND)
17926a79320afa David Howells     2007-04-26  874  				goto error;
cc8feb8edd92d8 David Howells     2016-04-04  875  			rx->exclusive =3D true;
17926a79320afa David Howells     2007-04-26  876  			goto success;
17926a79320afa David Howells     2007-04-26  877  =

17926a79320afa David Howells     2007-04-26  878  		case RXRPC_SECURITY_KEY:
17926a79320afa David Howells     2007-04-26  879  			ret =3D -EINVAL;
17926a79320afa David Howells     2007-04-26  880  			if (rx->key)
17926a79320afa David Howells     2007-04-26  881  				goto error;
17926a79320afa David Howells     2007-04-26  882  			ret =3D -EISCONN;
2341e077574786 David Howells     2016-06-09  883  			if (rx->sk.sk_state !=
=3D RXRPC_UNBOUND)
17926a79320afa David Howells     2007-04-26  884  				goto error;
17926a79320afa David Howells     2007-04-26  885  			ret =3D rxrpc_request_=
key(rx, optval, optlen);
17926a79320afa David Howells     2007-04-26  886  			goto error;
17926a79320afa David Howells     2007-04-26  887  =

17926a79320afa David Howells     2007-04-26  888  		case RXRPC_SECURITY_KEY=
RING:
17926a79320afa David Howells     2007-04-26  889  			ret =3D -EINVAL;
17926a79320afa David Howells     2007-04-26  890  			if (rx->key)
17926a79320afa David Howells     2007-04-26  891  				goto error;
17926a79320afa David Howells     2007-04-26  892  			ret =3D -EISCONN;
2341e077574786 David Howells     2016-06-09  893  			if (rx->sk.sk_state !=
=3D RXRPC_UNBOUND)
17926a79320afa David Howells     2007-04-26  894  				goto error;
17926a79320afa David Howells     2007-04-26  895  			ret =3D rxrpc_server_k=
eyring(rx, optval, optlen);
17926a79320afa David Howells     2007-04-26  896  			goto error;
17926a79320afa David Howells     2007-04-26  897  =

17926a79320afa David Howells     2007-04-26  898  		case RXRPC_MIN_SECURITY=
_LEVEL:
17926a79320afa David Howells     2007-04-26  899  			ret =3D -EINVAL;
95c961747284a6 Eric Dumazet      2012-04-15  900  			if (optlen !=3D sizeof=
(unsigned int))
17926a79320afa David Howells     2007-04-26  901  				goto error;
17926a79320afa David Howells     2007-04-26  902  			ret =3D -EISCONN;
2341e077574786 David Howells     2016-06-09  903  			if (rx->sk.sk_state !=
=3D RXRPC_UNBOUND)
17926a79320afa David Howells     2007-04-26  904  				goto error;
a7b75c5a8c4144 Christoph Hellwig 2020-07-23  905  			ret =3D copy_from_sock=
ptr(&min_sec_level, optval,
a7b75c5a8c4144 Christoph Hellwig 2020-07-23  906  				       sizeof(unsigne=
d int));
17926a79320afa David Howells     2007-04-26  907  			if (ret < 0)
17926a79320afa David Howells     2007-04-26  908  				goto error;
17926a79320afa David Howells     2007-04-26  909  			ret =3D -EINVAL;
17926a79320afa David Howells     2007-04-26  910  			if (min_sec_level > RX=
RPC_SECURITY_MAX)
17926a79320afa David Howells     2007-04-26  911  				goto error;
17926a79320afa David Howells     2007-04-26  912  			rx->min_sec_level =3D =
min_sec_level;
17926a79320afa David Howells     2007-04-26  913  			goto success;
17926a79320afa David Howells     2007-04-26  914  =

4722974d90e06d David Howells     2017-06-05  915  		case RXRPC_UPGRADEABLE_=
SERVICE:
4722974d90e06d David Howells     2017-06-05  916  			ret =3D -EINVAL;
b130b073513295 David Howells     2022-06-16  917  			if (optlen !=3D sizeof=
(service_upgrade))
4722974d90e06d David Howells     2017-06-05  918  				goto error;
4722974d90e06d David Howells     2017-06-05  919  			ret =3D -EISCONN;
b130b073513295 David Howells     2022-06-16  920  			if (rx->sk.sk_state !=
=3D RXRPC_SERVER_BOUND)
4722974d90e06d David Howells     2017-06-05  921  				goto error;
4722974d90e06d David Howells     2017-06-05  922  			ret =3D -EFAULT;
a7b75c5a8c4144 Christoph Hellwig 2020-07-23  923  			if (copy_from_sockptr(=
service_upgrade, optval,
4722974d90e06d David Howells     2017-06-05  924  					   sizeof(service_up=
grade)) !=3D 0)
4722974d90e06d David Howells     2017-06-05  925  				goto error;
b130b073513295 David Howells     2022-06-16  926  			mutex_lock(&rx->local-=
>services_lock);
b130b073513295 David Howells     2022-06-16  927  			ret =3D rxrpc_bind_ser=
vice_upgrade(rx, service_upgrade[0],
b130b073513295 David Howells     2022-06-16  928  							 service_upgrade[1=
]);
b130b073513295 David Howells     2022-06-16  929  			mutex_unlock(&rx->loca=
l->services_lock);
b130b073513295 David Howells     2022-06-16  930  			if (ret < 0)
4722974d90e06d David Howells     2017-06-05  931  				goto error;
4722974d90e06d David Howells     2017-06-05  932  			goto success;
4722974d90e06d David Howells     2017-06-05  933  =

a8b1b8262cc1a7 David Howells     2022-06-16  934  		case RXRPC_BIND_CHANNEL:
a8b1b8262cc1a7 David Howells     2022-06-16  935  			ret =3D -EINVAL;
a8b1b8262cc1a7 David Howells     2022-06-16  936  			if (optlen !=3D sizeof=
(fd))
a8b1b8262cc1a7 David Howells     2022-06-16  937  				goto error;
a8b1b8262cc1a7 David Howells     2022-06-16  938  			ret =3D -EFAULT;
a8b1b8262cc1a7 David Howells     2022-06-16  939  			if (copy_from_sockptr(=
&fd, optval, sizeof(fd)) !=3D 0)
a8b1b8262cc1a7 David Howells     2022-06-16  940  				goto error;
a8b1b8262cc1a7 David Howells     2022-06-16  941  			ret =3D rxrpc_bind_cha=
nnel(rx, fd);
a8b1b8262cc1a7 David Howells     2022-06-16  942  			if (ret < 0)
a8b1b8262cc1a7 David Howells     2022-06-16  943  				goto error;
a8b1b8262cc1a7 David Howells     2022-06-16  944  			goto success;
a8b1b8262cc1a7 David Howells     2022-06-16  945  =

313eea79a952d0 David Howells     2019-10-10  946  		case RXRPC_SELECT_CALL_=
FOR_RECV:
313eea79a952d0 David Howells     2019-10-10  947  		case RXRPC_SELECT_CALL_=
FOR_SEND:
313eea79a952d0 David Howells     2019-10-10 @948  #warning compat_setsockop=
t disappeared
313eea79a952d0 David Howells     2019-10-10  949  			ret =3D -EINVAL;
313eea79a952d0 David Howells     2019-10-10  950  			if (optlen !=3D sizeof=
(call_id))
313eea79a952d0 David Howells     2019-10-10  951  				goto error;
313eea79a952d0 David Howells     2019-10-10  952  			ret =3D -EFAULT;
313eea79a952d0 David Howells     2019-10-10  953  			if (copy_from_sockptr(=
&call_id, optval,
313eea79a952d0 David Howells     2019-10-10  954  					      sizeof(call_id=
)) !=3D 0)
313eea79a952d0 David Howells     2019-10-10  955  				goto error;
313eea79a952d0 David Howells     2019-10-10  956  			ret =3D rxrpc_set_sele=
ct_call(rx, call_id, optname);
313eea79a952d0 David Howells     2019-10-10  957  			goto error;
313eea79a952d0 David Howells     2019-10-10  958  =

17926a79320afa David Howells     2007-04-26  959  		default:
313eea79a952d0 David Howells     2019-10-10  960  			goto error;
17926a79320afa David Howells     2007-04-26  961  		}
313eea79a952d0 David Howells     2019-10-10  962  	} else {
313eea79a952d0 David Howells     2019-10-10  963  		goto error;
17926a79320afa David Howells     2007-04-26  964  	}
17926a79320afa David Howells     2007-04-26  965  =

17926a79320afa David Howells     2007-04-26  966  success:
17926a79320afa David Howells     2007-04-26  967  	ret =3D 0;
17926a79320afa David Howells     2007-04-26  968  error:
17926a79320afa David Howells     2007-04-26  969  	release_sock(&rx->sk);
17926a79320afa David Howells     2007-04-26  970  	return ret;
17926a79320afa David Howells     2007-04-26  971  }
17926a79320afa David Howells     2007-04-26  972  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6824587821300780437==--

