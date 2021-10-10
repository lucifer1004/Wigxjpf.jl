using Wigxjpf
using Test

@testset "Wigxjpf.jl" begin
    Wigxjpf.wig_table_init(400, 9)
    Wigxjpf.wig_temp_init(400)

    @testset "Evaluate Wigner 3-j symbols" begin
        @test begin
            Wigxjpf.wig3jj(3, 3, 2, 3, -1, -2) ≈ -0.316227766016838
        end
        @test begin
            Wigxjpf.wig3jj(2, 4, 8, 2, -4, 2) ≈ 0.0
        end
        @test begin
            Wigxjpf.wig3jj(2, 4, 2, 2, 2, -4) ≈ 0.0
        end
        @test begin
            Wigxjpf.wig3jj(2, 4, 6, 1, -1, 0) ≈ 0.0
        end
        @test begin
            Wigxjpf.wig3jj(2, 2, 2, 2, 0, -2) ≈ -0.408248290463863
        end
        @test begin
            Wigxjpf.wig3jj(6, 6, 6, -2, -2, 4) ≈ 0.0
        end
        @test begin
            Wigxjpf.wig3jj(7, 5, 4, 7, -3, -4) ≈ -0.235702260395516
        end
        @test begin
            Wigxjpf.wig3jj(15, 15, 0, 3, -3, 0) ≈ 0.25
        end
        @test begin
            Wigxjpf.wig3jj(16, 11, 9, 4, -7, 3) ≈ -0.120622637445762
        end
        @test begin
            Wigxjpf.wig3jj(16, 14, 12, 6, 0, -6) ≈ 0.0
        end
        @test begin
            Wigxjpf.wig3jj(30, 60, 80, 4, 4, -8) ≈ -0.0190815797991916
        end
        @test begin
            Wigxjpf.wig3jj(60, 60, 60, 0, 30, -30) ≈ -0.0152857154897839
        end
        @test begin
            Wigxjpf.wig3jj(286, 200, 120, -20, 120, -100) ≈ 4.16710792865494e-10
        end
        @test begin
            Wigxjpf.wig3jj(320, 200, 120, -20, 120, -100) ≈ 3.81124616116626e-21
        end
        @test begin
            Wigxjpf.wig3jj(400, 400, 400, -20, 120, -100) ≈ 0.000749392731398951
        end
        @test begin
            Wigxjpf.wig3jj(140, 150, 160, 40, -80, 40) ≈ -0.00845794815539587
        end
    end

    @testset "Evaluate Wigner 6-j symbols" begin
        @test begin
    Wigxjpf.wig6jj(4, 4, 2, 4, 2, 2) ≈ -0.1
        end
        @test begin
            Wigxjpf.wig6jj(2, 2, 0, 4, 4, 2) ≈ 0.258198889747161
        end
        @test begin
            Wigxjpf.wig6jj(2, 2, 2, 4, 4, 2) ≈ -0.223606797749979
        end
        @test begin
            Wigxjpf.wig6jj(2, 2, 4, 4, 4, 2) ≈ 0.152752523165195
        end
        @test begin
            Wigxjpf.wig6jj(2, 2, 0, 4, 4, 4) ≈ -0.258198889747161
        end
        @test begin
            Wigxjpf.wig6jj(2, 2, 0, 4, 4, 2) ≈ 0.258198889747161
        end
        @test begin
            Wigxjpf.wig6jj(2, 2, 2, 4, 4, 4) ≈ 0.074535599249993
        end
        @test begin
            Wigxjpf.wig6jj(2, 2, 2, 4, 4, 2) ≈ -0.223606797749979
        end
        @test begin
            Wigxjpf.wig6jj(2, 2, 4, 4, 4, 4) ≈ 0.152752523165195
        end
        @test begin
            Wigxjpf.wig6jj(2, 2, 4, 4, 4, 2) ≈ 0.152752523165195
        end
        @test begin
            Wigxjpf.wig6jj(4, 4, 2, 4, 2, 4) ≈ 0.152752523165195
        end
        @test begin
            Wigxjpf.wig6jj(7, 6, 3, 2, 3, 6) ≈ 0.0
        end
        @test begin
            Wigxjpf.wig6jj(8, 8, 2, 8, 6, 2) ≈ -0.0277777777777778
        end
            @test begin
            Wigxjpf.wig6jj(12, 12, 8, 9, 7, 11) ≈ 0.0378232878232878
        end
        @test begin
            Wigxjpf.wig6jj(13, 12, 3, 6, 7, 12) ≈ 0.0
        end
        @test begin
            Wigxjpf.wig6jj(16, 16, 16, 16, 14, 14) ≈ 0.020221595293569
        end
        @test begin
            Wigxjpf.wig6jj(16, 16, 16, 16, 16, 16) ≈ -0.0126520807231535
        end
        @test begin
            Wigxjpf.wig6jj(40, 40, 40, 40, 40, 40) ≈ -0.00502940645686796
        end
        @test begin
            Wigxjpf.wig6jj(256, 240, 144, 224, 96, 160) ≈ 1.19377022891155e-17
            end
        @test begin
            Wigxjpf.wig6jj(460, 160, 300, 380, 460, 240) ≈ 2.42701001304468e-24
        end
        @test begin
            Wigxjpf.wig6jj(400, 400, 400, 400, 400, 400) ≈ 0.000155903212413242
        end
        @test begin
            Wigxjpf.wig6jj(160, 140, 120, 120, 140, 160) ≈ 0.000271672365647525
        end
    end
    @testset "Evaluate Wigner 9-j symbols" begin
        @test begin
            Wigxjpf.wig9jj(2, 4, 6, 2, 4, 6, 0, 4, 4) ≈ 0.03614031611621
        end
        @test begin
            Wigxjpf.wig9jj(1, 3, 4, 3, 1, 4, 2, 2, 0) ≈ 0.0645497224367903
        end
        @test begin
            Wigxjpf.wig9jj(2, 4, 6, 6, 4, 8, 4, 6, 10) ≈ -0.00141609931936472
        end
        @test begin
            Wigxjpf.wig9jj(2, 4, 6, 6, 4, 8, 4, 8, 10) ≈ 0.00793146728313409
        end
        @test begin
            Wigxjpf.wig9jj(2, 4, 6, 6, 4, 8, 6, 4, 10) ≈ 0.00759958641837765
        end
        @test begin
            Wigxjpf.wig9jj(2, 4, 6, 6, 4, 8, 6, 6, 10) ≈ 0.00851133416822978
        end
        @test begin
            Wigxjpf.wig9jj(2, 4, 6, 6, 4, 8, 8, 2, 10) ≈ 0.0108588135723727
        end
        @test begin
            Wigxjpf.wig9jj(2, 4, 6, 6, 4, 8, 8, 4, 10) ≈ 0.00335110262166189
        end
        @test begin
            Wigxjpf.wig9jj(2, 4, 6, 6, 4, 8, 8, 6, 10) ≈ -0.0050301051199454
        end
        @test begin
            Wigxjpf.wig9jj(2, 4, 6, 6, 4, 8, 8, 8, 10) ≈ 0.00012246297616039
        end
        @test begin
            Wigxjpf.wig9jj(2, 4, 6, 4, 6, 8, 6, 8, 10) ≈ -0.000922146636432351
        end
        @test begin
            Wigxjpf.wig9jj(2, 6, 4, 3, 5, 4, 1, 1, 0) ≈ -0.0281718084909506
        end
        @test begin
            Wigxjpf.wig9jj(6, 8, 4, 7, 7, 4, 1, 1, 2) ≈ 0.0230021853114118
        end
        @test begin
            Wigxjpf.wig9jj(2, 6, 8, 1, 7, 6, 1, 1, 2) ≈ -0.00595238095238095
        end
        @test begin
            Wigxjpf.wig9jj(6, 7, 7, 5, 6, 7, 1, 1, 2) ≈ -0.00215400852516591
        end
        @test begin
            Wigxjpf.wig9jj(17, 19, 14, 25, 16, 17, 16, 21, 19) ≈
            0.000281298301912545
        end
        @test begin
        Wigxjpf.wig9jj(30, 30, 30, 30, 6, 30, 30, 36, 20) ≈
            -7.78324615309539e-05
        end
        @test begin
        Wigxjpf.wig9jj(90, 60, 40, 90, 30, 70, 180, 90, 90) ≈
            -6.51130967998823e-07
        end
        @test begin
            Wigxjpf.wig9jj(120, 140, 260, 100, 140, 240, 120, 100, 80) ≈
            5.35253924139905e-16
        end
        @test begin
            Wigxjpf.wig9jj(200, 160, 100, 100, 200, 140, 120, 100, 200) ≈
            1.05597798065761e-07
        end
        @test begin
            Wigxjpf.wig9jj(10, 1, 9, 10, 1, 11, 18, 2, 20) ≈ 0.00257786760370727
        end
        @test begin
            Wigxjpf.wig9jj(30, 30, 60, 30, 6, 30, 30, 36, 60) ≈
            0.000168384777511567
        end
        @test begin
            Wigxjpf.wig9jj(40, 20, 60, 60, 60, 120, 20, 40, 60) ≈
            0.000268744961031981
        end
        @test begin
            Wigxjpf.wig9jj(60, 40, 20, 60, 20, 40, 120, 60, 60) ≈
            0.000268744961031981
        end
        @test begin
            Wigxjpf.wig9jj(90, 60, 40, 90, 30, 70, 180, 90, 90) ≈
            -6.51130967998823e-07
        end
        @test begin
            Wigxjpf.wig9jj(100, 102, 104, 106, 108, 110, 112, 114, 116) ≈
            4.18840599233205e-06
        end
        @test begin
            Wigxjpf.wig9jj(148, 134, 120, 164, 120, 140, 20, 40, 60) ≈
            4.94488048916531e-06
        end
        @test begin
            Wigxjpf.wig9jj(168, 180, 122, 120, 128, 80, 104, 80, 60) ≈
            -7.94917060961424e-08
        end
        @test begin
            Wigxjpf.wig9jj(188, 134, 172, 122, 146, 104, 140, 120, 160) ≈
            -1.86808574631986e-07
        end
        @test begin
            Wigxjpf.wig9jj(120, 140, 230, 100, 140, 220, 120, 100, 80) ≈
            -1.36799650122649e-06
        end
        @test begin
            Wigxjpf.wig9jj(200, 160, 100, 100, 200, 140, 120, 100, 200) ≈
            1.05597798065761e-07
        end
        @test begin
            Wigxjpf.wig9jj(40, 40, 80, 40, 40, 80, 40, 40, 80) ≈
            0.000111633558388972
        end
    end

    Wigxjpf.wig_temp_free()
    Wigxjpf.wig_table_free()
end
