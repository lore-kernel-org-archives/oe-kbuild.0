Content-Type: multipart/mixed; boundary="===============6050933318887646945=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: Re: [PATCH net-next 1/4] net/tls: Describe ciphers sizes by const structs
Date: Thu, 15 Sep 2022 06:03:37 +0800
Message-ID: <202209150529.T2Z3vjeE-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============6050933318887646945==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

:::::: =

:::::: Manual check reason: "low confidence static check warning: net/tls/t=
ls_main.c:70:9: sparse: sparse: obsolete array initializer, use C99 syntax"
:::::: =


BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
In-Reply-To: <20220914090520.4170-2-gal@nvidia.com>
References: <20220914090520.4170-2-gal@nvidia.com>
TO: Gal Pressman <gal@nvidia.com>
TO: "David S. Miller" <davem@davemloft.net>
CC: netdev(a)vger.kernel.org
TO: Jakub Kicinski <kuba@kernel.org>
CC: Saeed Mahameed <saeedm@nvidia.com>
CC: Tariq Toukan <tariqt@nvidia.com>
CC: Gal Pressman <gal@nvidia.com>

Hi Gal,

I love your patch! Perhaps something to improve:

[auto build test WARNING on net-next/master]

url:    https://github.com/intel-lab-lkp/linux/commits/Gal-Pressman/Support=
-256-bit-TLS-keys-with-device-offload/20220914-171814
base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git =
c9ae520ac3faf2f272b5705b085b3778c7997ec8
:::::: branch date: 13 hours ago
:::::: commit date: 13 hours ago
config: x86_64-randconfig-s021 (https://download.01.org/0day-ci/archive/202=
20915/202209150529.T2Z3vjeE-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-5) 11.3.0
reproduce:
        # apt-get install sparse
        # sparse version: v0.6.4-39-gce1a6720-dirty
        # https://github.com/intel-lab-lkp/linux/commit/1cf09f517908ce4b1bf=
800ef799fe612121628d9
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Gal-Pressman/Support-256-bit-TLS-k=
eys-with-device-offload/20220914-171814
        git checkout 1cf09f517908ce4b1bf800ef799fe612121628d9
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        make W=3D1 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' O=3D=
build_dir ARCH=3Dx86_64 SHELL=3D/bin/bash net/tls/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

sparse warnings: (new ones prefixed by >>)
>> net/tls/tls_main.c:70:9: sparse: sparse: obsolete array initializer, use=
 C99 syntax
   net/tls/tls_main.c:71:9: sparse: sparse: obsolete array initializer, use=
 C99 syntax
   net/tls/tls_main.c:72:9: sparse: sparse: obsolete array initializer, use=
 C99 syntax
   net/tls/tls_main.c:73:9: sparse: sparse: obsolete array initializer, use=
 C99 syntax
   net/tls/tls_main.c:74:9: sparse: sparse: obsolete array initializer, use=
 C99 syntax
   net/tls/tls_main.c:75:9: sparse: sparse: obsolete array initializer, use=
 C99 syntax

vim +70 net/tls/tls_main.c

1cf09f517908ce Tariq Toukan 2022-09-14  68  =

1cf09f517908ce Tariq Toukan 2022-09-14  69  const struct tls_cipher_size_de=
sc tls_cipher_size_desc[] =3D {
1cf09f517908ce Tariq Toukan 2022-09-14 @70  	CIPHER_SIZE_DESC(TLS_CIPHER_AE=
S_GCM_128),
1cf09f517908ce Tariq Toukan 2022-09-14  71  	CIPHER_SIZE_DESC(TLS_CIPHER_AE=
S_GCM_256),
1cf09f517908ce Tariq Toukan 2022-09-14  72  	CIPHER_SIZE_DESC(TLS_CIPHER_AE=
S_CCM_128),
1cf09f517908ce Tariq Toukan 2022-09-14  73  	CIPHER_SIZE_DESC(TLS_CIPHER_CH=
ACHA20_POLY1305),
1cf09f517908ce Tariq Toukan 2022-09-14  74  	CIPHER_SIZE_DESC(TLS_CIPHER_SM=
4_GCM),
1cf09f517908ce Tariq Toukan 2022-09-14  75  	CIPHER_SIZE_DESC(TLS_CIPHER_SM=
4_CCM),
1cf09f517908ce Tariq Toukan 2022-09-14  76  };
1cf09f517908ce Tariq Toukan 2022-09-14  77  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============6050933318887646945==--

