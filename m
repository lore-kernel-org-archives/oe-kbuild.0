Content-Type: multipart/mixed; boundary="===============4619276298606977888=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: [ardb:efi-rng-seed 4/4] drivers/firmware/efi/libstub/random.c:118 efi_random_get_seed() error: we previously assumed 'seed' could be null (see line 86)
Date: Sun, 07 Aug 2022 15:05:58 +0800
Message-ID: <202208071444.vTqq3qSo-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============4619276298606977888==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

BCC: lkp(a)intel.com
CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Ard Biesheuvel <ardb@kernel.org>

tree:   git://git.kernel.org/pub/scm/linux/kernel/git/ardb/linux.git efi-rn=
g-seed
head:   455638a66f76aa791739682ffd9af4d87158f008
commit: 455638a66f76aa791739682ffd9af4d87158f008 [4/4] efi: rng: combine bo=
otloader provided RNG seed with RNG protocol output
:::::: branch date: 2 days ago
:::::: commit date: 2 days ago
config: x86_64-randconfig-m001 (https://download.01.org/0day-ci/archive/202=
20807/202208071444.vTqq3qSo-lkp(a)intel.com/config)
compiler: gcc-11 (Debian 11.3.0-3) 11.3.0

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>
Reported-by: Dan Carpenter <dan.carpenter@oracle.com>

smatch warnings:
drivers/firmware/efi/libstub/random.c:118 efi_random_get_seed() error: we p=
reviously assumed 'seed' could be null (see line 86)

vim +/seed +118 drivers/firmware/efi/libstub/random.c

455638a66f76aa Ard Biesheuvel      2022-08-05   54  =

ba832f68dcf171 Heinrich Schuchardt 2020-02-21   55  /**
ba832f68dcf171 Heinrich Schuchardt 2020-02-21   56   * efi_random_get_seed(=
) - provide random seed as configuration table
ba832f68dcf171 Heinrich Schuchardt 2020-02-21   57   *
ba832f68dcf171 Heinrich Schuchardt 2020-02-21   58   * The EFI_RNG_PROTOCOL=
 is used to read random bytes. These random bytes are
ba832f68dcf171 Heinrich Schuchardt 2020-02-21   59   * saved as a configura=
tion table which can be used as entropy by the kernel
ba832f68dcf171 Heinrich Schuchardt 2020-02-21   60   * for the initializati=
on of its pseudo random number generator.
ba832f68dcf171 Heinrich Schuchardt 2020-02-21   61   */
455638a66f76aa Ard Biesheuvel      2022-08-05   62  void efi_random_get_see=
d(void)
568bc4e87033d2 Ard Biesheuvel      2016-11-12   63  {
568bc4e87033d2 Ard Biesheuvel      2016-11-12   64  	efi_guid_t rng_proto =
=3D EFI_RNG_PROTOCOL_GUID;
568bc4e87033d2 Ard Biesheuvel      2016-11-12   65  	efi_guid_t rng_algo_ra=
w =3D EFI_RNG_ALGORITHM_RAW;
568bc4e87033d2 Ard Biesheuvel      2016-11-12   66  	efi_guid_t rng_table_g=
uid =3D LINUX_EFI_RANDOM_SEED_TABLE_GUID;
1786e83011644e Ard Biesheuvel      2019-12-24   67  	efi_rng_protocol_t *rn=
g =3D NULL;
818c7ce724770f Hans de Goede       2019-12-24   68  	struct linux_efi_rando=
m_seed *seed =3D NULL;
455638a66f76aa Ard Biesheuvel      2022-08-05   69  	struct blake2s_state s=
tate;
455638a66f76aa Ard Biesheuvel      2022-08-05   70  	unsigned int total_len=
 =3D 0;
568bc4e87033d2 Ard Biesheuvel      2016-11-12   71  	efi_status_t status;
568bc4e87033d2 Ard Biesheuvel      2016-11-12   72  =

455638a66f76aa Ard Biesheuvel      2022-08-05   73  	// grab the EFI RNG pr=
otocol, if it exists
455638a66f76aa Ard Biesheuvel      2022-08-05   74  	efi_bs_call(locate_pro=
tocol, &rng_proto, NULL, (void **)&rng);
568bc4e87033d2 Ard Biesheuvel      2016-11-12   75  =

455638a66f76aa Ard Biesheuvel      2022-08-05   76  	// grab the seed provi=
ded by the previous boot stages
455638a66f76aa Ard Biesheuvel      2022-08-05   77  	seed =3D get_efi_confi=
g_table(LINUX_EFI_RANDOM_SEED_TABLE_GUID);
568bc4e87033d2 Ard Biesheuvel      2016-11-12   78  =

455638a66f76aa Ard Biesheuvel      2022-08-05   79  	// if neither exists, =
there is little we can do
455638a66f76aa Ard Biesheuvel      2022-08-05   80  	if (!seed && !rng)
455638a66f76aa Ard Biesheuvel      2022-08-05   81  		return;
41e8a7c249bf50 Dominik Brodowski   2019-11-06   82  =

455638a66f76aa Ard Biesheuvel      2022-08-05   83  	blake2s_init(&state, E=
FI_RANDOM_SEED_SIZE);
455638a66f76aa Ard Biesheuvel      2022-08-05   84  	blake2s_update(&state,=
 pstr, sizeof(pstr) - 1);
455638a66f76aa Ard Biesheuvel      2022-08-05   85  =

455638a66f76aa Ard Biesheuvel      2022-08-05  @86  	if (seed) {
455638a66f76aa Ard Biesheuvel      2022-08-05   87  		blake2s_update(&state=
, (void *)&seed->size, sizeof(seed->size));
455638a66f76aa Ard Biesheuvel      2022-08-05   88  		blake2s_update(&state=
, seed->bits, seed->size);
455638a66f76aa Ard Biesheuvel      2022-08-05   89  		total_len +=3D seed->=
size;
455638a66f76aa Ard Biesheuvel      2022-08-05   90  	}
455638a66f76aa Ard Biesheuvel      2022-08-05   91  =

455638a66f76aa Ard Biesheuvel      2022-08-05   92  	if (rng) {
455638a66f76aa Ard Biesheuvel      2022-08-05   93  		const int sz =3D EFI_=
RANDOM_SEED_SIZE;
455638a66f76aa Ard Biesheuvel      2022-08-05   94  		u8 bits[EFI_RANDOM_SE=
ED_SIZE];
455638a66f76aa Ard Biesheuvel      2022-08-05   95  =

455638a66f76aa Ard Biesheuvel      2022-08-05   96  		status =3D efi_call_p=
roto(rng, get_rng, &rng_algo_raw, sz, bits);
568bc4e87033d2 Ard Biesheuvel      2016-11-12   97  		if (status =3D=3D EFI=
_UNSUPPORTED)
568bc4e87033d2 Ard Biesheuvel      2016-11-12   98  			/*
568bc4e87033d2 Ard Biesheuvel      2016-11-12   99  			 * Use whatever algo=
rithm we have available if the raw algorithm
568bc4e87033d2 Ard Biesheuvel      2016-11-12  100  			 * is not implemente=
d.
568bc4e87033d2 Ard Biesheuvel      2016-11-12  101  			 */
455638a66f76aa Ard Biesheuvel      2022-08-05  102  			status =3D efi_call_=
proto(rng, get_rng, NULL, sz, bits);
455638a66f76aa Ard Biesheuvel      2022-08-05  103  =

455638a66f76aa Ard Biesheuvel      2022-08-05  104  		if (status =3D=3D EFI=
_SUCCESS) {
455638a66f76aa Ard Biesheuvel      2022-08-05  105  			blake2s_update(&stat=
e, (void *)&sz, sizeof(sz));
455638a66f76aa Ard Biesheuvel      2022-08-05  106  			blake2s_update(&stat=
e, bits, sz);
455638a66f76aa Ard Biesheuvel      2022-08-05  107  			total_len +=3D sz;
455638a66f76aa Ard Biesheuvel      2022-08-05  108  		}
455638a66f76aa Ard Biesheuvel      2022-08-05  109  	}
568bc4e87033d2 Ard Biesheuvel      2016-11-12  110  =

455638a66f76aa Ard Biesheuvel      2022-08-05  111  	// place the seed in E=
FI runtime services data which the OS will preserve
455638a66f76aa Ard Biesheuvel      2022-08-05  112  	status =3D efi_bs_call=
(allocate_pool, EFI_RUNTIME_SERVICES_DATA,
455638a66f76aa Ard Biesheuvel      2022-08-05  113  			     sizeof(*seed) +=
 EFI_RANDOM_SEED_SIZE,
455638a66f76aa Ard Biesheuvel      2022-08-05  114  			     (void **)&seed);
568bc4e87033d2 Ard Biesheuvel      2016-11-12  115  	if (status !=3D EFI_SU=
CCESS)
455638a66f76aa Ard Biesheuvel      2022-08-05  116  		return;
568bc4e87033d2 Ard Biesheuvel      2016-11-12  117  =

455638a66f76aa Ard Biesheuvel      2022-08-05 @118  	blake2s_final(&state, =
seed->bits);
455638a66f76aa Ard Biesheuvel      2022-08-05  119  	seed->size =3D min(tot=
al_len, EFI_RANDOM_SEED_SIZE);
966291f6344d7e Ard Biesheuvel      2019-12-24  120  	status =3D efi_bs_call=
(install_configuration_table, &rng_table_guid, seed);
568bc4e87033d2 Ard Biesheuvel      2016-11-12  121  	if (status !=3D EFI_SU=
CCESS)
455638a66f76aa Ard Biesheuvel      2022-08-05  122  		efi_warn("Failed to i=
nstall LINUX_EFI_RANDOM_SEED_TABLE_GUID config table\n");
568bc4e87033d2 Ard Biesheuvel      2016-11-12  123  =


-- =

0-DAY CI Kernel Test Service
https://01.org/lkp
--===============4619276298606977888==--

