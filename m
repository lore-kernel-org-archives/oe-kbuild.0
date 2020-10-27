Content-Type: multipart/mixed; boundary="===============5555961863037908915=="
MIME-Version: 1.0
From: kernel test robot <lkp@intel.com>
Subject: drivers/gpu/drm/amd/amdgpu/amdgpu_fru_eeprom.c:128:20: warning: Array accessed at index 32, which is out of bounds.
Date: Tue, 27 Oct 2020 15:44:32 +0800
Message-ID: <202010271526.rOa2KiBq-lkp@intel.com>
List-Id: <oe-kbuild.lists.linux.dev>
To: kbuild@lists.01.org

--===============5555961863037908915==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

CC: kbuild-all(a)lists.01.org
CC: linux-kernel(a)vger.kernel.org
TO: Kent Russell <kent.russell@amd.com>
CC: Alex Deucher <alexander.deucher@amd.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git =
master
head:   4525c8781ec0701ce824e8bd379ae1b129e26568
commit: 714309f0f3e32a52beca44460986caf8d9e143f3 drm/amdgpu: Fix FRU data c=
hecking
date:   7 months ago
:::::: branch date: 9 hours ago
:::::: commit date: 7 months ago
compiler: ia64-linux-gcc (GCC) 9.3.0

If you fix the issue, kindly add following tag as appropriate
Reported-by: kernel test robot <lkp@intel.com>


cppcheck possible warnings: (new ones prefixed by >>, may not real problems)

   In file included from drivers/gpu/drm/amd/amdgpu/../display/amdgpu_dm/am=
dgpu_dm_helpers.c:
>> drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c:811:6: warning=
: Variable 'res' is reassigned a value before the old one has been used. 'b=
reak;' missing? [redundantAssignInSwitch]
    res =3D 0;
        ^
   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c:768:0: note: V=
ariable 'res' is reassigned a value before the old one has been used. 'brea=
k;' missing?
    int res =3D -ENODEV;
   ^
   drivers/gpu/drm/amd/display/amdgpu_dm/amdgpu_dm_debugfs.c:811:6: note: V=
ariable 'res' is reassigned a value before the old one has been used. 'brea=
k;' missing?
    res =3D 0;
        ^
>> drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:524:17: warning: Boolean result =
is used in bitwise operation. Clarify expression with parentheses. [clarify=
Condition]
    if (!(!!enable ^ !!amdgpu_ras_is_feature_enabled(adev, head)))
                   ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_ras.c:573:17: warning: Boolean result =
is used in bitwise operation. Clarify expression with parentheses. [clarify=
Condition]
    if (!(!!enable ^ !!amdgpu_ras_is_feature_enabled(adev, head)))
                   ^
>> drivers/gpu/drm/amd/amdgpu/amdgpu_fru_eeprom.c:128:20: warning: Array 'a=
dev->product_name[32]' accessed at index 32, which is out of bounds. [array=
IndexOutOfBounds]
    adev->product_name[size] =3D '0';
                      ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_fru_eeprom.c:124:10: note: Assignment =
'size=3D32', assigned value is 32
     size =3D 32;
            ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_fru_eeprom.c:128:20: note: Array index=
 out of bounds
    adev->product_name[size] =3D '0';
                      ^
>> drivers/gpu/drm/amd/amdgpu/amdgpu_fru_eeprom.c:145:22: warning: Array 'a=
dev->product_number[16]' accessed at index 16, which is out of bounds. [arr=
ayIndexOutOfBounds]
    adev->product_number[size] =3D '0';
                        ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_fru_eeprom.c:142:10: note: Assignment =
'size=3D16', assigned value is 16
     size =3D 16;
            ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_fru_eeprom.c:145:22: note: Array index=
 out of bounds
    adev->product_number[size] =3D '0';
                        ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_fru_eeprom.c:171:14: warning: Array 'a=
dev->serial[16]' accessed at index 16, which is out of bounds. [arrayIndexO=
utOfBounds]
    adev->serial[size] =3D '0';
                ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_fru_eeprom.c:168:10: note: Assignment =
'size=3D16', assigned value is 16
     size =3D 16;
            ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_fru_eeprom.c:171:14: note: Array index=
 out of bounds
    adev->serial[size] =3D '0';
                ^
>> drivers/gpu/drm/amd/amdgpu/amdgpu_fru_eeprom.c:145:8: warning: Array 'ad=
ev.product_number[16]' accessed at index 16, which is out of bounds. [array=
IndexOutOfBounds]
    adev->product_number[size] =3D '0';
          ^
>> drivers/gpu/drm/amd/amdgpu/amdgpu_fru_eeprom.c:128:8: warning: Array 'ad=
ev.product_name[32]' accessed at index 32, which is out of bounds. [arrayIn=
dexOutOfBounds]
    adev->product_name[size] =3D '0';
          ^
   drivers/gpu/drm/amd/amdgpu/amdgpu_fru_eeprom.c:171:8: warning: Array 'ad=
ev.serial[16]' accessed at index 16, which is out of bounds. [arrayIndexOut=
OfBounds]
    adev->serial[size] =3D '0';
          ^
>> drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:4589:9: warning: Identical conditi=
on 'r', second condition is always false [identicalConditionAfterEarlyExit]
    return r;
           ^
   drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:4586:6: note: first condition
    if (r)
        ^
   drivers/gpu/drm/amd/amdgpu/gfx_v7_0.c:4589:9: note: second condition
    return r;
           ^
>> drivers/gpu/drm/amd/amdgpu/uvd_v4_2.c:354:2: warning: Shifting signed 32=
-bit value by 31 bits is undefined behaviour [shiftTooManyBitsSigned]
    WREG32(mmUVD_LMI_EXT40_ADDR, upper_32_bits(ring->gpu_addr) |
    ^
   drivers/gpu/drm/amd/amdgpu/uvd_v4_2.c:569:2: warning: Shifting signed 32=
-bit value by 31 bits is undefined behaviour [shiftTooManyBitsSigned]
    WREG32(mmUVD_LMI_EXT40_ADDR, addr | (0x9 << 16) | (0x1 << 31));
    ^
>> drivers/gpu/drm/amd/amdgpu/df_v3_6.c:524:8: warning: Shifting signed 32-=
bit value by 31 bits is undefined behaviour [shiftTooManyBitsSigned]
          DEFERRED_ARM_MASK;
          ^
   drivers/gpu/drm/amd/amdgpu/df_v3_6.c:527:9: warning: Shifting signed 32-=
bit value by 31 bits is undefined behaviour [shiftTooManyBitsSigned]
          ~DEFERRED_ARM_MASK;
           ^
   drivers/gpu/drm/amd/amdgpu/df_v3_6.c:545:6: warning: Shifting signed 32-=
bit value by 31 bits is undefined behaviour [shiftTooManyBitsSigned]
      & DEFERRED_ARM_MASK));
        ^
>> drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c:1180:4: warning: Variable 'r' is r=
eassigned a value before the old one has been used. 'break;' missing? [redu=
ndantAssignInSwitch]
    r =3D amdgpu_irq_add_id(adev, SOC15_IH_CLIENTID_VMC, VMC_1_0__SRCID__VM=
_FAULT,
      ^
   drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c:1112:4: note: Variable 'r' is reas=
signed a value before the old one has been used. 'break;' missing?
    r =3D amdgpu_atomfirmware_get_vram_info(adev,
      ^
   drivers/gpu/drm/amd/amdgpu/gmc_v9_0.c:1180:4: note: Variable 'r' is reas=
signed a value before the old one has been used. 'break;' missing?
    r =3D amdgpu_irq_add_id(adev, SOC15_IH_CLIENTID_VMC, VMC_1_0__SRCID__VM=
_FAULT,
      ^
>> drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c:798:4: warning: Variable 'r' is r=
eassigned a value before the old one has been used. 'break;' missing? [redu=
ndantAssignInSwitch]
    r =3D amdgpu_irq_add_id(adev, SOC15_IH_CLIENTID_VMC,
      ^
   drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c:772:4: note: Variable 'r' is reas=
signed a value before the old one has been used. 'break;' missing?
    r =3D amdgpu_atomfirmware_get_vram_info(adev,
      ^
   drivers/gpu/drm/amd/amdgpu/gmc_v10_0.c:798:4: note: Variable 'r' is reas=
signed a value before the old one has been used. 'break;' missing?
    r =3D amdgpu_irq_add_id(adev, SOC15_IH_CLIENTID_VMC,
      ^
>> drivers/gpu/drm/amd/amdgpu/sdma_v5_0.c:1123:6: warning: Shifting signed =
32-bit value by 31 bits is undefined behaviour [shiftTooManyBitsSigned]
        SDMA_PKT_POLL_REGMEM_HEADER_MEM_POLL(1));
        ^

vim +128 drivers/gpu/drm/amd/amdgpu/amdgpu_fru_eeprom.c

bd607166af7fe3 Kent Russell  2020-03-13   75  =

bd607166af7fe3 Kent Russell  2020-03-13   76  int amdgpu_fru_get_product_in=
fo(struct amdgpu_device *adev)
bd607166af7fe3 Kent Russell  2020-03-13   77  {
bd607166af7fe3 Kent Russell  2020-03-13   78  	unsigned char buff[32];
bd607166af7fe3 Kent Russell  2020-03-13   79  	int addrptr =3D 0, size =3D =
0;
bd607166af7fe3 Kent Russell  2020-03-13   80  =

fabe01d7bbda15 John Clements 2020-03-23   81  	if (!is_fru_eeprom_supported=
(adev))
fabe01d7bbda15 John Clements 2020-03-23   82  		return 0;
fabe01d7bbda15 John Clements 2020-03-23   83  =

bd607166af7fe3 Kent Russell  2020-03-13   84  	/* If algo exists, it means =
that the i2c_adapter's initialized */
bd607166af7fe3 Kent Russell  2020-03-13   85  	if (!adev->pm.smu_i2c.algo) {
bd607166af7fe3 Kent Russell  2020-03-13   86  		DRM_WARN("Cannot access FRU=
, EEPROM accessor not initialized");
bd607166af7fe3 Kent Russell  2020-03-13   87  		return 0;
bd607166af7fe3 Kent Russell  2020-03-13   88  	}
bd607166af7fe3 Kent Russell  2020-03-13   89  =

bd607166af7fe3 Kent Russell  2020-03-13   90  	/* There's a lot of repetiti=
on here. This is due to the FRU having
bd607166af7fe3 Kent Russell  2020-03-13   91  	 * variable-length fields. T=
o get the information, we have to find the
bd607166af7fe3 Kent Russell  2020-03-13   92  	 * size of each field, and t=
hen keep reading along and reading along
bd607166af7fe3 Kent Russell  2020-03-13   93  	 * until we get all of the d=
ata that we want. We use addrptr to track
bd607166af7fe3 Kent Russell  2020-03-13   94  	 * the address as we go
bd607166af7fe3 Kent Russell  2020-03-13   95  	 */
bd607166af7fe3 Kent Russell  2020-03-13   96  =

bd607166af7fe3 Kent Russell  2020-03-13   97  	/* The first fields are all =
of size 1-byte, from 0-7 are offsets that
bd607166af7fe3 Kent Russell  2020-03-13   98  	 * contain information that =
isn't useful to us.
bd607166af7fe3 Kent Russell  2020-03-13   99  	 * Bytes 8-a are all 1-byte =
and refer to the size of the entire struct,
bd607166af7fe3 Kent Russell  2020-03-13  100  	 * and the language field, s=
o just start from 0xb, manufacturer size
bd607166af7fe3 Kent Russell  2020-03-13  101  	 */
bd607166af7fe3 Kent Russell  2020-03-13  102  	addrptr =3D 0xb;
bd607166af7fe3 Kent Russell  2020-03-13  103  	size =3D amdgpu_fru_read_eep=
rom(adev, addrptr, buff);
bd607166af7fe3 Kent Russell  2020-03-13  104  	if (size < 1) {
bd607166af7fe3 Kent Russell  2020-03-13  105  		DRM_ERROR("Failed to read F=
RU Manufacturer, ret:%d", size);
bd607166af7fe3 Kent Russell  2020-03-13  106  		return size;
bd607166af7fe3 Kent Russell  2020-03-13  107  	}
bd607166af7fe3 Kent Russell  2020-03-13  108  =

bd607166af7fe3 Kent Russell  2020-03-13  109  	/* Increment the addrptr by =
the size of the field, and 1 due to the
bd607166af7fe3 Kent Russell  2020-03-13  110  	 * size field being 1 byte. =
This pattern continues below.
bd607166af7fe3 Kent Russell  2020-03-13  111  	 */
bd607166af7fe3 Kent Russell  2020-03-13  112  	addrptr +=3D size + 1;
bd607166af7fe3 Kent Russell  2020-03-13  113  	size =3D amdgpu_fru_read_eep=
rom(adev, addrptr, buff);
bd607166af7fe3 Kent Russell  2020-03-13  114  	if (size < 1) {
bd607166af7fe3 Kent Russell  2020-03-13  115  		DRM_ERROR("Failed to read F=
RU product name, ret:%d", size);
bd607166af7fe3 Kent Russell  2020-03-13  116  		return size;
bd607166af7fe3 Kent Russell  2020-03-13  117  	}
bd607166af7fe3 Kent Russell  2020-03-13  118  =

714309f0f3e32a Kent Russell  2020-03-24  119  	/* Product name should only =
be 32 characters. Any more,
714309f0f3e32a Kent Russell  2020-03-24  120  	 * and something could be wr=
ong. Cap it@32 to be safe
714309f0f3e32a Kent Russell  2020-03-24  121  	 */
714309f0f3e32a Kent Russell  2020-03-24  122  	if (size > 32) {
714309f0f3e32a Kent Russell  2020-03-24  123  		DRM_WARN("FRU Product Numbe=
r is larger than 32 characters. This is likely a mistake");
714309f0f3e32a Kent Russell  2020-03-24  124  		size =3D 32;
714309f0f3e32a Kent Russell  2020-03-24  125  	}
bd607166af7fe3 Kent Russell  2020-03-13  126  	/* Start at 2 due to buff us=
ing fields 0 and 1 for the address */
bd607166af7fe3 Kent Russell  2020-03-13  127  	memcpy(adev->product_name, &=
buff[2], size);
bd607166af7fe3 Kent Russell  2020-03-13 @128  	adev->product_name[size] =3D=
 '\0';
bd607166af7fe3 Kent Russell  2020-03-13  129  =

bd607166af7fe3 Kent Russell  2020-03-13  130  	addrptr +=3D size + 1;
bd607166af7fe3 Kent Russell  2020-03-13  131  	size =3D amdgpu_fru_read_eep=
rom(adev, addrptr, buff);
bd607166af7fe3 Kent Russell  2020-03-13  132  	if (size < 1) {
bd607166af7fe3 Kent Russell  2020-03-13  133  		DRM_ERROR("Failed to read F=
RU product number, ret:%d", size);
bd607166af7fe3 Kent Russell  2020-03-13  134  		return size;
bd607166af7fe3 Kent Russell  2020-03-13  135  	}
bd607166af7fe3 Kent Russell  2020-03-13  136  =

714309f0f3e32a Kent Russell  2020-03-24  137  	/* Product number should onl=
y be 16 characters. Any more,
714309f0f3e32a Kent Russell  2020-03-24  138  	 * and something could be wr=
ong. Cap it@16 to be safe
714309f0f3e32a Kent Russell  2020-03-24  139  	 */
714309f0f3e32a Kent Russell  2020-03-24  140  	if (size > 16) {
714309f0f3e32a Kent Russell  2020-03-24  141  		DRM_WARN("FRU Product Numbe=
r is larger than 16 characters. This is likely a mistake");
714309f0f3e32a Kent Russell  2020-03-24  142  		size =3D 16;
714309f0f3e32a Kent Russell  2020-03-24  143  	}
bd607166af7fe3 Kent Russell  2020-03-13  144  	memcpy(adev->product_number,=
 &buff[2], size);
bd607166af7fe3 Kent Russell  2020-03-13 @145  	adev->product_number[size] =
=3D '\0';

:::::: The code at line 128 was first introduced by commit
:::::: bd607166af7fe31f8d8e9c575f4561a4b56b9f24 drm/amdgpu: Enable reading =
FRU chip via I2C v3

:::::: TO: Kent Russell <kent.russell@amd.com>
:::::: CC: Alex Deucher <alexander.deucher@amd.com>

---
0-DAY CI Kernel Test Service, Intel Corporation
https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
--===============5555961863037908915==--

