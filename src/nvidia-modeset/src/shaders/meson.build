shader_compress = generator(find_program('xz'),
	arguments : ['-ce', '-C', 'none', '@INPUT@'],
	capture : true,
	output : '@PLAINNAME@.xz')

shader_pack_obj = generator(find_program('../../../../build-nvidia-open/shader-ld.sh'),
	arguments : [
		find_program(host_machine.cpu_family() + '-' + host_machine.system() + '-gnu-ld').full_path(),
		'@INPUT@',
		'@OUTPUT@'
	],
	output : '@PLAINNAME@.o-dirty')

shader_objcopy = generator(find_program(host_machine.cpu_family() + '-' + host_machine.system() + '-gnu-objcopy'),
	arguments : ['--rename-section', '.data=.rodata,contents,alloc,load,data,readonly', '@INPUT@', '@OUTPUT@'],
	output : '@BASENAME@.o')

embed_shaders = [
	'g_maxwell_shaders',
	'g_pascal_shaders',
	'g_volta_shaders',
	'g_turing_shaders',
	'g_ampere_shaders',
	'g_hopper_shaders',
	'g_blackwell_shaders',
	'g_gb20x_shaders',
]

embed_shaders_xz = shader_compress.process(embed_shaders)
embed_shaders_xz_o = shader_pack_obj.process(embed_shaders_xz)
embedded_shaders = shader_objcopy.process(embed_shaders_xz_o)
