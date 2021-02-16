fig = figure;
set(fig, 'Position', [0 0 1920 1080])

plot(info_x.TrainingLoss, 'Color', 'red', 'LineWidth', 1)
hold on
plot(info_y.TrainingLoss, 'Color', 'blue', 'LineWidth', 1)
plot(info_z.TrainingLoss, 'Color', 'green', 'LineWidth', 1)
legend('X', 'Y', 'Z')
xlabel('Iteration')
ylabel('Loss')
grid on
title('Training Loss')
set(gca, 'fontsize', 15)

fig = figure;
set(fig, 'Position', [0 0 1920 1080])

plot(info_x.TrainingAccuracy, 'Color', 'red', 'LineWidth', 1)
hold on
plot(info_y.TrainingAccuracy, 'Color', 'blue', 'LineWidth', 1)
plot(info_z.TrainingAccuracy, 'Color', 'green', 'LineWidth', 1)
legend('X', 'Y', 'Z')
xlabel('Iteration')
ylabel('Accuracy(%)')
grid on
title('Training Accuracy')
set(gca, 'fontsize', 15)

fig = figure;
set(fig, 'Position', [0 0 1920 1080])

plot(rmmissing(info_x.ValidationLoss), 'Color', 'red', 'LineWidth', 1)
hold on
plot(rmmissing(info_y.ValidationLoss), 'Color', 'blue', 'LineWidth', 1)
plot(rmmissing(info_z.ValidationLoss), 'Color', 'green', 'LineWidth', 1)
legend('X', 'Y', 'Z')
xlabel('Iteration')
ylabel('Loss')
grid on
title('Validation Loss')
set(gca, 'fontsize', 15)

fig = figure;
set(fig, 'Position', [0 0 1920 1080])

plot(rmmissing(info_x.ValidationAccuracy), 'Color', 'red', 'LineWidth', 1)
hold on
plot(rmmissing(info_y.ValidationAccuracy), 'Color', 'blue', 'LineWidth', 1)
plot(rmmissing(info_z.ValidationAccuracy), 'Color', 'green', 'LineWidth', 1)
legend('X', 'Y', 'Z')
xlabel('Iteration')
ylabel('Accuracy(%)')
grid on
title('Validation Accuracy')
set(gca, 'fontsize', 15)